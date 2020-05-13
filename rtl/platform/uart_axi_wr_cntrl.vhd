-- AXI4-Lite write controller for UART

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use work.uart_pack.all;

entity uart_axi_wr_cntrl is
    generic (
        log_file          : string  := "UNUSED";
        fifo_depth        : integer := 8;
        axi_address_width : integer := 32;
        axi_data_width    : integer := 32
    );
    port (
        aclk              : in std_logic;
        aresetn           : in std_logic;
        axi_awaddr        : in std_logic_vector(axi_address_width-1 downto 0);
        axi_awprot        : in std_logic_vector(2 downto 0);
        axi_awvalid       : in std_logic;
        axi_awready       : out std_logic;
        axi_wvalid        : in std_logic;
        axi_wready        : out std_logic;
        axi_wdata         : in std_logic_vector(axi_data_width-1 downto 0);
        axi_wstrb         : in std_logic_vector(axi_data_width/8-1 downto 0);
        axi_bvalid        : out std_logic;
        axi_bready        : in std_logic;
        axi_bresp         : out std_logic_vector(1 downto 0);
        out_fifo          : out std_logic_vector(7 downto 0);
        out_fifo_valid    : out std_logic;
        out_fifo_ready    : in std_logic;
        in_avail          : out std_logic;
        fifo_level        : out std_logic
    );
end uart_axi_wr_cntrl;

architecture Behavioral of uart_axi_wr_cntrl is

    component uart_fifo is
        generic (
            FIFO_WIDTH : positive := 32;
            FIFO_DEPTH : positive := 1024
        );
        port (
            clock      : in std_logic;
            nreset     : in std_logic;
            wr_data    : in std_logic_vector(FIFO_WIDTH-1 downto 0);
            rd_data    : out std_logic_vector(FIFO_WIDTH-1 downto 0);
            wr_en      : in std_logic;
            rd_en      : in std_logic;
            full       : out std_logic;
            empty      : out std_logic;
            level      : out std_logic_vector(clogb2(FIFO_DEPTH)-1 downto 0)
        );
    end component;

    type state_type is (STATE_WAIT,STATE_WRITE,STATE_RESPONSE);
    signal state            : state_type := STATE_WAIT;
    signal axi_awready_buff : std_logic := '0';
    signal axi_awaddr_buff  : std_logic_vector(axi_address_width-1 downto 0);
    signal axi_wready_buff  : std_logic := '0';
    signal axi_bvalid_buff  : std_logic := '0';
    signal reg_in_fifo      : std_logic_vector(axi_data_width-1 downto 0) := (others=>'0');
    signal in_fifo          : std_logic_vector(7 downto 0);
    signal in_valid         : std_logic := '0';
    signal in_not_ready     : std_logic;
    signal out_ready        : std_logic;
    signal out_not_valid    : std_logic;
begin
    axi_awready    <= axi_awready_buff;
    axi_wready     <= axi_wready_buff;
    axi_bvalid     <= axi_bvalid_buff;
    axi_bresp      <= "00";
    in_avail       <= not in_not_ready;
    out_fifo_valid <= not out_not_valid;
    out_ready      <= out_fifo_ready;    
    in_fifo        <= reg_in_fifo(7 downto 0) when axi_wstrb = X"F"
                      else reg_in_fifo(axi_data_width-1 downto axi_data_width-8);

    uart_fifo_inst : uart_fifo 
        generic map (
            FIFO_WIDTH => 8,
            FIFO_DEPTH => fifo_depth
        )
        port map (
            clock      => aclk,
            nreset     => aresetn,
            wr_data    => in_fifo,
            rd_data    => out_fifo,
            wr_en      => in_valid,
            rd_en      => out_ready,
            full       => in_not_ready,
            empty      => out_not_valid,
            level      => open
        );

    process (aclk)
    begin
        if rising_edge(aclk) then
            if aresetn='0' then
                axi_awready_buff <= '0';
                axi_wready_buff  <= '0';
                axi_bvalid_buff  <= '0';
                reg_in_fifo      <= (others=>'0');
                in_valid         <= '0';
                state            <= STATE_WAIT;
            else
                case state is
                when STATE_WAIT=>
                    if axi_awvalid='1' and axi_awready_buff='1' then
                        axi_awready_buff <= '0';
                        axi_awaddr_buff  <= axi_awaddr;
                        axi_wready_buff  <= '1';
                        state            <= STATE_WRITE;
                    else
                        axi_awready_buff <= '1';
                    end if;
                when STATE_WRITE=>
                    if axi_wvalid='1' and axi_wready_buff='1' then
                        axi_wready_buff <= '0';
                        for each_byte in 0 to axi_data_width/8-1 loop
                            if axi_wstrb(each_byte)='1' then
                                if axi_awaddr_buff=X"0000" and in_not_ready='0' then
                                    reg_in_fifo(7+each_byte*8 downto each_byte*8) <= axi_wdata(7+each_byte*8 downto each_byte*8);
                                    in_valid <= '1';
                                end if;
                            end if;
                        end loop;
                        state           <= STATE_RESPONSE;
                        axi_bvalid_buff <= '1';
                    end if;
                when STATE_RESPONSE=>
                    in_valid <= '0';
                    if axi_bvalid_buff='1' and axi_bready='1' then
                        axi_bvalid_buff <= '0';
                        state           <= STATE_WAIT;
                    end if;
                end case;
            end if;
        end if;
    end process;

-- synthesis_off
    uart_logger:
    if log_file /= "UNUSED" generate
        uart_proc: process(aclk, in_fifo, in_valid)
            file store_file        : text open write_mode is log_file;
            variable hex_file_line : line;
            variable c             : character;
            variable index         : natural;
            variable line_length   : natural := 0;
        begin
            if rising_edge(aclk) and in_valid = '1' then
                index := conv_integer(in_fifo(6 downto 0));
                if index /= 10 then
                    c := character'val(index);
                    write(hex_file_line, c);
                    line_length := line_length + 1;
                end if;
                if index = 10 or line_length >= 72 then
                    writeline(store_file, hex_file_line);
                    line_length := 0;
                end if;
            end if; 
        end process; 
    end generate;
-- synthesis_on
    
end Behavioral;
