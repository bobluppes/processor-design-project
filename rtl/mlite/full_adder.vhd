library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity full_adder is
 Port ( i_bit1 : in STD_LOGIC;
 i_bit2 : in STD_LOGIC;
 i_carry : in STD_LOGIC;
 o_sum : out STD_LOGIC;
 o_carry : out STD_LOGIC);
end full_adder;
 
architecture gate_level of full_adder is
 
begin
 
 o_sum <= i_bit1 XOR i_bit2 XOR i_carry ;
 o_carry <= (i_bit1 AND i_bit2) OR (i_carry AND i_bit1) OR (i_carry AND i_bit2) ;
 
end gate_level;