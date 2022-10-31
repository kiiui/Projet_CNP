----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2022 15:19:23
-- Design Name: 
-- Module Name: RAMtestbench - Behavioral
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

entity RAMtestbench is
--  Port ( );
generic(    N:natural:=4;
                MemSize:natural:=255;
                AddrSize:natural:=7);

end RAMtestbench;

architecture Behavioral of RAMtestbench is

    component RAM
        port(clk : in STD_LOGIC;
           we_in : in STD_LOGIC;
           re_in : in STD_LOGIC;
           unlock_w_in : in STD_LOGIC;
           unlock_rw_in : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(N-1 downto 0);
           data_out : out STD_LOGIC_VECTOR(N-1 downto 0);
           addr_in : in STD_LOGIC_VECTOR(AddrSize downto 0);
           select_ram_in : in STD_LOGIC_VECTOR(1 downto 0));
    end component;
    
    signal clk,we_in,re_in,unlock_w_in,unlock_rw_in: STD_LOGIC;
    signal data_in,data_out: STD_LOGIC_VECTOR(N-1 downto 0);
    signal addr_in: STD_LOGIC_VECTOR(AddrSize downto 0);
    signal select_ram_in : STD_LOGIC_VECTOR(1 downto 0);
    
    constant clk_period : time := 1 ns;

begin

uut: RAM port map(
    clk=>clk,
    we_in=>we_in,
    re_in=>re_in,
    unlock_w_in=>unlock_w_in,
    unlock_rw_in=>unlock_rw_in,
    data_in=>data_in,
    data_out=>data_out,
    addr_in=>addr_in,
    select_ram_in=>select_ram_in
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
    wait for 10 ns;
    addr_in<="00000001";
    data_in<="0001";
    select_ram_in<="00";
    we_in<='1';
    re_in<='0';
    unlock_w_in<='0';
    unlock_rw_in<='0';
    
    wait for 10 ns;
    data_in<="0010";
    we_in<='0';
    re_in<='1';
    
    wait for 10 ns;
    data_in<="0011";
    select_ram_in <= "01";
    we_in<='1';
    re_in<='0';
    
    wait for 10 ns;
    re_in<='1';
    we_in<='0';
    
    wait for 10 ns;
    data_in<="0100";
    unlock_w_in<='1';
    
    wait for 10 ns;
    data_in<="0101";
    we_in<='1';
    re_in<='0';
    
    wait for 10 ns;
    re_in<='1';
    we_in<='0';
    unlock_w_in<='0';
    
    wait for 10 ns;
    data_in<="0110";
    select_ram_in<="10";
    we_in<='1';
    re_in<='0';
    
    wait for 10 ns;
    re_in<='1';
    we_in<='0';
    
    wait for 10 ns;
    data_in<="0111";
    unlock_rw_in<='1';
    
    wait for 10 ns;
    we_in<='1';
    re_in<='0';
    
    wait for 10 ns;
    unlock_rw_in<='0';
    we_in<='0';
    re_in<='1';
 
    wait for 10 ns;
    unlock_rw_in<='1';
    
    
end process;


end Behavioral;
