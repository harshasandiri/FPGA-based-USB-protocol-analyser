
-- VHDL Instantiation Created from source file DPLL.vhd -- 18:13:00 05/21/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT DPLL
	PORT(
		clk48MHz : IN std_logic;
		reset : IN std_logic;
		D_P : IN std_logic;
		D_M : IN std_logic;
		USB_data : IN std_logic;          
		EOP_pin : OUT std_logic;
		clk_recovered : OUT std_logic;
		data_recovered : OUT std_logic
		);
	END COMPONENT;

	Inst_DPLL: DPLL PORT MAP(
		clk48MHz => ,
		reset => ,
		D_P => ,
		D_M => ,
		USB_data => ,
		EOP_pin => ,
		clk_recovered => ,
		data_recovered => 
	);


