-- UART (Universal Asynchronous Receiver Transmitter)

library ieee;
use ieee.std_logic_1164.all;          
use ieee.numeric_std.all;                  
use work.uart_pack.all;

entity uart is
    generic (
        log_file          : string  := "UNUSED";
        fifo_depth        : integer := 8; 
        axi_address_width : integer := 16;
        axi_data_width    : integer := 32;
        baud              : positive := 115200;
        clock_frequency   : positive := 50000000
    );
    port (
        aclk              : in  std_logic;
        aresetn           : in  std_logic;
        -- slave AXI4-Lite write
        axi_awaddr        : in  std_logic_vector(axi_address_width-1 downto 0);
        axi_awprot        : in  std_logic_vector(2 downto 0);
        axi_awvalid       : in  std_logic;
        axi_awready       : out std_logic;
        axi_wvalid        : in  std_logic;
        axi_wready        : out std_logic;
        axi_wdata         : in  std_logic_vector(axi_data_width-1 downto 0);
        axi_wstrb         : in  std_logic_vector(axi_data_width/8-1 downto 0);
        axi_bvalid        : out std_logic;
        axi_bready        : in  std_logic;
        axi_bresp         : out std_logic_vector(1 downto 0);
        -- slave AXI4-Lite read
        axi_araddr        : in  std_logic_vector(axi_address_width-1 downto 0);
        axi_arprot        : in  std_logic_vector(2 downto 0);
        axi_arvalid       : in  std_logic;
        axi_arready       : out std_logic;
        axi_rdata         : out std_logic_vector(axi_data_width-1 downto 0) := (others=>'0');
        axi_rvalid        : out std_logic;
        axi_rready        : in  std_logic;
        axi_rresp         : out std_logic_vector(1 downto 0);
        -- UART
        tx                : out std_logic;
        -- cpu
        uart_tx_cpu_pause : out std_logic;
        clk_debug         : out std_logic
    );
end uart;

architecture Behavioral of uart is

    component uart_core is
        generic (
            baud                : positive;
            clock_frequency     : positive
        );
        port (  
            clock               : in  std_logic;
            nreset              : in  std_logic;
            data_byte_in        : in  std_logic_vector(7 downto 0);
            data_byte_in_strobe : in  std_logic;
            data_byte_in_ack    : out std_logic;
            tx                  : out std_logic;
            uart_tx_cpu_pause   : out std_logic
        );
    end component;
    
    component uart_axi_wr_cntrl is
        generic (
            log_file          : string  := "UNUSED";
            fifo_depth        : integer := 8;
            axi_address_width : integer := 16;
            axi_data_width    : integer := 32
        );
        port (
            aclk              : in  std_logic;
            aresetn           : in  std_logic;
            axi_awaddr        : in  std_logic_vector(axi_address_width-1 downto 0);
            axi_awprot        : in  std_logic_vector(2 downto 0);
            axi_awvalid       : in  std_logic;
            axi_awready       : out std_logic;
            axi_wvalid        : in  std_logic;
            axi_wready        : out std_logic;
            axi_wdata         : in  std_logic_vector(axi_data_width-1 downto 0);
            axi_wstrb         : in  std_logic_vector(axi_data_width/8-1 downto 0);
            axi_bvalid        : out std_logic;
            axi_bready        : in  std_logic;
            axi_bresp         : out std_logic_vector(1 downto 0);
            out_fifo          : out std_logic_vector(7 downto 0);
            out_fifo_valid    : out std_logic;
            out_fifo_ready    : in  std_logic;
            in_avail          : out std_logic;
            fifo_level        : out std_logic
        );
    end component;
    
    component uart_axi_rd_cntrl is
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
            axi_rdata         : out std_logic_vector(axi_data_width-1 downto 0) := (others => '0');
            axi_rvalid        : out std_logic;
            axi_rready        : in  std_logic;
            axi_rresp         : out std_logic_vector(1 downto 0);
            rx_status_avail   : out std_logic;
            tx_status_avail   : in  std_logic;
            in_fifo           : in  std_logic_vector(7 downto 0);
            in_fifo_valid     : in  std_logic;
            in_fifo_ready     : out std_logic
        );
    end component;

    signal out_fifo         : std_logic_vector(7 downto 0);
    signal out_fifo_valid   : std_logic;
    signal out_fifo_ready   : std_logic;
    signal in_fifo          : std_logic_vector(7 downto 0);
    signal in_fifo_valid    : std_logic;
    signal in_fifo_ready    : std_logic;
    signal fifoRX_not_empty : std_logic;
    signal fifoTX_not_full  : std_logic;
    signal fifoTX_full      : std_logic;
    signal uart_tx_busy     : std_logic;
    signal fifo_level       : std_logic;
    constant CLOCK_FREQ     : integer := 10000000;
    signal counter          : integer range 0 to CLOCK_FREQ-1 := 0;
    signal one_hz_pulse     : std_logic := '0';

