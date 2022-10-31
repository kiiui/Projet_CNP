----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 10:03:14
-- Design Name: 
-- Module Name: OOKtb - Behavioral
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

entity OOKtb is
    generic(N:natural:=8);
end OOKtb;

architecture Behavioral of OOKtb is

component OOK
    Port ( data_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           s_out : out STD_LOGIC;
           clk : in STD_LOGIC;
           start_in : in STD_LOGIC);
end component;
signal data_in : STD_LOGIC_VECTOR (N-1 downto 0);
signal s_out,clk,start_in : STD_LOGIC;
constant clk_period : time := 1 ns;
begin

comp: OOK port map(
    clk=>clk,
    data_in=>data_in,
    start_in=>start_in,
    s_out=>s_out
    );

clk_process : process
begin
    clk<='0';
    wait for clk_period/2;
    clk<='1';
    wait for clk_period/2;
end process;

stim_proc : process
begin
    wait for 10ns;
    data_in<="01010101";
    start_in<='1';
end process;

end Behavioral;
