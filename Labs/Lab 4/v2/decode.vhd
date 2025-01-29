--Hamza Hashmi ; 501093570

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY decode IS
PORT (
	w : IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
	En : IN STD_LOGIC ;
	y : OUT STD_LOGIC_VECTOR(0 TO 3) ) ;
END decode ;

ARCHITECTURE Behavior OF decode IS
	SIGNAL Enw : STD_LOGIC_VECTOR(2 DOWNTO 0) ;
BEGIN
	Enw <= En & w ;
	WITH Enw SELECT
	y <= "1000" WHEN "100",
		  "0100" WHEN "101",
		  "1010" WHEN "110",
		  "0001" WHEN "111",
		  "1000" WHEN OTHERS ;
END Behavior ;