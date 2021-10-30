
-- VHDL Instantiation Created from source file data_analyser.vhd -- 08:32:06 05/22/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT data_analyser
	PORT(
		reset : IN std_logic;
		clk_recovered : IN std_logic;
		data_recovered : IN std_logic;
		EOP_found_pin : IN std_logic;          
		PID_recovered : OUT std_logic_vector(7 downto 0);
		data_byte : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_data_analyser: data_analyser PORT MAP(
		reset => ,
		clk_recovered => ,
		data_recovered => ,
		EOP_found_pin => ,
		PID_recovered => ,
		data_byte => 
	);


