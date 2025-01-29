--Hamza Hashmi, 501093570
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY C IS 
PORT ( 
	S : in STD_LOGIC_VECTOR(15 DOWNTO 0);
	L : out STD_LOGIC_VECTOR(15 DOWNTO 0);
end C;

ARCHITECTURE Behavior OF C IS
begin
	L(3) <= (not S(3) and S(2) and not S(1) and not S(0));
	L(2) <= (not S(3) and S(2) and S(1)) or (not S(3) and not S(2) and not S(1) and not S(0));
	L(1) <= (not S(3) and S(2) and S(1) and S(0));
	L(0) <= (not S(3) and not S(0)) or (not S(3) and S(2));
end Behavior;