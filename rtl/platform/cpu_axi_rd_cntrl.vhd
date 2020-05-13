-- AXi4 read controller for cpu

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.cpu_pack.all;

entity cpu_axi_rd_cntrl is
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
        -- memory read
        mem_rd_en          : in  std_logic;
        mem_rd_addr        : in  std_logic_vector(cpu_addr_width-1 downto 0);
        mem_rd_data        : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
        mem_rd_ready       : in  std_logic;
        mem_rd_valid       : out std_logic;
        -- cache
        mem_cache_line     : in  std_logic;
        -- master AXI4-full read 
        axi_arid           : out std_logic_vector(-1 downto 0);
        axi_araddr         : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
        axi_arlen          : out std_logic_vector(7 downto 0);
        axi_arsize         : out std_logic_vector(2 downto 0);
        axi_arburst        : out std_logic_vector(1 downto 0);
        axi_arlock         : out std_logic;
        axi_arcache        : out std_logic_vector(3 downto 0);
        axi_arprot         : out std_logic_vector(2 downto 0);
        axi_arqos          : out std_logic_vector(3 downto 0);
        axi_arregion       : out std_logic_vector(3 downto 0);
        axi_aruser         : out std_logic_vector(0 downto 0);
        axi_arvalid        : out std_logic;
        axi_arready        : in  std_logic;
        axi_rid            : in  std_logic_vector(-1 downto 0);
        axi_rdata          : in  std_logic_vector(cpu_data_width-1 downto 0);
        axi_rresp          : in  std_logic_vector(1 downto 0);
        axi_rlast          : in  std_logic;
        axi_ruser          : in  std_logic_vector(0 downto 0);
        axi_rvalid         : in  std_logic;
        axi_rready         : out std_logic
	);
end cpu_axi_rd_cntrl;

architecture Behavioral of cpu_axi_rd_cntrl is
    constant bytes_per_cpu_word         : integer := cpu_data_width/8;
    constant words_per_cache_line       : integer := 2**cache_offset_width/bytes_per_cpu_word;
    constant axi_burst_len_noncacheable : integer := 0;
    constant axi_burst_len_cacheable    : integer := words_per_cache_line-1;
    type state_type is (STATE_WAIT, STATE_READ);
    signal state                        : state_type := STATE_WAIT;
    signal count                        : integer range 0 to words_per_cache_line;
    signal mem_rd_valid_buff            : std_logic := '0';
    signal axi_finished                 : boolean := False;
    signal axi_arlen_buff               : std_logic_vector(7 downto 0) := (others=>'0');
    signal axi_arvalid_buff             : std_logic := '0';
    signal axi_rready_buff              : std_logic := '0';
    constant fifo_index_width           : integer := cache_offset_width-clogb2(cpu_data_width/8);
    type fifo_type is array(0 to 2**fifo_index_width-1) of std_logic_vector(cpu_data_width-1 downto 0);
    signal fifo                         : fifo_type := (others=>(others=>'0'));
    signal m_ptr                        : integer range 0 to 2**fifo_index_width-1 := 0;
    signal c_ptr                        : integer range 0 to 2**fifo_index_width-1 := 0;
begin
    axi_arburst  <= "01";
    axi_arlock   <= '0';
    axi_arcache  <= "0000";
    axi_arprot   <= "000";
    axi_arid     <= (others=>'0');
    axi_arqos    <= (others=>'0');
    axi_arregion <= (others=>'0');
    axi_aruser   <= (others=>'0');
    axi_arlen    <= axi_arlen_buff;
    axi_arsize   <= std_logic_vector(to_unsigned(clogb2(bytes_per_cpu_word),axi_arsize'length));
    axi_arvalid  <= axi_arvalid_buff;
    axi_rready   <= axi_rready_buff;

    mem_rd_valid <= mem_rd_valid_buff;
    mem_rd_data  <= fifo(c_ptr);
    
    process (aclk)
        variable burst_len : integer range 0 to 2**axi_arlen'length-1;
    begin
        if rising_edge(aclk) then
            if aresetn='0' then
                axi_arvalid_buff  <= '0';
                axi_rready_buff   <= '0';
                mem_rd_valid_buff <= '0';
                state             <= STATE_WAIT;
            else
                case state is
                    -----------------------------
                    --       WAIT
                    -----------------------------
                    when STATE_WAIT =>
                        if mem_rd_en='1' then
                            axi_araddr <= mem_rd_addr;
                            if mem_cache_line='1' then
                                burst_len := axi_burst_len_cacheable;
                            else
                                burst_len := axi_burst_len_noncacheable;
                            end if;
                            axi_arlen_buff <= std_logic_vector(to_unsigned(burst_len,axi_arlen'length));
                            count          <= 0;
                            c_ptr          <= 0;
                            m_ptr          <= 0;
                            axi_finished   <= False;
                            if axi_arvalid_buff='1' and axi_arready='1' then
                                axi_arvalid_buff <= '0';
                                axi_rready_buff  <= '1';
                                state            <= STATE_READ;
                            else
                                axi_arvalid_buff <= '1';
                            end if;
                        end if;
                    -----------------------------
                    --       READ
                    -----------------------------
                    when STATE_READ=>                
                        if axi_rvalid='1' and axi_rready_buff='1' then
                            fifo(m_ptr) <= axi_rdata;
                        end if;                   
                        if m_ptr/=c_ptr and mem_rd_valid_buff='1' and mem_rd_ready='1' then
                            if (c_ptr=2**fifo_index_width-1) then
                                c_ptr <= 0;
                            else
                                c_ptr <= c_ptr+1;
                            end if;
                        end if;
                        if axi_rvalid='1' and axi_rready_buff='1' and ((m_ptr+1) mod 2**fifo_index_width)/=c_ptr then
                            if (m_ptr=2**fifo_index_width-1) then
                                m_ptr <= 0;
                            else
                                m_ptr <= m_ptr+1;
                            end if;
                        end if;
                        if mem_rd_valid_buff='1' and mem_rd_ready='1' and count/=axi_arlen_buff then
                            count <= count+1;
                        end if;                    
                        if axi_rvalid='1' and axi_rready_buff='1' and axi_rlast='1' then
                            axi_finished <= True;
                        end if;                    
                        if (axi_rvalid='1' and axi_rready_buff='1' and axi_rlast='1') or axi_finished then
                            axi_rready_buff <= '0';
                        elsif ((m_ptr+1) mod 2**fifo_index_width)/=c_ptr or (burst_len=0 and axi_rready_buff='1' and not axi_finished) then
                            axi_rready_buff <= '1';
                        else
                            axi_rready_buff <= '0';
                        end if;
                        if (mem_rd_valid_buff='1' and mem_rd_ready='1' and count=axi_arlen_buff) or (mem_rd_valid_buff='1' and burst_len=0) then
                            mem_rd_valid_buff <= '0';
                        elsif m_ptr/=c_ptr or (burst_len=0 and axi_finished) then
                            mem_rd_valid_buff <= '1';
                        else
                            mem_rd_valid_buff <= '0';
                        end if;                 
                        if mem_rd_valid_buff='1' and mem_rd_ready='1' and count=axi_arlen_buff then
                            state <= STATE_WAIT;
                        end if;
                    -----------------------------
                    --       OTHERS
                    -----------------------------
                    when others =>
                end case;
            end if;
        end if;
    end process;

end Behavioral;
