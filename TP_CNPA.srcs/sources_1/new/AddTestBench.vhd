----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2022 18:47:37
-- Design Name: 
-- Module Name: AddTestBench - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AddTestBench is
--  Port ( );
generic(N:natural:=8);
end AddTestBench;

architecture Behavioral of AddTestBench is

component AddNbitv3 
    Port (  clk : in STD_LOGIC;
            a_in : in STD_LOGIC_VECTOR (N-1 downto 0);
            b_in : in STD_LOGIC_VECTOR (N-1 downto 0);
            c_out : out STD_LOGIC;
            s_out : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

signal a_in,b_in,s_out : STD_LOGIC_VECTOR( N-1 downto 0);
signal clk,c_out: STD_LOGIC;
 
constant clk_period : time := 1ns;

begin

uut: AddNbitv3 port map(
    clk=>clk,
    a_in=>a_in,
    b_in=>b_in,
    s_out=>s_out,
    c_out=>c_out
    );

clk_process : process
begin
    clk<='0';
    wait for clk_period/2;
    clk<='1';
    wait for clk_period/2;
end process;

stim_proc: process
begin 

    wait for 10ns;
    a_in <= "00000001";
    b_in <= "00000011";
    
    wait for 10ns;
    b_in <= "00001000";
    
    wait for 10ns;
    a_in <= "01010101";
    
    wait for 10ns;
    a_in<="11111111";
    b_in<="11111111";
end process;

end Behavioral;
