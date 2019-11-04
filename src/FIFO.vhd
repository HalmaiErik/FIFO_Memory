library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity eFIFO is
	port(DATA_IN: in std_logic_vector(7 downto 0);
	DATA_OUT: out std_logic_vector(7 downto 0);
	POP, PUSH: in std_logic; 
	EMPTY, FULL, LAST: inout std_logic;
	CLK: in std_logic );
end entity;

architecture aFIFO of eFIFO is

component eControl is
	port(PUSH, POP, FULL, EMPTY: in std_logic;  
		 RD_ENABLE, WR_ENABLE: out std_logic);
end component; 

component eStatus is
	port(RD_ENABLE, WR_ENABLE, CLK: in std_logic;
	EMPTY, LAST, FULL: out std_logic);
end component;

component pointers_RAM is
	port(RD_ENABLE, WR_ENABLE, CLK: in std_logic;
	DATA_IN: in std_logic_vector(7 downto 0);
	DATA_OUT: out std_logic_vector(7 downto 0) );	
end component;

signal RD_ENABLE_SIG, WR_ENABLE_SIG, EMPTY_SIG, FULL_SIG, LAST_SIG: std_logic;

begin
	CONTROL: eControl port map(PUSH => PUSH, POP => POP, FULL => FULL, EMPTY => EMPTY, RD_ENABLE => RD_ENABLE_SIG, WR_ENABLE => WR_ENABLE_SIG);
	STATUS: eStatus port map(RD_ENABLE => RD_ENABLE_SIG, WR_ENABLE => WR_ENABLE_SIG, CLK => CLK, EMPTY => EMPTY_SIG, LAST => LAST_SIG, FULL => FULL_SIG);
	MEMORY: pointers_RAM port map(RD_ENABLE => RD_ENABLE_SIG, WR_ENABLE => WR_ENABLE_SIG, CLK => CLK, DATA_IN => DATA_IN, DATA_OUT => DATA_OUT);
	
	EMPTY <= EMPTY_SIG;
	FULL <= FULL_SIG;
	LAST <= LAST_SIG;
end architecture aFIFO;
	
	