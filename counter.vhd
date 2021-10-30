----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Harsha Sandirigama
-- Design Name: 
-- Module Name:    counter - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port ( reset : in  STD_LOGIC;
           en    : in  STD_LOGIC;
           clk   : in  STD_LOGIC;
           cout  : out integer range 0 to 255);
end counter;

architecture Behavioral of counter is

signal counter : integer range 0 to 255:=0;

begin
process(clk,reset,en)
begin
	if reset = '1' then 
		counter <= 0;
	elsif (rising_edge(clk)) then 
		if en = '1' then 
			counter <= counter + 1;
		else 
			counter <= 0;
		end if;
	end if;
end process;

cout <= counter;

end Behavioral;

