library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 

entity LetterToMorseCode is 
 port ( clk, reset : in std_logic; 
   letter : in std_logic_vector (6 downto 0); 
   getnextletter : out std_logic; 
   morse_char : out std_logic_vector (4 downto 0) ); 
end LetterToMorseCode; 

architecture arc of LetterToMorseCode is 
 signal morse : std_logic_vector (3 downto 0); 
 constant short : std_logic_vector (4 downto 0) := "11000"; 
 constant long : std_logic_vector (4 downto 0) := "00111";
 constant pause : std_logic_vector (4 downto 0) := "11111"; 
begin 
 process (clk) 
 begin 
  if clk 'EVENT and clk = '1' then 
   if reset = '1' then 
    morse_char <= "00000"; 
    getnextletter <= '1'; 
    morse <= "0000"; 
   else 
-- A 
    if letter = "0011100" then -- A 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1;
      getnextletter <= '0'; 
     elsif morse = "0010" then
      morse_char <= pause;
      morse <= morse + 1;
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- B 
    elsif letter = "0110010" then -- B 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- C 
    elsif letter = "0100001" then -- C 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- D 
    elsif letter = "0100011" then -- D 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- E 
    elsif letter = "0100100" then -- E 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0010" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1';  
     end if;  
-- F 
    elsif letter = "0101011" then -- F 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- G 
   elsif letter = "0110100" then -- G 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- H 
    elsif letter = "0110011" then -- H 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- I 
   elsif letter = "1000011" then -- I 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- J 
    elsif letter = "0111011" then -- J 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- K 
    elsif letter = "1000010" then -- K 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- L 
    elsif letter = "1001011" then -- L 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- M 
    elsif letter = "0111010" then -- M 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- N 
    elsif letter = "0110001" then -- N 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- O 
    elsif letter = "1000100" then -- O 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- P 
    elsif letter = "1001101" then -- P 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     else 
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- Q 
    elsif letter = "0010101" then -- Q 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- R 
    elsif letter = "0101101" then -- R 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- S 
    elsif letter = "0011011" then -- S 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- T 
    elsif letter = "0101100" then -- T 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0010" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- U 
    elsif letter = "0111100" then -- U 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- V 
    elsif letter = "0101010" then -- V 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- W 
    elsif letter = "0011101" then -- W 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- X 
    elsif letter = "0100010" then -- X 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- Y 
    elsif letter = "0110101" then -- Y 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- Z 
    elsif letter = "0011010" then -- Z 
     if morse = "0000" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= long; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0101" then
      morse_char <= pause;
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if;  
-- Space 
    elsif letter = "0101001" then -- Space 
     if morse = "0000" then 
      morse_char <= pause; 
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0001" then
      morse_char <= pause; 
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0010" then
      morse_char <= pause; 
      morse <= morse + 1;
      getnextletter <= '0';
     elsif morse = "0011" then
      morse_char <= pause; 
      morse <= morse + 1;
      getnextletter <= '0';
     else
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
-- backspace 
    elsif letter = "1100110" then -- backspace 
     if morse = "0000" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0001" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0010" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0011" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0100" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0101" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0110" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     elsif morse = "0111" then 
      morse_char <= short; 
      morse <= morse + 1; 
      getnextletter <= '0'; 
     else 
      morse_char <= (others => '0'); 
      morse <= (others => '0'); 
      getnextletter <= '1'; 
     end if; 
    else 
     morse_char <= (others => '0'); 
     getnextletter <= '1'; 
    end if; 
   end if; 
  end if; 
 end process; 
end arc; 

