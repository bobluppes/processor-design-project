----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2020 11:35:43
-- Design Name: 
-- Module Name: select_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity select_adder is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           s : out STD_LOGIC_VECTOR (32 downto 0);
           do_add : in std_logic          
          );
end select_adder;

-- a'length = 32
-- a'length-1 = 31
-- a'length/2 = 16
-- a'length/2-1 = 15

architecture Behavioral of select_adder is
    signal a_lo : std_logic_vector(a'length/2-1 downto 0);
    signal a_hi : std_logic_vector(a'length/2-1 downto 0);    
       
    signal b_lo : std_logic_vector(a'length/2-1 downto 0);
    signal b_hi : std_logic_vector(a'length/2-1 downto 0);    
	
	signal bb : std_logic(a'length-1 downto 0);

    signal result_lo : std_logic_vector(a'length/2 downto 0);
    signal result_hi_0 : std_logic_vector(a'length/2 downto 0);
    signal result_hi_1 : std_logic_vector(a'length/2 downto 0);

    --signal result_total : STD_LOGIC_VECTOR (32 downto 0);    
begin
    process (do_add,a,b)
    variable carry_lo : std_logic;
    variable carry_hi_0 : std_logic;
    variable carry_hi_1 : std_logic;
    begin
        if do_add = '1' then
            carry_lo := '0';
            carry_hi_0 := '0';
            carry_hi_1 := '1';
			bb <= b;
        else
            carry_lo := '1';
            carry_hi_0 := '0';
            carry_hi_1 := '1';            
			bb <= not b;
        end if;
		
	a_lo <= a(a'length/2-1 downto 0);
    a_hi <= a(a'length-1 downto a'length/2);
    b_lo <= b(a'length/2-1 downto 0);
    b_hi <= b(a'length-1 downto a'length/2);	
	
        
        -- Lower k/2 bits
        for index in 0 to a'length/2-1 loop
            result_lo(index) <= a_lo(index) xor b_lo(index) xor carry_lo;
            carry_lo := (carry_lo and (a_lo(index) or b_lo(index))) or (a_lo(index) and b_lo(index));

            result_hi_0(index) <= a_hi(index) xor b_hi(index) xor carry_hi_0;
            carry_hi_0 := (carry_hi_0 and (a_hi(index) or b_hi(index))) or (a_hi(index) and b_hi(index));

            result_hi_1(index) <= a_hi(index) xor b_hi(index) xor carry_hi_1;
            carry_hi_1 := (carry_hi_1 and (a_hi(index) or b_hi(index))) or (a_hi(index) and b_hi(index));
        end loop;

        
        result_hi_0(a'length/2) <= carry_hi_0 xnor do_add;
        result_hi_1(a'length/2) <= carry_hi_1 xnor do_add;
        result_lo(a'length/2) <= carry_lo xnor do_add;
    end process; 

    process (result_lo(a'length/2))
    begin
        s(a'length/2-1 downto 0) <= result_lo(a'length/2-1 downto 0);         
        case result_lo(a'length/2) is
            when '1' => s(a'length downto a'length/2) <= result_hi_1(a'length/2 downto 0);
            when '0' => s(a'length downto a'length/2) <= result_hi_0(a'length/2 downto 0);
            when others => s(a'length downto 0) <= (others => '0');
        end case;
    end process;
end Behavioral;

--process (result_lo(16))
    --begin
    --    for index in 0 to 15 loop
    --        s(index) <= result_lo(index);
    --        case result_lo(16) is
    --            when '1' => s(index+16) <= result_hi_1(index);
    --            when '0' => s(index+16) <= result_hi_0(index);
    --            when others => s(index+16) <= '0';
    --        end case;
    --    end loop;
    --end process;    
    
    -- doesnt work:
    --s(15 downto 0) <= result_lo; 

    -- Also doesnt work
        --for index in 0 to 15 loop
            --s(index) <= result_lo(index);
        --end loop;
    
    -- Suddenly works after 1398027 tries:

       -- doesnt work:
        --s(0) <= result_lo(0);

        -- this does work
        --s(0) <= carry_lo;

        --s(32 downto 16) <= result_hi_0(16 downto 0) when result_lo(16) = '1' else result_hi_1(16 downto 0);
