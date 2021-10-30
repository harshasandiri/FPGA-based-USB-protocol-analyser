
-- VHDL Instantiation Created from source file var_shift_reg.vhd -- 18:05:35 05/21/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT var_shift_reg
	PORT(
		reset : IN std_logic;
		clock : IN std_logic;
		data : IN std_logic;          
		reg : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_var_shift_reg: var_shift_reg PORT MAP(
		reset => ,
		clock => ,
		data => ,
		reg => 
	);


