----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2022 16:27:41
-- Design Name: 
-- Module Name: AddNbitv3 - Behavioral
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

entity AddNbitv3 is
    generic(N:natural:=8);
    Port (  clk : in STD_LOGIC;
            a_in : in STD_LOGIC_VECTOR (N-1 downto 0);
            b_in : in STD_LOGIC_VECTOR (N-1 downto 0);
            c_out : out STD_LOGIC;
            s_out : out STD_LOGIC_VECTOR (N-1 downto 0));
end AddNbitv3;

architecture Behavioral of AddNbitv3 is

signal aLSB1,aMSB1,bLSB1,bMSB1,cLSB1,sMSB2,sMSB1,sLSB1 : unsigned(N/2 downto 0);
signal sLSB2 : unsigned(N/2 -1 downto 0);
begin

process(clk)
    begin

    if(rising_edge(clk)) then
    -- stockage des bits dans les signaux
        aLSB1<='0'&unsigned(a_in((N-1)/2 downto 0));
        aMSB1<='0'&unsigned(a_in(N-1 downto N/2));
        bLSB1<='0'&unsigned(b_in((N-1)/2 downto 0));
        bMSB1<='0'&unsigned(b_in(N-1 downto N/2));
        --somme des LSB et MSB
        sMSB1<=aMSB1+bMSB1;
        sLSB1<=aLSB1+bLSB1;
        --ajout de la carry de sLSB dans sMSB
        sLSB2<=sLSB1((N/2)-1 downto 0);
        sMSB2<= sMSB1 + ('0' & sLSB1(N/2));
    
        
    end if;
end process;

s_out(N-1 downto N/2)<=std_logic_vector(sMSB2((N/2)-1 downto 0));
s_out((N/2)-1 downto 0)<=std_logic_vector(sLSB2);
c_out<=std_logic(sMSB2(N/2));
end Behavioral;
