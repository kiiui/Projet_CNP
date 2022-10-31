----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2022 19:08:27
-- Design Name: 
-- Module Name: MulComplexTestBench - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MulComplexTestBench is
--  Port ( );
    generic(N:natural:=8);
end MulComplexTestBench;

architecture Behavioral of MulComplexTestBench is

component MulComplex_v2
    Port ( ar_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           ai_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           br_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           bi_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           clk : in STD_LOGIC;
           r_out : out STD_LOGIC_VECTOR (2*N-1 downto 0);
           i_out : out STD_LOGIC_VECTOR (2*N-1 downto 0));
end component;

signal ar_in,ai_in,br_in,bi_in : STD_LOGIC_VECTOR( N-1 downto 0);
signal r_out,i_out : STD_LOGIC_VECTOR (2*N-1 downto 0);
signal clk: STD_LOGIC;
 
constant clk_period : time := 1ns;

begin

uut: MulComplex_v2 port map(
    ar_in=>ar_in,
    ai_in=>ai_in,
    br_in=>br_in,
    bi_in=>bi_in,
    clk=>clk,
    r_out=>r_out,
    i_out=>i_out
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
    ar_in <= "00010000";
    br_in <= "00000010";
    ai_in <= "00000111";
    bi_in <= "00001111";
    
end process;

end Behavioral;
