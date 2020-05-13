-- AXI4-Lite read controller for UART

library ieee;
use ieee.std_logic_1164.all;
use work.uart_pack.all;

entity uart_axi_rd_cntrl is
    generic (
        fifo_depth        : integer := 8;
        axi_address_width : integer := 32;
        axi_data_width    : integer := 32
    );
    port (
        aclk              : in  std_logic;
        aresetn           : in  std_logic;
        axi_araddr        : in  std_logic_vector(axi_address_width-1 downto 0);
        axi_arprot        : in  std_logic_vector(2 downto 0);
        axi_arvalid       : in  std_logic;
        axi_arready       : out std_logic;
        axi_rdata         : out std_logic_vector(axi_data_width-1 downto 0) := (others=>'0');
        axi_rvalid        : out std_logic;
        axi_rready        : in  std_logic;
        axi_rresp         : out std_logic_vector(1 downto 0);
        rx_status_avail   : out std_logic;
        tx_status_avail   : in  std_logic;
        in_fifo           : in  std_logic_vector(7 downto 0);
        in_fifo_valid     : in  std_logic;
        in_fifo_ready     : out std_logic
    );
end uart_axi_rd_cntrl;

architecture Behavioral of uart_axi_rd_cntrl is

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

    type state_type is (STATE_WAIT,STATE_READ);
    signal state            : state_type := STATE_WAIT;
    signal axi_arready_buff : std_logic := '0';
    signal axi_rvalid_buff  : std_logic := '0';
    signal reg_status       : std_logic_vector(axi_data_width-1 downto 0) := (others=>'0');
    signal out_fifo         : std_logic_vector(7 downto 0);
    signal out_ready        : std_logic := '0';
    signal in_not_ready     : std_logic;
    signal out_not_valid    : std_logic;
    
begin

    axi_arready     <= axi_arready_buff;
    axi_rvalid      <= axi_rvalid_buff;
    axi_rresp       <= "00";
    rx_status_avail <= not out_not_valid;
    reg_status(0)   <= not out_not_valid;
    reg_status(1)   <= tx_status_avail;
    in_fifo_ready   <= not in_not_ready;
    
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
            wr_en      => in_fifo_valid,
            rd_en      => out_ready,
            full       => in_not_ready,
            empty      => out_not_valid,
            level      => open
        );
    
    process (aclk)
    begin
        if rising_edge(aclk) then
            if aresetn='0' then
                axi_arready_buff <= '0';
                axi_rvalid_buff  <= '0';
                out_ready        <= '0';
                state            <= STATE_WAIT;
            else
                case state is
                when STATE_WAIT=>
                    if axi_arvalid='1' and axi_arready_buff='1' then
                        axi_arready_buff <= '0';
                        out_ready        <= '1';
                        axi_rvalid_buff  <= '1';
                        if axi_araddr=X"0020" then 
                            axi_rdata <= reg_status;
                        else
                            axi_rdata <= (others=>'0');
                        end if;
                        state <= STATE_READ;
                    else
                        axi_arready_buff <= '1';
                    end if;
                when STATE_READ=>
                    out_ready <= '0';
                    if axi_rvalid_buff='1' and axi_rready='1' then
                        axi_rvalid_buff <= '0';
                        state           <= STATE_WAIT;
                    end if;
                end case;
            end if;
        end if;
    end process;

end Behavioral;
