----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Harsha Sandirigama
-- 
-- Create Date:    08:17:22 05/17/2020 
-- Design Name: 
-- Module Name:    var_shift_reg - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity var_shift_reg is

	 Generic( n   : integer := 8);--register length
	 --if generic mapping is not performed default value will be utilized.
    Port ( 
			  enable: in  STD_LOGIC;
           clock : in  STD_LOGIC;
           data  : in  STD_LOGIC;
           reg   : out  STD_LOGIC_VECTOR ((n-1) downto 0));
			  
end var_shift_reg;

architecture Behavioral of var_shift_reg is
	signal shift_reg : std_logic_vector ((n-1) downto 0);  --shadow signal since we cant read the out "reg"
begin
shift_register : process(clock)
begin
	if (rising_edge(clock)) then
		if (enable = '1') then
			shift_reg(0) 			     <= data;
			shift_reg((n-1) downto 1)<= shift_reg((n-2) downto 0);
		end if;
	end if;
end process;
reg <= shift_reg;
end Behavioral;

