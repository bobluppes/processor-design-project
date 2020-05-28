----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2020 15:37:30
-- Design Name: 
-- Module Name: cla_tb - Behavioral
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cla_tb is
end cla_tb;

architecture Behavioral of cla_tb is

    component cla
        generic (
            WIDTH : integer
        );
        port (
            i_add1  : IN STD_LOGIC_VECTOR(3 downto 0);
            i_add2  : IN STD_LOGIC_VECTOR(3 downto 0);
            mode    : IN STD_LOGIC;
            o_result    : OUT STD_LOGIC_VECTOR(4 downto 0)
        );
    end component;
    
    signal a : STD_LOGIC_VECTOR(3 downto 0);
    signal b : STD_LOGIC_VECTOR(3 downto 0);
    signal do_add : STD_LOGIC;
    signal res : STD_LOGIC_VECTOR(4 downto 0);

begin

    uut: cla
        generic map (
            WIDTH => 4
        )
        port map (
            i_add1 => a,
            i_add2 => b,
            mode => do_add,
            o_result => res
        );
        
    a <= STD_LOGIC_VECTOR(to_unsigned(3, 4));
    b <= STD_LOGIC_VECTOR(to_unsigned(2, 4));
    
    do_add <= '1' after 0ns, '0' after 10ns;


end Behavioral;
