library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ascii_conv is
    Port ( clk : in STD_LOGIC;
	 reset : in std_logic;
    next_letter : in std_logic;
    ascii : out std_logic_vector (6 downto 0));
end ascii_conv;

architecture arc of ascii_conv is
	signal index: integer := 1;  
	constant name : string(1 to 18) := " marchenko sergei ";
	begin
	process (clk) is	
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				ascii <= "0000000";
         elsif(next_letter = '1') then
				case name(index) is
				    when 'a' => ascii <= "0011100";			
				    when 'b' => ascii <= "0110010";	
				    when 'c' => ascii <= "0100001";	
				    when 'd' => ascii <= "0100011";	
				    when 'e' => ascii <= "0100100";	
				    when 'f' => ascii <= "0101011";	
				    when 'g' => ascii <= "0110100";	
				    when 'h' => ascii <= "0110011";	
				    when 'i' => ascii <= "1000011";	
				    when 'j' => ascii <= "0111011";	
				    when 'k' => ascii <= "1000010";	
				    when 'l' => ascii <= "1001011";	
				    when 'm' => ascii <= "0111010";	
				    when 'n' => ascii <= "0110001";	
				    when 'o' => ascii <= "1000100";	
				    when 'p' => ascii <= "1001101";	
				    when 'q' => ascii <= "0010101";	
				    when 'r' => ascii <= "0101101";	
				    when 's' => ascii <= "0011011";	
				    when 't' => ascii <= "0101100";	
				    when 'u' => ascii <= "0111100";	
				    when 'v' => ascii <= "0101010";	
				    when 'w' => ascii <= "0011101";	
				    when 'x' => ascii <= "0100010";	
				    when 'y' => ascii <= "0110101";	
				    when 'z' => ascii <= "0011010";
				    when ' ' => ascii <= "0101001";	
				    when others => ascii <= "0101001";	
				 end case;
		 end if;
		end if;
	end process;
	
	process(reset, next_letter) is
	begin
		if(reset = '1') then
				index <= 1;
		elsif(index = 18) then
				index <= 1;
		elsif(rising_edge(next_letter))then
				index <= index + 1;
		end if;
	end process;
end arc;