begin
    
    clk_debug         <= one_hz_pulse;
    fifoTX_full       <= NOT fifoTX_not_full;
    uart_tx_cpu_pause <= uart_tx_busy OR fifoTX_full;

    process (aclk)
    begin
        if (aresetn = '0') then 
            counter <= 0;
            one_hz_pulse <= '0';
        else 
            if rising_edge(aclk) then
                if (counter = 0) then 
                    one_hz_pulse <= not one_hz_pulse;
    
                    counter <= CLOCK_FREQ/2 - 1; 
                else
                    counter <= counter - 1;
                end if;
            end if;
        end if;    
    end process;

    uart_core_inst : uart_core
        generic map (
            baud                => baud,
            clock_frequency     => clock_frequency)
        port map (  
            clock               => aclk,
            nreset              => aresetn,
            data_byte_in        => out_fifo,
            data_byte_in_strobe => out_fifo_valid,
            data_byte_in_ack    => out_fifo_ready,
            tx                  => tx,
            uart_tx_cpu_pause   => uart_tx_busy
        );

    uart_axi_wr_cntrl_inst : uart_axi_wr_cntrl
        generic map (
            log_file          => log_file,
            fifo_depth        => fifo_depth,
            axi_address_width => axi_address_width,
            axi_data_width    => axi_data_width
        )
        port map (
            aclk              => aclk,
            aresetn           => aresetn,
            axi_awaddr        => axi_awaddr,
            axi_awprot        => axi_awprot,
            axi_awvalid       => axi_awvalid,
            axi_awready       => axi_awready,
            axi_wvalid        => axi_wvalid,
            axi_wready        => axi_wready,
            axi_wdata         => axi_wdata,
            axi_wstrb         => axi_wstrb,
            axi_bvalid        => axi_bvalid,
            axi_bready        => axi_bready,
            axi_bresp         => axi_bresp,
            out_fifo          => out_fifo,
            out_fifo_valid    => out_fifo_valid,
            out_fifo_ready    => out_fifo_ready,
            in_avail          => fifoTX_not_full,
            fifo_level        => fifo_level
        );

    uart_axi_rd_cntrl_inst : uart_axi_rd_cntrl
        generic map (
            fifo_depth        => fifo_depth,
            axi_address_width => axi_address_width,
            axi_data_width    => axi_data_width
        )
        port map (
            aclk              => aclk,
            aresetn           => aresetn,
            axi_araddr        => axi_araddr,
            axi_arprot        => axi_arprot,
            axi_arvalid       => axi_arvalid,
            axi_arready       => axi_arready,
            axi_rdata         => axi_rdata,
            axi_rvalid        => axi_rvalid,
            axi_rready        => axi_rready,
            axi_rresp         => axi_rresp,
            rx_status_avail   => fifoRX_not_empty,
            tx_status_avail   => fifoTX_not_full,
            in_fifo           => in_fifo,
            in_fifo_valid     => in_fifo_valid,
            in_fifo_ready     => in_fifo_ready
        );

end Behavioral;
