library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_vivado_1 is
    generic ( input_delay : time := 0 ns );
end testbench_vivado_1;

architecture Behavioral of testbench_vivado_1 is
    component design_1_wrapper is
        port (
            clk_100MHz : in  std_logic;
            reset_rtl  : in  std_logic;
            tx         : out std_logic
        );
    end component;

    constant clock_period: time      := 10 ns;
    signal   raw_clock   : std_logic := '1';
    signal   raw_nreset  : std_logic := '0';
    signal   uart_tx     : std_logic;
begin
    
    design_1_wrapper_inst : design_1_wrapper
        port map (
            clk_100MHz  => raw_clock,
            reset_rtl   => raw_nreset,
            tx          => uart_tx
        );

    raw_clock  <= not raw_clock after clock_period/2;
    raw_nreset <= '1' after 10*clock_period+input_delay;
	
end Behavioral;
