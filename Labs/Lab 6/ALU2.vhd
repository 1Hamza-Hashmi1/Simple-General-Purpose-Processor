LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU2 IS
PORT (Clock : IN STD_LOGIC ;
A ,B ,C : IN UNSIGNED(7 DOWNTO 0);
Student_id: IN UNSIGNED(3 DOWNTO 0);
OP: IN UNSIGNED(15 DOWNTO 0);
Neg: OUT STD_LOGIC;
R1: OUT UNSIGNED(3 DOWNTO 0);--first 4bits of 8bits Result
R2: OUT UNSIGNED(3 DOWNTO 0));--later 4bits of 8bits Result
END ALU2;

ARCHITECTURE Behavior OF ALU2 IS
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4: UNSIGNED(0 TO 7);

BEGIN
	Reg1 <= A;
	Reg2 <= B;
	Reg4 <= C;
	
	PROCESS (Clock,OP,A,B)
	BEGIN
	IF (rising_edge(Clock)) THEN
		CASE OP IS
			WHEN "0000000000000001" => --Function 5 Invert the bit significance order of A
				neg <= '0';
				Result <= Reg1(0)&Reg1(1)&Reg1(2)&Reg1(3)&Reg1(4)&Reg1(5)&Reg1(6)&Reg1(7);
			WHEN "0000000000000010"  => --function 2 Shift A to left by 4 bits, input bit = 1 (SHL)
				neg <= '0';
				Result <= Reg1(3)&Reg1(2)&Reg1(1)&Reg1(0)&Reg1(7)&Reg1(6)&Reg1(5)&Reg1(4);
			WHEN "0000000000000100" =>--function 3 Invert upper four bits of B
				neg <= '0';
				Result <= (Reg2 XOR Reg4);
			WHEN "0000000000001000" =>--Function 4 Find the smaller value of A and B and produce the results ( Min(A,B) )
				neg <= '0';
				if (Reg1 < Reg2) then
					Result <= Reg1;
				else
					Result <= Reg2;
				end if;
				Result <= (Reg1 AND Reg2);
			WHEN "0000000000010000" =>--function 5 Calculate the summation of A and B and increase it by 4
				neg <= '0';
				Result <= Reg2 + Reg1 + 4;
			WHEN "0000000000100000" =>--Function 6 Increment A by 3
				if (Reg1 < -3) then
					neg <= '1';
					Result <= ((Reg1* (-1)) - 3);
				else
					neg <= '0';
					Result <= (3 + Reg1);
				end if;
			WHEN "0000000001000000" =>--function 7 
				neg <= '0';
				Result <= Reg2(7)&Reg1(6)&Reg2(5)&Reg1(4)&Reg2(3)&Reg1(2)&Reg2(1)&Reg1(0);
			WHEN "0000000010000000" =>--Function 8 XOR
				neg <= '0';
				Result <= (Reg1 XOR Reg2);
			WHEN "0000000100000000" =>--Function 9 Rotate B left by 3 bits (ROR)
				neg <= '0';
				Result <= Reg2(2)&Reg2(1)&Reg2(0)&Reg2(7)&Reg2(6)&Reg2(5)&Reg2(4)&Reg2(3);
			WHEN OTHERS =>-- Don't care
			END CASE;
		END IF;
	END PROCESS;
	
	R1 <= Result(3 DOWNTO 0);
	R2 <= Result(7 DOWNTO 4);

END Behavior;