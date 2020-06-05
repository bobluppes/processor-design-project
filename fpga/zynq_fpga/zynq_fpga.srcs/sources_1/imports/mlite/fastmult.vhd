---------------------------------------------------------------------
-- TITLE: Fast Multiplier
-- AUTHOR: Quinten van Wingerden
-- DATE CREATED: 4/6/2020
-- FILENAME: fastmult.vhd
-- PROJECT: Processor Design Project
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the Fast Multiplier.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fastmult is
    
   port(a       : in  std_logic_vector(31 downto 0);
        b       : in  std_logic_vector(31 downto 0);        
        res     : out std_logic_vector(63 downto 0)
    );
end; --fastmult

architecture arch of fastmult is
    -- function that will AND all the bits of a with bit b
    function and32( c : in std_logic; d : in std_logic_vector(31 downto 0)) return std_logic_vector is
    variable temp_out : std_logic_vector(31 downto 0);
     begin     
        temp_out := (others => '0');
         for i in 0 to d'length-1 loop
            temp_out(i) := c AND d(i);         
         end loop;
         
         return temp_out;
     end;      
    
    signal temp_0 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_1 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_2 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_3 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_4 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_5 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_6 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_7 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_8 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_9 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_10 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_11 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_12 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_13 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_14 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_15 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_16 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_17 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_18 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_19 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_20 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_21 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_22 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_23 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_24 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_25 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_26 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_27 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_28 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_29 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_30 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0
    signal temp_31 : std_logic_vector(63 downto 0) := (others => '0'); -- set to 0    
    
begin
    temp_0(31 downto 0) <= and32(b(0),a); 
    temp_1(32 downto 1) <= and32(b(1),a);
    temp_2(33 downto 2) <= and32(b(2),a); 
    temp_3(34 downto 3) <= and32(b(3),a);
    temp_4(35 downto 4) <= and32(b(4),a); 
    temp_5(36 downto 5) <= and32(b(5),a);
    temp_6(37 downto 6) <= and32(b(6),a); 
    temp_7(38 downto 7) <= and32(b(7),a);
    temp_8(39 downto 8) <= and32(b(8),a); 
    temp_9(40 downto 9) <= and32(b(9),a);
    temp_10(41 downto 10) <= and32(b(10),a); 
    temp_11(42 downto 11) <= and32(b(11),a);
    temp_12(43 downto 12) <= and32(b(12),a); 
    temp_13(44 downto 13) <= and32(b(13),a);
    temp_14(45 downto 14) <= and32(b(14),a); 
    temp_15(46 downto 15) <= and32(b(15),a);
    temp_16(47 downto 16) <= and32(b(16),a); 
    temp_17(48 downto 17) <= and32(b(17),a);
    temp_18(49 downto 18) <= and32(b(18),a); 
    temp_19(50 downto 19) <= and32(b(19),a);
    temp_20(51 downto 20) <= and32(b(20),a); 
    temp_21(52 downto 21) <= and32(b(21),a);
    temp_22(53 downto 22) <= and32(b(22),a); 
    temp_23(54 downto 23) <= and32(b(23),a);
    temp_24(55 downto 24) <= and32(b(24),a); 
    temp_25(56 downto 25) <= and32(b(25),a);
    temp_26(57 downto 26) <= and32(b(26),a); 
    temp_27(58 downto 27) <= and32(b(27),a);
    temp_28(59 downto 28) <= and32(b(28),a); 
    temp_29(60 downto 29) <= and32(b(29),a);
    temp_30(61 downto 30) <= and32(b(30),a); 
    temp_31(62 downto 31) <= and32(b(31),a);    
    
    res <= std_logic_vector(unsigned(temp_0)+unsigned(temp_1)+unsigned(temp_2)+unsigned(temp_3)+unsigned(temp_4)+unsigned(temp_5)+unsigned(temp_6)+unsigned(temp_7)+unsigned(temp_8)+unsigned(temp_9)+unsigned(temp_10)+unsigned(temp_11)+unsigned(temp_12)+unsigned(temp_13)+unsigned(temp_14)+unsigned(temp_15)+unsigned(temp_16)+unsigned(temp_17)+unsigned(temp_18)+unsigned(temp_19)+unsigned(temp_20)+unsigned(temp_21)+unsigned(temp_22)+unsigned(temp_23)+unsigned(temp_24)+unsigned(temp_25)+unsigned(temp_26)+unsigned(temp_27)+unsigned(temp_28)+unsigned(temp_29)+unsigned(temp_30)+unsigned(temp_31));               

 end; --architecture