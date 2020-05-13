-- AXI4 write controller for cpu

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.cpu_pack.all;

entity cpu_axi_wr_cntrl is
    generic(
        -- mlite params
        cpu_addr_width     : integer := 32;
        cpu_data_width     : integer := 32;
        -- cache params
        cache_offset_width : integer := 4
	);
    port(
        aclk               : in  std_logic;
        aresetn            : in  std_logic;
        -- memory write
        mem_wr_en          : in  std_logic;
        mem_wr_addr        : in  std_logic_vector(cpu_addr_width-1 downto 0);
        mem_wr_data        : in  std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
        mem_wr_strobe      : in  std_logic_vector(cpu_data_width/8-1 downto 0);
        mem_wr_ready       : out std_logic;
        mem_wr_valid       : in  std_logic;
        -- cache
        mem_cache_line     : in  std_logic;
        -- master AXI4-full write 
        axi_awid           : out std_logic_vector(-1 downto 0);
        axi_awaddr         : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
        axi_awlen          : out std_logic_vector(7 downto 0);
        axi_awsize         : out std_logic_vector(2 downto 0);
        axi_awburst        : out std_logic_vector(1 downto 0);
        axi_awlock         : out std_logic;
        axi_awcache        : out std_logic_vector(3 downto 0);
        axi_awprot         : out std_logic_vector(2 downto 0);
        axi_awqos          : out std_logic_vector(3 downto 0);
        axi_awregion       : out std_logic_vector(3 downto 0);
        axi_awuser         : out std_logic_vector(0 downto 0);
        axi_awvalid        : out std_logic;
        axi_awready        : in  std_logic;
        axi_wdata          : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
        axi_wstrb          : out std_logic_vector(cpu_data_width/8-1 downto 0) := (others=>'0');
        axi_wlast          : out std_logic := '0';
        axi_wuser          : out std_logic_vector(0 downto 0);
        axi_wvalid         : out std_logic;
        axi_wready         : in  std_logic;
        axi_bid            : in  std_logic_vector(-1 downto 0);
        axi_bresp          : in  std_logic_vector(1 downto 0);
        axi_buser          : in  std_logic_vector(0 downto 0);
        axi_bvalid         : in  std_logic;
        axi_bready         : out std_logic
	);
end cpu_axi_wr_cntrl;

architecture Behavioral of cpu_axi_wr_cntrl is
    constant bytes_per_cpu_word         : integer := cpu_data_width/8;
    constant words_per_cache_line       : integer := 2**cache_offset_width/bytes_per_cpu_word;
    constant axi_burst_len_noncacheable : integer := 0;
    constant axi_burst_len_cacheable    : integer := words_per_cache_line-1;
    type state_type is (STATE_WAIT, STATE_WRITE, STATE_RESPONSE);
    signal state                        : state_type := STATE_WAIT;
    signal count                        : integer range 0 to words_per_cache_line;
    signal mem_wr_ready_buff            : std_logic := '0';
    signal axi_awlen_buff               : std_logic_vector(7 downto 0) := (others=>'0');
    signal axi_awvalid_buff             : std_logic := '0';
    signal axi_wvalid_buff              : std_logic := '0';
    signal axi_wlast_buff               : std_logic := '0';
    signal axi_bready_buff              : std_logic := '0';
    signal finished                     : boolean;
    constant fifo_index_width           : integer := cache_offset_width-clogb2(cpu_data_width/8);
    type fifo_type       is array(0 to 2**fifo_index_width-1) of std_logic_vector(cpu_data_width-1 downto 0);
    type cntrl_fifo_type is array(0 to 2**fifo_index_width-1) of std_logic_vector((cpu_data_width/8+1)-1 downto 0);
    signal fifo                         : fifo_type := (others=>(others=>'0'));
    signal cntrl_fifo                   : cntrl_fifo_type := (others=>(others=>'0'));
    signal m_ptr                        : integer range 0 to 2**fifo_index_width-1 := 0;
    signal c_ptr                        : integer range 0 to 2**fifo_index_width-1 := 0;
