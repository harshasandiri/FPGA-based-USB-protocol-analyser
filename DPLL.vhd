----------------------------------------------------------------------------------
-- Engineer: Harsha Sandirigama
-- Create Date: 29.03.2020 21:19:39
-- Module Name: DPLL - Behavioral
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DPLL is
    Port(
		 clk48MHz            : in STD_LOGIC;
		 reset               : in STD_LOGIC;
		 D_P						: in STD_LOGIC;
		 D_M						: in STD_LOGIC;
		 USB_data            : in STD_LOGIC;
		 EOP_pin 				: out boolean;
		 print_byte		      : out STD_LOGIC;
		 clk_recovered 		: out STD_LOGIC;
		 PID_byte_recovered	: out std_logic_vector(7 downto 0);
		 data_byte_recovered : out std_logic_vector(7 downto 0);
		 data_recovered      : out STD_LOGIC);
end DPLL;

architecture Behavioral of DPLL is

signal a,b : STD_LOGIC;--shadow signals for the rising and falling egde detection..
signal EOP : std_logic_vector(5 downto 0);


type state_type is (s_C,s_D,s_B,s_F,s_0,s_1,s_2,s_3,s_4,s_5,s_6,s_7);--12 states 
signal current_state,next_state : state_type;
signal internal_clk_recovered   : std_logic;
signal internal_data_recovered  : std_logic;
signal EOP_reg_in					  : std_logic;
signal EOP_found		           : boolean := false;
signal PID_recovered				  : std_logic_vector(7 downto 0);
signal data_byte   				  : std_logic_vector(7 downto 0); 


signal token_pkt: std_logic_vector(31 downto 0):=(others=>'0');
signal data_pkt : std_logic_vector(48 downto 0):=(others=>'0');
signal handshake_pkt : std_logic_vector(15 downto 0):=(others=>'0');

begin

clk_recovered <= internal_clk_recovered;

EOP_reg_in <= (NOT D_P) AND (NOT D_M); 

EOP_pin <= EOP_found;

data_byte_recovered <= data_byte;
PID_byte_recovered  <= PID_recovered;

six_bit_EOP_shift_reg:entity work.EOP_check_shift_reg PORT MAP(
	reset => reset,
	clock => clk48MHz,
	data  => EOP_reg_in,
	reg   => EOP
);

Inst_data_analyser: entity work.data_analyser PORT MAP(
	reset => reset,
	clk_recovered => internal_clk_recovered,
	data_recovered => internal_data_recovered,
	EOP_found_pin => EOP_found,
	print_byte => print_byte,
	PID_recovered => PID_recovered,
	data_byte => data_byte
);
-------------------------------------------Clock Recovery-------------------------------------------------------------------------------------

synchronizer : process(clk48MHz)--synchronizer 

begin
	if rising_edge (clk48MHz) then
		a <= USB_data;
	end if;
   if falling_edge (clk48MHz) then --elsif not synthasizable
		b <= USB_data; 
	end if;
end process;

state_memory : process(clk48MHz,reset,USB_data)

begin
	if reset = '1' or USB_data = 'U' then 
		current_state<=s_C;
	elsif (rising_edge(clk48Mhz)) then 
		current_state<=next_state;
	end if;
end process state_memory;


next_state_logic :process(current_state,a,b,EOP_found)

begin 
	internal_clk_recovered<='0';
	next_state<=s_C;--to avoid latches
	case current_state is 
		when s_C=>
			if b = '0' then 
				next_state<=s_D;
			else
				next_state<=s_C;
			end if;
			
		when s_D=>
			if b = '1' then 
				next_state<=s_5;
			else
				next_state<=s_D;
			end if;
			
		when s_5=>
			next_state<=s_7;
			
		when s_7=>
			internal_clk_recovered<='1';
			if a = '1' then 
				next_state<=s_6;
			else
				next_state<=s_B;
			end if;
		
		when s_6=>
			internal_clk_recovered<='1';
			if b = '1' then 
				next_state<=s_4;
			else
				next_state<=s_1;
			end if;
		
		when s_4=>
			if b = '1' then 
				next_state<=s_5;
			else
				next_state<=s_1;
			end if;
		
		when s_1=>
			next_state<=s_3;
			
		when s_3=>
			internal_clk_recovered<='1';
			if a = '0' then 
				next_state<=s_2;
			else
				next_state<=s_F;
			end if;
			
		when s_2=>
			internal_clk_recovered<='1';
			if b = '0' then 
				next_state<=s_0;
			else
				next_state<=s_5;
			end if;
			
		when s_0=>
			if b = '0' then 
				next_state<=s_1;
			else
				next_state<=s_5;
			end if;
			
		when s_B=>
			internal_clk_recovered<='1';
			next_state<=s_2;
		
		when s_F=>
			internal_clk_recovered<='1';
			next_state<=s_6;		
		
		When others=>--avoid lock out
			next_state<=s_C;
	end case;

	if (EOP_found) then 
		next_state<=s_C;
	end if;
	
end process next_state_logic;


capture_EOP:process(clk48MHz,EOP)

begin

	if((EOP = "111111")) then 
		EOP_found <= true;
	else
		EOP_found <= false;
	end if;

end process;

-------------------------------------------Data Recovery-------------------------------------------------------------------------------------

data_recovery:process(reset,internal_clk_recovered)

begin
    if reset = '1' then 
        internal_data_recovered<='0';
    elsif rising_edge(internal_clk_recovered) then
        internal_data_recovered<=USB_data;
    end if;
end process data_recovery;

data_recovered <= internal_data_recovered;

end Behavioral;
