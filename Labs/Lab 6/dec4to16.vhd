LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec4to16 IS
	PORT(w :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			En		 :IN STD_LOGIC;
			y		 :OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END dec4to16;
	
	ARCHITECTURE Behaviour OF dec4to16 IS
		SIGNAL Enw: STD_logic_vector(4 DOWNTO 0);
	BEGIN
			Enw <= En & w(3)&w(2)&w(1)&w(0);
			WITH Enw SELECT
					y <= 	"0000000000000001" WHEN "10000", --0
							"0000000000000010" WHEN "10001", --1
							"0000000000000100" WHEN "10010", --2
							"0000000000001000" WHEN "10011", --3
							"0000000000010000" WHEN "10100", --4
							"0000000000100000" WHEN "10101", --5
							"0000000001000000" WHEN "10110", --6
							"0000000010000000" WHEN "10111", --7
							"0000000100000000" WHEN "11000", --8
							"0000000000000001" WHEN OTHERS;
		END Behaviour;