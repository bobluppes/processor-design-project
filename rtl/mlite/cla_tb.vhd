
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CLA_TB IS
END CLA_TB;

ARCHITECTURE behavior OF CLA_TB IS

COMPONENT CLA
    GENERIC(
        bits : integer
    );

    PORT
        (
         a          :  IN   STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
         b          :  IN   STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
         cin        :  IN   STD_LOGIC;
         result     :  OUT  STD_LOGIC_VECTOR(bits DOWNTO 0)
    );

END COMPONENT;

signal a_tb         :  STD_LOGIC_VECTOR(3 DOWNTO 0);
signal b_tb         :  STD_LOGIC_VECTOR(3 DOWNTO 0);
signal cin_tb       :  STD_LOGIC;
signal result_tb    :  STD_LOGIC_VECTOR(4 DOWNTO 0);

begin

CLA_INST: CLA
    GENERIC MAP(
        bits => 4
    )
    PORT MAP
        (
         a => a_tb,
         b => b_tb,
         cin => cin_tb,
         result => result_tb
    );

-- Stimulus process
stim: process
        begin
-- hold reset state for 100 ns.
        wait for 10 ns;
 
        a_tb <= "1111";
        b_tb <= "1010";
        cin_tb <= '0';
 
        wait for 10 ns;
 
        a_tb <= "1010";
        b_tb <= "0111";
        cin_tb <= '0';
 
        wait for 10 ns;
 
        a_tb <= "1000";
        b_tb <= "1001";
        cin_tb <= '0';
 
        wait;
 
end process;
end;