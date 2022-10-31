----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2022 21:51:58
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
    Port ( data_in : in STD_LOGIC_VECTOR (4 downto 0);
           s_out : out STD_LOGIC;
           clk : in STD_LOGIC);
end FSM;

architecture Behavioral of FSM is

type state_type is (s0,s1,s2,s3,s4,s5,s6);
signal state : state_type := s0 ;
signal data_test : STD_LOGIC_VECTOR(4 downto 0);
    
begin

FSM:process(clk,state)
begin
if(rising_edge(clk)) then
    case(state) is
    --etat initial
        when s0 =>
            data_test<=data_in;
            state <= s1;
        --etat test bit0
        when s1 =>
            if(data_test(0) = '0') then 
                state <= s2;
            else
                state <= s0;
                s_out<='0';
            end if;
        --etat test bit1
        when s2 =>
            if(data_test(1) = '1') then 
                state <= s3;
            else
                state <= s0;
                s_out<='0';
            end if;
        --etat test bit2
        when s3 =>
            if(data_test(2) = '0') then 
                state <= s4;
            else
                state <= s0;
                s_out<='0';
            end if;
        --etat test bit3
        when s4 =>
            if(data_test(3) = '1') then 
                state <= s5;
            else
                state <= s0;
                s_out<='0';
            end if;
        --etat test bit4
        when s5 =>
            if(data_test(4) = '0') then 
                state <= s6;
            else
                state <= s0;
                s_out<='0';
            end if;
        --etat final
        when s6 =>
            s_out <= '1';
            state <= s0;
        when others =>
    end case;
end if;
end process;            

end Behavioral;
