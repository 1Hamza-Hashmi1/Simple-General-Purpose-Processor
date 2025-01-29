--Hamza Hashmi, 501093570
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ASU IS 
PORT ( 
Cin : IN STD_LOGIC;
X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
Cout,Overflow, Sign : OUT STD_LOGIC );
END ASU;

ARCHITECTURE Behavior OF ASU IS
SIGNAL Sum : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL Yp  : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

Yp(3) <= Y(3) xor Cin;
Yp(2) <= Y(2) xor Cin;
Yp(1) <= Y(1) xor Cin;
Yp(0) <= Y(0) xor Cin;

Sum <= ('0' & X) + ('0' & Yp) + Cin;
S <= Sum(3 DOWNTO 0);
Cout <= Sum(4);
Overflow <= Sum(4) XOR X(3) XOR Yp(3) XOR Sum(3);
Sign <= Sum(4) XOR X(3) XOR Y(3) XOR Sum(3);
END Behavior;
