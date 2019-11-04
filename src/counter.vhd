library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity eCounter is
	port(CE, CLK: in std_logic;
	Q: out std_logic_vector(3 downto 0));
end entity;

architecture aCounter of eCounter is
begin
	process(CLK, CE)
	variable intQ: std_logic_vector(3 downto 0) := (others => '0');
	begin
		if (CLK'EVENT) and (CLK = '1') then
			if CE = '1' then
				intQ := intQ + "0001";
			end if;
		end if;
		Q <= intQ;
	end process;
end architecture aCounter;
	
	