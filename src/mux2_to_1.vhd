library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity eMUX is
	port( A,B: in integer;
	S: in std_logic;
	Y: out integer );
end entity;

architecture aMUX of eMUX is
begin
	process(A, B, S)
	begin
		if S = '1' then
			Y <= A;
		else if S = '0' then
			Y <= B;
		end if;
		end if;
	end process;
end architecture aMUX;
			
	
