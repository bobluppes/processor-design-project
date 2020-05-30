
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY walltree_mul_TB IS
END walltree_mul_TB;

ARCHITECTURE behavior OF walltree_mul_TB IS
constant bits	  : integer := 3;

component walltree_mul is
    port (
         a	:	in	std_logic_vector((bits-1) downto 0 );  
         b	:	in	std_logic_vector((bits-1) downto 0 );  
         ext1  :   in  std_logic;
    result_add1	:      out	std_logic_vector((2*bits) downto 0 );
    result_add2	:      out	std_logic_vector((2*bits) downto 0 )   
         ); 
end component;

signal a_tb         :  STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
signal b_tb         :  STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
signal ext1_tb        :  std_logic;
signal  result_add1_tb    :  STD_LOGIC_VECTOR((2*bits) DOWNTO 0);
signal  result_add2_tb    :  STD_LOGIC_VECTOR((2*bits) DOWNTO 0);

constant A	: STD_LOGIC_VECTOR(31 downto 0) :="10101010101011110001110010001101";
constant B	: STD_LOGIC_VECTOR(31 downto 0) :="01000010101010010000110010001101";
constant C	: STD_LOGIC_VECTOR(31 downto 0) :="00001010000101001000010111000001";

begin
Wall_INST: walltree_mul
    PORT MAP
        (
         a => a_tb,
         b => b_tb,
         ext1 => ext1_tb,
         result_add1 => result_add1_tb,
         result_add2 => result_add2_tb
    );

-- Stimulus process
stim: process
        begin
-- hold reset state for 100 ns.
        wait for 10 ns;
 
        
	a_tb <= A((bits-1) DOWNTO 0);
        b_tb <= B((bits-1) DOWNTO 0);
        ext1_tb <= '0';
        --do_add_tb <= '1';
 
        wait for 10 ns;
 
        a_tb <= A((bits-1) DOWNTO 0);
        b_tb <= B((bits-1) DOWNTO 0);
        ext1_tb <= '1';
        --do_add_tb <= '1';
 
        wait for 10 ns;
 
        a_tb <= A((bits-1) DOWNTO 0);
        b_tb <= C((bits-1) DOWNTO 0);
        ext1_tb <= '0';
        --do_add_tb <= '1';
 
        wait;
 
end process;
end;