library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity eRAM is
	port( DATA_IN: in std_logic_vector(7 downto 0);
	DATA_OUT: out std_logic_vector(7 downto 0);
	CLK: in std_logic;
	RD_ENABLE, WR_ENABLE: in std_logic;
	AW, AR: in std_logic_vector(3 downto 0) );
end entity;

architecture aRAM of eRAM is
type memory is array(0 to 15) of std_logic_vector(7 downto 0);
begin
	process(CLK, RD_ENABLE)
	variable M: memory := (x"00", x"01", x"02", x"03", x"04", x"05", x"06", x"07", x"08", x"09", x"10", x"11", x"12", x"13", x"14", x"15"); 
	begin
	if (CLK'EVENT) and (CLK = '1') then
		if WR_ENABLE = '1' then
			case AW is
				when "0000" => M(0) := DATA_IN;
				when "0001" => M(1) := DATA_IN;
				when "0010" => M(2) := DATA_IN;
				when "0011" => M(3) := DATA_IN;
				when "0100" => M(4) := DATA_IN;
				when "0101" => M(5) := DATA_IN;
				when "0110" => M(6) := DATA_IN;
				when "0111" => M(7) := DATA_IN;
				when "1000" => M(8) := DATA_IN;
				when "1001" => M(9) := DATA_IN;
				when "1010" => M(10) := DATA_IN;
				when "1011" => M(11) := DATA_IN;
				when "1100" => M(12) := DATA_IN;
				when "1101" => M(13) := DATA_IN;
				when "1110" => M(14) := DATA_IN;
				when others => M(15) := DATA_IN;
			end case;
		else if RD_ENABLE = '1' then
			case AR is
				when "0000" => DATA_OUT <= M(0);
				when "0001" => DATA_OUT <= M(1);
				when "0010" => DATA_OUT <= M(2);
				when "0011" => DATA_OUT <= M(3);		
				when "0100" => DATA_OUT <= M(4);
				when "0101" => DATA_OUT <= M(5);
				when "0110" => DATA_OUT <= M(6);
				when "0111" => DATA_OUT <= M(7);
				when "1000" => DATA_OUT <= M(8);
				when "1001" => DATA_OUT <= M(9);
				when "1010" => DATA_OUT <= M(10);
				when "1011" => DATA_OUT <= M(11);
				when "1100" => DATA_OUT <= M(12);
				when "1101" => DATA_OUT <= M(13);
				when "1110" => DATA_OUT <= M(14);
				when others => DATA_OUT <= M(15);
			end case;
		end if;
		end if;
		end if;
	end process;
end architecture aRAM;
	
				
		

	
	
	