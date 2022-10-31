----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2022 15:48:30
-- Design Name: 
-- Module Name: RAM - Behavioral
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

entity RAM is
    generic(    N:natural:=8;
                MemSize:natural:=255;
                AddrSize:natural:=7);
    port(clk : in STD_LOGIC;
           we_in : in STD_LOGIC;
           re_in : in STD_LOGIC;
           unlock_w_in : in STD_LOGIC;
           unlock_rw_in : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(N-1 downto 0);
           data_out : out STD_LOGIC_VECTOR(N-1 downto 0);
           addr_in : in STD_LOGIC_VECTOR(AddrSize downto 0);
           select_ram_in : in STD_LOGIC_VECTOR(1 downto 0));

end RAM;

architecture Behavioral of RAM is

    Type memory is array(MemSize downto 0) of STD_LOGIC_VECTOR(N-1 downto 0);
    signal RAM1,RAM2,RAM3: memory;
    
begin

process(clk)
begin
    case (select_ram_in) is
        -- "00" -> RAM1
        when "00" =>
            if(we_in = '1') then
                RAM1(to_integer(unsigned(addr_in))) <= data_in;
            elsif(re_in = '1') then
                data_out <= RAM1(to_integer(unsigned(addr_in)));
            end if;
        -- "01" -> RAM2    
        when "01" =>
            if(unlock_w_in = '1' and we_in = '1') then
                RAM2(to_integer(unsigned(addr_in))) <= data_in;
            elsif(re_in = '1') then
                data_out <= RAM2(to_integer(unsigned(addr_in)));
            end if;
        --"10" --> RAM3
        when "10" =>
            if(unlock_rw_in = '1' and we_in = '1') then
                RAM3(to_integer(unsigned(addr_in))) <= data_in;
            elsif(unlock_rw_in = '1' and re_in = '1') then
                data_out <= RAM3(to_integer(unsigned(addr_in)));
            end if;
        when others =>
    end case;
end process;
    
end Behavioral;
