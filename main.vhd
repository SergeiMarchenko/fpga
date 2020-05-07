library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 

entity main is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  sel : in STD_LOGIC;
			  led : out STD_LOGIC);
end main;

architecture arc of main is
component ascii_conv
    Port (clk : in STD_LOGIC;
	 reset : in STD_LOGIC;
    next_letter : in std_logic;
    ascii : out std_logic_vector (6 downto 0));
end component;

component LetterToMorseCode
 port (clk, reset : in std_logic; 
   letter : in std_logic_vector (6 downto 0); 
   getnextletter : out std_logic; 
   morse_char : out std_logic_vector (4 downto 0));
end component;

component led_driver 
 port (clk, reset : in std_logic; 
   morse_char : in std_logic_vector (4 downto 0); 
   led : out std_logic;
   letterclk : out std_logic); 
end component;

signal getnextletter: std_logic:= '0';
signal letter : std_logic_vector (6 downto 0) := "0000000";
signal morse_char : std_logic_vector (4 downto 0) := "00000";
signal letterclk : std_logic := '0';

signal final_clk : std_logic := '0';

COMPONENT my_ip_core
	PORT(
		CLKFX_SELECT_IN : IN std_logic;
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;

begin

	Inst_my_ip_core: my_ip_core PORT MAP(
		CLKFX_SELECT_IN => sel,
		CLKIN_IN => clk,
		RST_IN => '0',
		CLKFX_OUT => final_clk,
		CLKIN_IBUFG_OUT => open,
		CLK0_OUT => open,
		LOCKED_OUT => open
	);

  u1: ascii_conv port map(final_clk, rst, getnextletter, letter);
  u2: LetterToMorseCode port map(letterclk, rst, letter, getnextletter, morse_char);
  u3: led_driver port map(final_clk, rst, morse_char, led, letterclk);
end arc;

