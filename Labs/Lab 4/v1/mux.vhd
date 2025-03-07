--Hamza Hashmi ; 501093570
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
	PORT (
		w0, w1, w2, w3 :IN STD_LOGIC;
		s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		f : OUT STD_LOGIC );
END mux;

ARCHITECTURE Behavior OF mux IS 
BEGIN
	WITH s SELECT
		f <= w0 WHEN "00",
			  w1 WHEN "01",
			  w2 WHEN "10",
			  w3 WHEN "11";
END Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
PACKAGE mux_package IS

	COMPONENT mux
		PORT ( w0, w1, w2, w3 : IN STD_LOGIC;
			s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			f : OUT STD_LOGIC);
	END COMPONENT;
END mux_package;