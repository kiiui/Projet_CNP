----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2022 14:23:05
-- Design Name: 
-- Module Name: MulComplex_v2 - Behavioral
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

entity MulComplex_v2 is
    generic(N:natural:=8);
    Port ( ar_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           ai_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           br_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           bi_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           clk : in STD_LOGIC;
           r_out : out STD_LOGIC_VECTOR (2*N-1 downto 0);
           i_out : out STD_LOGIC_VECTOR (2*N-1 downto 0));
end MulComplex_v2;

architecture Behavioral of MulComplex_v2 is

signal ar,ai,br,bi : STD_LOGIC_VECTOR(N-1 downto 0);
signal pre1,pre2,pre3 : signed(N-1 downto 0);
signal prod1,prod2,com : signed(2*N-1 downto 0);
begin

process(clk)

begin

if(rising_edge(clk)) then
--stockage dans bascules
    ar <= ar_in;
    ai <= ai_in;
    br <= br_in;
    bi <= bi_in;
    --calcauls intérmédiares
    pre1 <= signed(ar) - signed(ai);
    pre2 <= signed(br) - signed(bi);
    pre3 <= signed(br) + signed(bi);
    --multiplications
    com <= signed(bi)*pre1;
    prod1 <= signed(ar)*pre2;
    prod2 <= signed(ai)*pre3;
    --sorties
    r_out <= std_logic_vector(com + prod1);
    i_out <= std_logic_vector(com + prod2);
    end if;
end process;
end Behavioral;