begin
    axi_awburst     <= "01";
    axi_awlock      <= '0';
    axi_awcache     <= "0000";
    axi_awprot      <= "000";
    axi_awid        <= (others=>'0');
    axi_awqos       <= (others=>'0');
    axi_awregion    <= (others=>'0');
    axi_awuser      <= (others=>'0');
    axi_awlen       <= axi_awlen_buff;
    axi_awsize      <= std_logic_vector(to_unsigned(clogb2(bytes_per_cpu_word),axi_awsize'length));
    axi_awvalid     <= axi_awvalid_buff;
    axi_wvalid      <= axi_wvalid_buff;
    axi_wlast       <= axi_wlast_buff;   
    axi_bready      <= axi_bready_buff;   
    axi_wuser       <= (others=>'0');
    axi_wdata       <= fifo(m_ptr);
    axi_wlast_buff  <= '0' when axi_awlen_buff=x"00" and (not (axi_wvalid_buff='1' and axi_wready='1')) else
                        cntrl_fifo(m_ptr)(cpu_data_width/8);
    axi_wstrb       <= (others=>'0') when axi_awlen_buff=x"00" and (not (axi_wready='1' and finished)) else
                        cntrl_fifo(m_ptr)(cpu_data_width/8-1 downto 0);

    mem_wr_ready    <= mem_wr_ready_buff;

    process (aclk)
        variable burst_len : integer range 0 to 2**axi_awlen'length-1;
    begin
        if rising_edge(aclk) then
            if aresetn='0' then
                state <= STATE_WAIT;
            else
                case state is
                    -----------------------------
                    --       WAIT
                    -----------------------------
                    when STATE_WAIT=>
                        if mem_wr_en='1' then
                            axi_awaddr <= mem_wr_addr;
                            if mem_cache_line='1' then
                                burst_len := axi_burst_len_cacheable;
                            else
                                burst_len := axi_burst_len_noncacheable;
                            end if;
                            axi_awlen_buff <= std_logic_vector(to_unsigned(burst_len,axi_awlen'length));
                            count          <= 0;
                            m_ptr          <= 0;
                            c_ptr          <= 0;
                            cntrl_fifo     <= (others=>(others=>'0'));
                            finished       <= False;
                            if axi_awvalid_buff='1' and axi_awready='1' then
                                axi_awvalid_buff  <= '0';
                                mem_wr_ready_buff <= '1';
                                state             <= STATE_WRITE;
                            else
                                axi_awvalid_buff  <= '1';
                            end if;
                        end if;
                    -----------------------------
                    --       WRITE
                    -----------------------------
                    when STATE_WRITE=>
                        if mem_wr_valid='1' and mem_wr_ready_buff='1' then
                            fifo(c_ptr) <= mem_wr_data;
                            cntrl_fifo(c_ptr)(cpu_data_width/8-1 downto 0) <= mem_wr_strobe;
                            if count=axi_awlen_buff or burst_len=0 then
                                cntrl_fifo(c_ptr)(cpu_data_width/8) <= '1';
                            else
                                cntrl_fifo(c_ptr)(cpu_data_width/8) <= '0';
                            end if;
                        end if;
                        if c_ptr/=m_ptr and axi_wvalid_buff='1' and axi_wready='1' then
                            if m_ptr=2**fifo_index_width-1 then
                                m_ptr <= 0;
                            else
                                m_ptr <= m_ptr+1;
                            end if;
                        end if;
                        if mem_wr_valid='1' and mem_wr_ready_buff='1' and ((c_ptr+1)mod 2**fifo_index_width)/=m_ptr then
                            if c_ptr=2**fifo_index_width-1 then
                                c_ptr <= 0;
                            else
                                c_ptr <= c_ptr+1;
                            end if;
                        end if;
                        if mem_wr_valid='1' and mem_wr_ready_buff='1' and count/=axi_awlen_buff then
                            count <= count+1;
                        end if;
                        if mem_wr_valid='1' and mem_wr_ready_buff='1' and count=axi_awlen_buff then
                            finished <= True;
                        end if;
                        if (mem_wr_valid='1' and mem_wr_ready_buff='1' and count=axi_awlen_buff) or finished then
                            mem_wr_ready_buff <= '0';
                        elsif ((c_ptr+1)mod 2**fifo_index_width)/=m_ptr then
                            mem_wr_ready_buff <= '1';
                        else
                            mem_wr_ready_buff <= '0';
                        end if;
                        if axi_wvalid_buff='1' and axi_wready='1' and axi_wlast_buff='1' then
                            axi_wvalid_buff <= '0';
                        elsif c_ptr/=m_ptr or (burst_len=0 and finished) then
                            axi_wvalid_buff <= '1';
                        else
                            axi_wvalid_buff <= '0';
                        end if;
                    
                        if axi_wvalid_buff='1' and axi_wready='1' and axi_wlast_buff='1' then
                            axi_bready_buff <= '1';
                            state           <= STATE_RESPONSE;
                        end if;
                    -----------------------------
                    --       RESPONSE
                    -----------------------------
                    when STATE_RESPONSE=>
                        if axi_bvalid='1' and axi_bready_buff='1' then
                            axi_bready_buff <= '0';
                            if axi_bresp="00" then
                                state <= STATE_WAIT;
                            end if;  
                        end if;
                    -----------------------------
                    --      OTHERS
                    -----------------------------
                    when others=> 
                end case;
            end if;
        end if;
    end process;

end Behavioral;
