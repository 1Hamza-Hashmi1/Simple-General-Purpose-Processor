LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY lab2_vhdl1 IS
PORT (
A,B,C,D : IN STD_LOGIC ;
f : OUT STD_LOGIC );
end lab2_vhdl1;

ARCHITECTURE Behavior OF lab2_vhdl1 IS
BEGIN
f <= (not(A) and C and D) or (not(A) and B and D) or (B and C and D) or (A and C and not(D)) or (not(A) and not(B) and not(C) and not(D));
END Behavior;