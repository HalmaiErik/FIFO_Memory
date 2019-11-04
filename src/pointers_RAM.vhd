library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_UNSIGNED.all;
use IEEE.std_logic_arith.all;

entity pointers_RAM is
	port(RD_ENABLE, WR_ENABLE, CLK: in std_logic;
	DATA_IN: in std_logic_vector(7 downto 0);
	DATA_OUT: out std_logic_vector(7 downto 0) );	
end pointers_RAM;



architecture apointers_RAM of pointers_RAM is

component eRAM is
	port( DATA_IN: in std_logic_vector(7 downto 0);
	DATA_OUT: out std_logic_vector(7 downto 0);
	CLK: in std_logic;
	RD_ENABLE, WR_ENABLE: in std_logic;
	AW, AR: in std_logic_vector(3 downto 0) );
end component;

component eCounter is
	port(CE, CLK: in std_logic;
	Q: out std_logic_vector(3 downto 0));
end component;

signal AW, AR: std_logic_vector(3 downto 0);

begin
	C1: eCounter port map(CE => RD_ENABLE, CLK => CLK, Q => AR);
	C2: eCounter port map(CE => WR_ENABLE, CLK => CLK, Q => AW);
	R1: eRAM port map(DATA_IN => DATA_IN, DATA_OUT => DATA_OUT, CLK => CLK, RD_ENABLE => RD_ENABLE, WR_ENABLE => WR_ENABLE, AR => AR, AW => AW);

end architecture apointers_RAM;
