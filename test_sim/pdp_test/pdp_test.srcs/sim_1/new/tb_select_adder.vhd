library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_select_adder is    
end tb_select_adder;

architecture behavioral of tb_select_adder is
    component select_adder is
        Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
               b : in STD_LOGIC_VECTOR (31 downto 0);
               s : out STD_LOGIC_VECTOR (32 downto 0);
               do_add : in std_logic          
              );
    end component;

    signal in_a, in_b : std_logic_vector(31 downto 0);
    signal do_add : std_logic;
    signal sum : std_logic_vector(32 downto 0);
begin
    adder_inst: select_adder port map(a=>in_a, b=>in_b, s=>sum, do_add=>do_add);

    in_a <= std_logic_vector(to_unsigned(32768,32)) after 0ns,  std_logic_vector(to_unsigned(10,32)) after 25ns;
    in_b <= std_logic_vector(to_unsigned(32768,32)) after 0ns,  std_logic_vector(to_unsigned(3,32)) after 25ns;

    do_add <= '1' after 0ns, '0' after 10ns, '1' after 20ns; --'0' after 20ns, '1' after 30ns;

end behavioral;