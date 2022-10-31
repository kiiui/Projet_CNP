----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2022 14:18:56
-- Design Name: 
-- Module Name: AddNbit - Behavioral
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

entity AddNbit is
    generic(N:natural := 8);
    Port ( clk : in STD_LOGIC;
           a_in : in STD_LOGIC_VECTOR(N-1 downto 0);
           b_in : in STD_LOGIC_VECTOR(N-1 downto 0);
           s_out : out STD_LOGIC_VECTOR(N-1 downto 0));
end AddNbit;

architecture Behavioral of AddNbit is

signal a,b : STD_LOGIC_VECTOR(N-1 downto 0);
signal s : std_logic_vector(N-1 downto 0);

begin
process(clk)
begin
if(clk'event and clk='1') then
    a<=a_in;
    b<=b_in;
    s <= std_logic_vector(unsigned(a) + unsigned(b));
end if;
end process;
s_out<=s;

end Behavioral;
