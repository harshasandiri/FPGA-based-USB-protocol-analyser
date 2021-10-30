----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Harsha Sandirigama
-- 
-- Create Date:    08:17:22 05/17/2020 
-- Design Name: 
-- Module Name:    EOP_check_shift_reg - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EOP_check_shift_reg is

    Port ( reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           data  : in  STD_LOGIC;
           reg   : out  STD_LOGIC_VECTOR (5 downto 0));
			  
end EOP_check_shift_reg;

architecture Behavioral of EOP_check_shift_reg is

	signal shift_reg : std_logic_vector (5 downto 0);--shadow signal since we cant read the out "reg"

begin

shift_register : process(reset,clock)

begin

	if (reset = '1') then 
		shift_reg <= (others=> '1');
	elsif (rising_edge(clock)) then
		shift_reg(4 downto 0) <= shift_reg(5 downto 1);
		shift_reg(5) 			 <= data;
	end if;

end process;

reg <= shift_reg;

end Behavioral;

