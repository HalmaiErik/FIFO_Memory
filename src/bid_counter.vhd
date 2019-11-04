library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity eBidCounter is
	port(UP, DOWN, CLK:in std_logic;
	Q: out std_logic_vector(3 downto 0));
end entity;

architecture aBidCounter of eBidCounter is
begin
	process(CLK)
	variable intQ : std_logic_vector(3 downto 0) := (others => '0'); 
	begin
		if (CLK'EVENT) and (CLK = '1') then
			if (UP = '1') and (DOWN = '0') then
				intQ := intQ + "0001";
			else if (UP = '0') and (DOWN = '1') then
				intQ := intQ - "0001";
				end if;
			end if;
		end if;
	Q <= intQ;
	end process;
end architecture aBidCounter;
