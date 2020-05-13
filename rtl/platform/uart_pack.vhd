library ieee;
use ieee.std_logic_1164.all;

package uart_pack is

    constant default_uart_fifo_depth      : integer := 8;
    constant default_uart_baud            : positive := 115200;
    constant default_uart_clock_frequency : positive := 57100000;

    component uart is
        generic (
            log_file          : string  := "UNUSED";
            fifo_depth        : integer := default_uart_fifo_depth;
            axi_address_width : integer := 16;
            axi_data_width    : integer := 32;
            baud              : positive := default_uart_baud;
            clock_frequency   : positive := default_uart_clock_frequency);
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
            axi_araddr        : in  std_logic_vector(axi_address_width-1 downto 0);
            axi_arprot        : in  std_logic_vector(2 downto 0);
            axi_arvalid       : in  std_logic;
            axi_arready       : out std_logic;
            axi_rdata         : out std_logic_vector(axi_data_width-1 downto 0) := (others=>'0');
            axi_rvalid        : out std_logic;
            axi_rready        : in  std_logic;
            axi_rresp         : out std_logic_vector(1 downto 0);
            tx                : out std_logic;
            uart_tx_cpu_pause : out std_logic;
            clk_debug         : out std_logic
        );
    end component;

    function clogb2(bit_depth : in integer ) return integer;

end package;

package body uart_pack is

    function flogb2(bit_depth : in natural ) return integer is
		variable result : integer := 0;
		variable bit_depth_buff : integer := bit_depth;
	begin
		while bit_depth_buff>1 loop
			bit_depth_buff := bit_depth_buff/2;
			result := result+1;
		end loop; 
		return result;
	end function flogb2; 
	
	function clogb2 (bit_depth : in natural ) return natural is
		variable result : integer := 0;
	begin
		result := flogb2(bit_depth);
		if (bit_depth > (2**result)) then
			return(result + 1);
		else
			return result;
		end if;
	end function clogb2;

end;