----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2022 14:23:05
-- Design Name: 
-- Module Name: MulComplex_v1 - Behavioral
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

entity MulComplex_v1 is
    generic(N:natural:=8);
    Port ( ar_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           ai_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           br_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           bi_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           clk : in STD_LOGIC;
           r_out : out STD_LOGIC_VECTOR (2*N-1 downto 0);
           i_out : out STD_LOGIC_VECTOR (2*N-1 downto 0));
end MulComplex_v1;

architecture Behavioral of MulComplex_v1 is

signal ar,ai,br,bi : STD_LOGIC_VECTOR(N-1 downto 0);
begin

process(clk)

begin

if(rising_edge(clk)) then
    ar <= ar_in;
    ai <= ai_in;
    br <= br_in;
    bi <= bi_in;
    r_out <= std_logic_vector(signed(ar)*signed(br) - signed(ai)*signed(bi));
    i_out <= std_logic_vector(signed(ar)*signed(bi) + signed(ai)*signed(br));
    end if;
end process;
end Behavioral;

