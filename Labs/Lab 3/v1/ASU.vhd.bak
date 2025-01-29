LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ASU IS 
PORT ( 
Cin : IN STD_LOGIC;
X, Y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
Cout, Overflow, Sign : OUT STD_LOGIC );
END ASU;

ARCHITECTURE Behavior OF ASU IS
SIGNAL Sum : STD_LOGIC_VECTOR(16 DOWNTO 0);
SIGNAL Yp  : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
Yp(15) <= Y(15) xor Cin;
Yp(14) <= Y(14) xor Cin;
Yp(13) <= Y(13) xor Cin;
Yp(12) <= Y(12) xor Cin;
Yp(11) <= Y(11) xor Cin;
Yp(10) <= Y(10) xor Cin;
Yp(9) <= Y(9) xor Cin;
Yp(8) <= Y(8) xor Cin;
Yp(7) <= Y(7) xor Cin;
Yp(6) <= Y(6) xor Cin;
Yp(5) <= Y(5) xor Cin;
Yp(4) <= Y(4) xor Cin;
Yp(3) <= Y(3) xor Cin;
Yp(2) <= Y(2) xor Cin;
Yp(1) <= Y(1) xor Cin;
Yp(0) <= Y(0) xor Cin;

Sum <= ('0' & X) + ('0' & Yp) + Cin;
S <= Sum(15 DOWNTO 0);
Cout <= Sum(16);
Overflow <= Sum(16) XOR X(15) XOR Y(15) XOR Sum(15);
Sign <= Sum(15);
END Behavior;
