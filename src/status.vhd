library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity eStatus is
	port(RD_ENABLE, WR_ENABLE, CLK: in std_logic;
	EMPTY, LAST, FULL: out std_logic);
end entity;

architecture aStatus of eStatus is

component eBidCounter is
	port(UP, DOWN, CLK:in std_logic;
	Q: out std_logic_vector(3 downto 0));
end component;

signal Q : std_logic_vector(3 downto 0);

begin
	Bidirectional_Counter : eBidCounter port map(UP => RD_ENABLE, DOWN => WR_ENABLE, CLK => CLK, Q => Q);
	process(CLK, Q)
	variable lastV, fullV : std_logic := '0';
	variable emptyV : std_logic := '0';
	begin 
		emptyV := ( not (Q(3)) and not (Q(2)) and not (Q(1)) and not (Q(0)) );
		lastV := ( Q(3) and Q(2) and Q(1) and not (Q(0)) );
		fullV := ( Q(3) and Q(2) and Q(1) and Q(0) );
		EMPTY <= emptyV;
		LAST <= lastV;
		FULL <= fullV;
	end process;
end architecture aStatus;
		
	
	


	