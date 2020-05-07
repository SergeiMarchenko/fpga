----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:01:22 03/11/2020 
-- Design Name: 
-- Module Name:    led - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 

entity led_driver is 
 port (  clk, reset : in std_logic; 
   morse_char : in std_logic_vector (4 downto 0); 
   led, letterclk : out std_logic ); 
end led_driver; 

architecture arc of led_driver is 
 type state_type is (idle, determine, pause, short, long); 
 signal state : state_type; 
 signal time_cnt : integer := 0; 
 signal seconds : integer := 0;
begin 
 process (clk) 
 begin 
  if clk 'EVENT and clk = '1' then 
   if reset = '1' then 
    led <= '0'; 
    state <= idle; 
    letterclk <= '1';
	 time_cnt <= 0;
	 seconds <= 0;
   else 
	 time_cnt <= time_cnt + 1;
	 if (time_cnt = 10) then
		seconds <= seconds + 1;
		time_cnt <= 0;
	 end if;
	 if(seconds = 3) then 
		seconds <= 0;
	 end if;
    case state is 
     when idle => 
      led <= '0'; 
      letterclk <= '0';
      state <= determine; 
     when pause => 
      if seconds = 1 then 
       led <= '0'; 
       letterclk <= '1'; 
       state <= idle;
      end if; 
     when determine => 
		time_cnt <= 0;
		seconds <= 0;
      if morse_char = "11000" then 
       letterclk <= '0';
       led <= '1';
       state <= short;
      elsif morse_char = "00111" then 
       letterclk <= '0';
       led <= '1'; 
       state <= long;
      elsif morse_char = "11111" then 
       letterclk <= '0';
       led <= '0';
       state <= pause;
		 seconds <= 0;
      else 
       state <= idle; 
       led <= '0'; 
       letterclk <= '1'; 
      end if; 
     when short => 
      if seconds = 1 then 
       letterclk <= '1'; 
       led <= '0';  
       state <= pause;
		 time_cnt <= 0;
		 seconds <= 0;
      end if; 
     when long => 
      if seconds = 3 then 
       led <= '0'; 
       letterclk <= '1'; 
       state <= pause; 
		 time_cnt <= 0;
		 seconds <= 0;
      end if; 
    end case; 
   end if; 
  end if;
 end process; 


end arc; 

