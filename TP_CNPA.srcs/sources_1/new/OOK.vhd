----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2022 22:06:43
-- Design Name: 
-- Module Name: OOK - Behavioral
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

entity OOK is
    generic(N:natural:=8);
    Port ( data_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           s_out : out STD_LOGIC;
           clk : in STD_LOGIC;
           start_in : in STD_LOGIC);
end OOK;

architecture Behavioral of OOK is
signal cmp,data_cmp : integer := 0;
signal start : STD_LOGIC := '0';
begin

OOK : process(clk,start_in) 
variable tmp_cmp,tmp_data_cmp : integer := 0;
begin
--test si emmision déja commencé ou non
if(start_in = '1' and start='0') then
    start <= '1';
end if;
-- si déja commencé
if(start = '1') then
    if(rising_edge(clk)) then
        --récupération des valeurs
        tmp_cmp := cmp;
        tmp_data_cmp := data_cmp;
        --compteur de ticks
        if(tmp_cmp < 10) then 
            tmp_cmp := tmp_cmp + 1;
        else
        --changement de bit à envoyer
            tmp_data_cmp := tmp_data_cmp + 1;
            tmp_cmp := 0;
        end if;
        --test de fin
        if(tmp_data_cmp > N-1) then
            tmp_data_cmp := 0;
            start<='0';
        end if;
        --stockage des variables dans signaux (sauvgarde)
        data_cmp <= tmp_data_cmp;
        cmp<= tmp_cmp;
    end if;
    --actualiser la sortie par la data & clk
    s_out <= data_in(tmp_data_cmp) and clk;
else
--si non activé -> 0 en sortie
    s_out <= '0';
end if;

end process;

end Behavioral;
