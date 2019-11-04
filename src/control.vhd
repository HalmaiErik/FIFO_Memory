library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;  

entity eControl is
	port(PUSH, POP, FULL, EMPTY: in std_logic;  
		 RD_ENABLE, WR_ENABLE: out std_logic);
end entity;

architecture aControl of eControl is
signal s: std_logic;
begin
	process(PUSH, POP, FULL, EMPTY)
	begin
		RD_ENABLE <= (PUSH and (not POP)) and (not(FULL));
		WR_ENABLE <= (POP and (not PUSH)) and (not(EMPTY));
	end process;
end architecture aControl;
		
		
	
	
	
	

		
	