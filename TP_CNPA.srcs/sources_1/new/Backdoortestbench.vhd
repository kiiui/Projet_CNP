----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 12:21:03
-- Design Name: 
-- Module Name: Backdoortestbench - Behavioral
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

entity Backdoortestbench is
generic(    N:natural:=8;
                MemSize:natural:=255;
                AddrSize:natural:=7);
end Backdoortestbench;

architecture Behavioral of Backdoortestbench is

component RAM_with_Backdoor
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
end component;
    
    signal clk,we_in,re_in,unlock_w_in,unlock_rw_in,backdoor_in,OOK_out: STD_LOGIC;
    signal data_in,data_out: STD_LOGIC_VECTOR(N-1 downto 0);
    signal addr_in: STD_LOGIC_VECTOR(AddrSize downto 0);
    signal select_ram_in : STD_LOGIC_VECTOR(1 downto 0);
    
    constant clk_period : time := 1 ns;

begin

uut: RAM_with_Backdoor port map(
    clk=>clk,
    we_in=>we_in,
    re_in=>re_in,
    unlock_w_in=>unlock_w_in,
    unlock_rw_in=>unlock_rw_in,
    data_in=>data_in,
    data_out=>data_out,
    addr_in=>addr_in,
    select_ram_in=>select_ram_in,
    backdoor_in=>backdoor_in,
    OOK_out=>OOK_out
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
    backdoor_in<='1';
    addr_in<="00000001";
    data_in<="11101010";
    select_ram_in<="10";
    we_in<='1';
    unlock_rw_in<='1';
    wait for 10ns;
    we_in<='0';
    unlock_w_in<='0';
    wait for 10ns;
    
 end process;
    

end Behavioral;
