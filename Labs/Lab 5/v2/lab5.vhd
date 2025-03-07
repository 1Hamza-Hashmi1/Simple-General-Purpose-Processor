--Hamza Hashmi ; 501093570
library ieee;
use ieee.std_logic_1164.all;
entity lab5 is
	port( 
			clk 		:in std_logic;
			data_in 	:in std_logic;
			reset 	:in std_logic;
			student_id	:out 	std_logic_vector(3 downto 0);
			current_state: out std_logic_vector(3 downto 0)); 
	end entity;
	
	architecture fsm of lab5 is
		type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
		
		signal yfsm: state_type;
	begin
		process(clk, reset)
		begin
			if reset = '1' then -- resets the states to initial states
				yfsm <= s0;
			elsif(clk 'EVENT AND clk = '1') then
				case yfsm is
						
						when s0 =>
							if (data_in = '1') then
								yfsm <= s8;
							else
								yfsm <= s0;
							end if;
							
						when s1 =>
							if(data_in = '1')then
								yfsm <= s0;
							else
								yfsm <= s1;
							end if;
							
						when s2 =>
							if(data_in = '1')then
								yfsm <= s7;
							else 
								yfsm <= s2;
							end if;
							
						when s3 =>
							if(data_in = '1')then
								yfsm <= s1;
							else yfsm <= s3;
							end if;
							
						when s4 =>
							if(data_in = '1')then
								yfsm <= s2;
							else yfsm <= s4;
							end if;
							
						when s5 =>
							if(data_in = '1')then
								yfsm <= s3;
							else 
								yfsm <= s5;
							end if;
							
						when s6 =>
							if(data_in = '1')then
								yfsm <= s4;
							else 
								yfsm <= s6;
							end if;
							
						when s7 =>
							if(data_in = '1')then
								yfsm <= s5;
							else 
								yfsm <= s7;
							end if;
							
						when s8 =>
							if(data_in = '1')then
								yfsm <= s6;
							else 
								yfsm <= s8;
							end if;
					end case;
				end if;
			end process;

			process(yfsm, data_in)
			begin
			case yfsm is
			when s0 =>
				current_state <= "0000";
				if(data_in = '1')then
					student_id <= "0000"; --d9
				else 
					student_id <= "0101"; --d1
				end if;
				
			when s1 =>
				current_state <= "0001";
				if(data_in = '1')then
					student_id <= "0101"; --d1
				else 
					student_id <= "0000"; --d2
				end if;
			
			when s2 =>
				current_state <= "0010";
				if(data_in = '1')then
					student_id <= "0111"; --d8
				else 
					student_id <= "0001"; --d3
				end if;
			
			when s3 =>
				current_state <= "0011";
				if(data_in = '1')then
					student_id <= "0000"; --d2
				else 
					student_id <= "0000"; --d4
				end if;
				
			when s4 =>
				current_state <= "0100";
				if(data_in = '1')then
					student_id <= "0001"; --d3
				else 
					student_id <= "1001"; --d5
				end if;
				
			when s5 =>
				current_state <= "0101";
				if(data_in = '1')then
					student_id <= "0000"; --d4
				else 
					student_id <= "0011"; --d6
				end if;
				
			when s6 =>
				current_state <="0110";
				if(data_in = '1')then
					student_id <= "1001"; --d5
				else 
					student_id <= "0101"; --d7
				end if;
				
			when s7 => 
				current_state <= "0111";
				if(data_in = '1')then
					student_id <= "0011"; --d6
				else 
					student_id <= "0111"; --d8
				end if;
			
			when s8 =>
				current_state <= "1000";
				if(data_in = '1')then
					student_id <= "0101"; --d7
				else 
					student_id <= "0000"; --d9
				end if;
					
		end case;
end process;
end Architecture;