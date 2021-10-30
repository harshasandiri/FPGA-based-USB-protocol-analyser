
-- VHDL Instantiation Created from source file counter.vhd -- 12:42:32 05/22/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT counter
	PORT(
		reset : IN std_logic;
		en : IN std_logic;
		clk : IN std_logic;          
		cout : OUT std_logic
		);
	END COMPONENT;

	Inst_counter: counter PORT MAP(
		reset => ,
		en => ,
		clk => ,
		cout => 
	);


