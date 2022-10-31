----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 09:47:20
-- Design Name: 
-- Module Name: FSMtestbench - Behavioral
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

entity FSMtestbench is
--  Port ( );
end FSMtestbench;

architecture Behavioral of FSMtestbench is

component FSM
    Port ( data_in : in STD_LOGIC_VECTOR (4 downto 0);
           s_out : out STD_LOGIC;
           clk : in STD_LOGIC);
end component;
signal data_in : STD_LOGIC_VECTOR (4 downto 0);
signal s_out,clk : STD_LOGIC;
constant clk_period : time := 1 ns;
begin

comp: FSM port map(
    clk=>clk,
    data_in=>data_in,
    s_out=>s_out
    );
    
lk_process : process
begin
    clk<='0';
    wait for clk_period/2;
    clk<='1';
    wait for clk_period/2;
end process;

stim_proc : process
begin
    data_in<="01010";
    wait for 10ns;
    data_in<="11010";
    wait for 10ns;
end process;

end Behavioral;
