
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CLA IS
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

END CLA;

ARCHITECTURE behavioral OF CLA IS

SIGNAL    h_sum     :    STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
SIGNAL    g_gen     :    STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
SIGNAL    p_gen     :    STD_LOGIC_VECTOR((bits-1) DOWNTO 0);
SIGNAL    c_gen     :    STD_LOGIC_VECTOR(bits DOWNTO 0);

BEGIN
    h_sum <= a XOR b;
    g_gen <= a AND b;
    p_gen <= a OR b;
    
    PROCESS (g_gen,p_gen,c_gen)
    BEGIN
    c_gen(0) <= cin;
    inst: FOR i IN 0 TO (bits-1) LOOP
              c_gen(i+1) <= g_gen(i) OR (p_gen(i) AND c_gen(i));
        END LOOP;
    END PROCESS;

    result((bits-1) DOWNTO 0) <= h_sum((bits-1) DOWNTO 0) XOR c_gen((bits-1) DOWNTO 0);
    result(bits) <= c_gen(bits);
    
END behavioral;