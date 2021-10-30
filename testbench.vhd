----------------------------------------------------------------------------------
-- Engineer: Harsha Sandirigama
-- Create Date: 29.03.2020 21:19:39
-- Module Name: testbench
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.PCK_CRC16_D1.all;
use work.PCK_CRC5_D1.all;

entity testbench is
end testbench;

architecture behav of testbench is

    component DPLL
        port (clk48MHz       : in std_logic;
              reset          : in std_logic;
				  D_P				  : in STD_LOGIC;
		        D_M				  : in STD_LOGIC;
              USB_data       : in std_logic;
				  EOP_pin 		  : out boolean;
				  print_byte	  : out STD_LOGIC;
				  PID_byte_recovered	: out std_logic_vector(7 downto 0);
		        data_byte_recovered : out std_logic_vector(7 downto 0);
              clk_recovered  : out std_logic;
              data_recovered : out STD_LOGIC);
    end component;

    signal clk48MHz       : std_logic;
    signal reset          : std_logic;
	 signal D_P				  : std_logic:='1';
    signal D_M				  : std_logic:='0';
	 signal USB_data       : std_logic;
	 signal EOP_pin 		  : boolean;
	 signal print_byte	  : STD_LOGIC;
    signal clk_recovered  : std_logic;
    signal data_recovered : std_logic;
	 signal data_byte_recovered : std_logic_vector(7 downto 0);
	 signal PID_byte_recovered :std_logic_vector(7 downto 0);

	-- Clock period definitions
	constant clk12MHz_period : time    := 10 ns;   --10MHz, simulate with 10Mhz instead 12Mhz
	constant clk48MHz_period : time    := 2.4 ns;  --40Mhz
	signal complete          : boolean := false;
		 
    --signals for LFSR
   signal clk12MHz   : std_logic;
	signal LFSR       : std_logic_vector(7 downto 0):="01001111";
	 
	 --signals for rx/tx
	type tx_type is (tx_OUT,tx_IN,SOF,SETUP);
	type DATA_SEL_TYPE is (DATA0,DATA1);
	type handshake_type is (ACK,NACK,NYET,STALL);
	 
	 
	 --fill data packet procedure
	procedure fill_data
						(DATA_SEL             : DATA_SEL_TYPE;
						 variable data_packet : out std_logic_vector;
						 signal LFSR          : inout std_logic_vector) is
							 
		variable feedback :std_logic;
		constant SYNC     :std_logic_vector(7 downto 0):="01010100";
		variable PID      :std_logic_vector(7 downto 0);
		variable data     :std_logic_vector(7 downto 0);
		constant DATA_0   :std_logic_vector(7 downto 0):="11000011";
		constant DATA_1   :std_logic_vector(7 downto 0):="01001011";
		variable NRZI_BIT :std_logic:='0';
		variable CRC16		:std_logic_vector(15 downto 0);

	begin
			
			for i in data'range loop
				feedback := LFSR(7) xor LFSR(5) xor LFSR(4) xor LFSR(3);
				LFSR     <= feedback & LFSR(7 downto 1);
				data(i)  := LFSR(i);
			end loop;
			
			for i in data'range loop--NRZI encoding the data field.
				if (data(i)='0') then 
					NRZI_BIT := not NRZI_BIT;
				end if;
				data(i) := NRZI_BIT;
			end loop;
			
			CRC16:=(others=>'1');
			
			for i in data'range loop
				CRC16:=nextCRC16_D1(data(i),CRC16);
			end loop;
			
			if DATA_SEL = DATA0 then 
				PID := DATA_0;
			elsif DATA_SEL = DATA1 then 
				PID := DATA_1;
			end if;
			
			data_packet := SYNC & PID & data & CRC16;
			
	end procedure;
	
	
	--fill token packet
	procedure fill_token(tx_state      : tx_type;
						      variable token: out std_logic_vector)is
	
		variable PID      :std_logic_vector(7 downto 0);
		constant SYNC     :std_logic_vector(7 downto 0):="01010100";
		variable address  :std_logic_vector(6 downto 0);
		variable endpoint :std_logic_vector(3 downto 0);
		variable CRC5_data:std_logic_vector(10 downto 0);
		constant PID_OUT  :std_logic_vector(7 downto 0):="11100001";
		constant PID_IN   :std_logic_vector(7 downto 0):="01101001";
		constant PID_SETUP:std_logic_vector(7 downto 0):="00101101";
		variable CRC5     :std_logic_vector(4 downto 0);
		
	begin 
			address  :="0000111";
			endpoint :="0001";
			
			case tx_state is 
				when tx_OUT=>
					PID := PID_OUT;
				when tx_IN=>
					PID := PID_IN;
				when SETUP=>
					PID := PID_SETUP;
				when others=>
					PID := "00000000";		
			end case;
			
			CRC5_data:= address & endpoint;--adress+endpoint
			CRC5     :=(others=>'1');
			
			for i in CRC5_data'range loop
				CRC5 := nextCRC5_D1(CRC5_data(i),CRC5);--SEED GETS UPDATED!
			end loop;
			
			token := SYNC & PID & address & endpoint & CRC5;
			
	end procedure;

   --fill handshake packet
	procedure fill_handshake(variable handshake:out std_logic_vector;
									 handshake_sel     : handshake_type)is
	
		constant SYNC     :std_logic_vector(7 downto 0):="01010100";
		variable PID      :std_logic_vector(7 downto 0);
		constant ACK_PID  :std_logic_vector(7 downto 0):="11010010";
		constant NACK_PID :std_logic_vector(7 downto 0):="01011010";
		constant STALL_PID:std_logic_vector(7 downto 0):="00011110";
		constant NYET_PID :std_logic_vector(7 downto 0):="10010110";
		
	begin
		
		case handshake_sel is 
			when ACK=>
				PID := ACK_PID;
			when NACK=>
				PID := NACK_PID;
			when STALL=>
				PID := STALL_PID;
			when NYET=>
				PID := NYET_PID;	
			when others=>
				PID := NYET_PID;		
		end case;		
		
		handshake := SYNC & PID;	
		
	end procedure;
	
	--send token pkt
	procedure token_tx(signal D_P		: inout std_logic;
							 signal D_M		: inout std_logic;
							 tx_state      : tx_type;
							 variable token: inout std_logic_vector) is
			
		variable print_ptr : line;
	
	begin 
		fill_token(tx_state,token);
		
		write(print_ptr, string'("Token pkt tx => "));		
		write(print_ptr, to_bitvector(token),left,token'length);--convert to bit vector
		write(output,  print_ptr.all & lf);-- Another way for debug printing, LF = line feed = new line, --output is to print to console
		deallocate(print_ptr);--set pointer to null.
		
		wait until rising_edge(clk12Mhz);--start at the rising edge..
		
		for b in token'range loop 
			D_P <= token(b); 
			D_M <= not token(b);
			wait until rising_edge(clk12Mhz);
		end loop;
		
		--EOP 
		D_P <= '0'; D_M <= '0'; wait until rising_edge(clk12Mhz);--SE0
		D_P <= '0'; D_M <= '0'; wait until rising_edge(clk12Mhz);--SE0
		D_P <= '1'; D_M <= '0'; wait until rising_edge(clk12Mhz);--J

	end procedure;
	

	--send data pkt
	procedure data_tx(signal D_P				: inout std_logic;
							signal D_M				: inout std_logic;
						   DATA_SEL             : DATA_SEL_TYPE;
							signal LFSR				: inout std_logic_vector;
							variable data_packet : inout std_logic_vector) is
	
		variable print_ptr : line;
		variable count     : integer := 0;
	
	begin 
		fill_data(DATA_SEL,data_packet,LFSR);
		
		write(print_ptr, string'("Data pkt tx => "));		
		write(print_ptr, to_bitvector(data_packet),left,data_packet'length);
		write(output,  print_ptr.all & lf);
		deallocate(print_ptr);
		
		wait until rising_edge(clk12Mhz);--start at the rising edge..
		
		for b in data_packet'range loop 
			
			if(data_packet(b) = '1') then  --bit stuffing
				count := count + 1;
			else 
				count := 0;
			end if; 
			
			if (count = 6) then 
				count := 0; 
				D_P <= '0';--stuff a zero if six consecutive ones. 
				D_M <= '1';
				wait until rising_edge(clk12Mhz);
			end if;--following will add the sitxh one after the stuffed bit.
			
			D_P <= data_packet(b);
			D_M <= not data_packet(b);
			
			wait until rising_edge(clk12Mhz);
			
		end loop;
		
		--EOP 
		D_P <= '0'; D_M <= '0'; wait until rising_edge(clk12Mhz);--SE0
		D_P <= '0'; D_M <= '0'; wait until rising_edge(clk12Mhz);--SE0
		D_P <= '1'; D_M <= '0'; wait until rising_edge(clk12Mhz);--J

	end procedure;
	
	--receive handshake pkt
	procedure handshake_rx(signal D_P				  : inout std_logic;
								  signal D_M				  : inout std_logic;
							     hanshake_sel            : handshake_type;
							     variable handshake_pkt  : inout std_logic_vector) is
	
		variable print_ptr : line;
	
	begin 
		fill_handshake(handshake_pkt,hanshake_sel);
		
		write(print_ptr, string'("Handshake pkt tx => "));		
		write(print_ptr, to_bitvector(handshake_pkt),left,handshake_pkt'length);
		write(output,  print_ptr.all & lf);
		deallocate(print_ptr);
		
		wait until rising_edge(clk12Mhz);--start at the rising edge..
		
		for b in handshake_pkt'range loop
			D_P <= handshake_pkt(b); 
			D_M <= not handshake_pkt(b);
			wait until rising_edge(clk12Mhz);
		end loop;
		
		--EOP 
		D_P <= '0'; D_M <= '0'; wait until rising_edge(clk12Mhz);--SE0
		D_P <= '0'; D_M <= '0'; wait until rising_edge(clk12Mhz);--SE0
		D_P <= '1'; D_M <= '0'; wait until rising_edge(clk12Mhz);--J

	end procedure;
	
begin

    dut : DPLL
    port map (clk48MHz       => clk48MHz,
              reset          => reset,
				  D_P				  => D_P,
				  D_M				  => D_M,
              USB_data       => USB_data,
				  EOP_pin 		  => EOP_pin,
				  print_byte	  => print_byte,
				  PID_byte_recovered => PID_byte_recovered,
		        data_byte_recovered => data_byte_recovered ,
              clk_recovered  => clk_recovered,
              data_recovered => data_recovered);

    -- Clock generation
    clock_process_1 :process
    begin
			loop
				clk48MHz <= '0';
				wait for clk48MHz_period/2;
				clk48MHz <= '1';
				wait for clk48MHz_period/2;
				if (complete) then
					exit;
				end if; 
			end loop;
		
		wait;	
    end process;
	
	 clock_process_2 :process
    begin
			loop	
				clk12MHz <= '0';
				wait for clk12MHz_period/2;
				clk12MHz <= '1';
				wait for clk12MHz_period/2;
				if (complete) then
					exit;
				end if;
			end loop;
			
		wait;	
    end process;
	 
	 
	print_output:process
		variable print_ptr : line;
		constant PID_OUT  :std_logic_vector(7 downto 0):="11100001";
		constant PID_IN   :std_logic_vector(7 downto 0):="01101001";
		constant PID_SETUP:std_logic_vector(7 downto 0):="00101101";
		constant DATA_0_P   :std_logic_vector(7 downto 0):="11000011";
		constant DATA_1_P   :std_logic_vector(7 downto 0):="01001011";
		constant ACK_PID  :std_logic_vector(7 downto 0):="11010010";
		constant NACK_PID :std_logic_vector(7 downto 0):="01011010";
		constant STALL_PID:std_logic_vector(7 downto 0):="00011110";
		constant NYET_PID :std_logic_vector(7 downto 0):="10010110";
	begin
		wait until rising_edge(clk_recovered);
		loop
			if (PID_byte_recovered/=(PID_byte_recovered'range=>'0')and print_byte='1') then
				write(print_ptr, string'("PID recovered => "));		
				write(print_ptr, to_bitvector(PID_byte_recovered),left,PID_byte_recovered'length);
				case PID_byte_recovered is
					when PID_OUT=>
						write(print_ptr, lf & string'("PID type identified => OUT"));	
					when PID_IN=>
						write(print_ptr, lf & string'("PID type identified => IN"));	
					when PID_SETUP=>
						write(print_ptr, lf & string'("PID type identified => SETUP"));	
					when DATA_0_P=>
						write(print_ptr, lf & string'("PID type identified => DATA0"));	
					when DATA_1_P=>
						write(print_ptr, lf & string'("PID type identified => DATA1"));	
					when ACK_PID=>
						write(print_ptr, lf & string'("PID type identified => ACK"));	
					when NACK_PID=>
						write(print_ptr, lf & string'("PID type identified => NACK"));
					when STALL_PID=>
						write(print_ptr, lf & string'("PID type identified => STALL"));
					when NYET_PID=>
						write(print_ptr, lf & string'("PID type identified => NYET"));
					when others=>
						NULL;
				end case;
				write(output,print_ptr.all & lf);
				deallocate(print_ptr);
			end if;
			
			if (data_byte_recovered/=(data_byte_recovered'range=>'0') and print_byte='1') then 
				write(print_ptr, string'("data byte recovered => "));		
				write(print_ptr, to_bitvector(data_byte_recovered),left,data_byte_recovered'length);
				write(output,  print_ptr.all & lf);
				deallocate(print_ptr);
			end if;
			
			wait until rising_edge(clk_recovered);
			if(complete) then
				exit;
			end if;
		end loop;
	end process;
	
		 
	USB_frame_tx_rx:process
	 
		variable data_pkt     : std_logic_vector(39 downto 0);
		variable handshake_pkt: std_logic_vector(15 downto 0);
		variable token_pkt    : std_logic_vector(31 downto 0);
		
	 begin
			
		reset <= '1';
		wait for 100ns; --keeps repeating the waveform
		reset <= '0';
		
		token_tx(D_P,D_M,tx_OUT,token_pkt);wait for 100ns;--1st OUT transaction
		data_tx(D_P,D_M,DATA0,LFSR,data_pkt);wait for 100ns;
		handshake_rx(D_P,D_M,ACK,handshake_pkt);wait for 100ns;
		
--		token_tx(D_P,D_M,tx_OUT,token_pkt);wait for 100ns;--2nd OUT transaction
--		data_tx(D_P,D_M,DATA0,LFSR,data_pkt);wait for 100ns;
--		handshake_rx(D_P,D_M,ACK,handshake_pkt);wait for 100ns;

		--Stop the clock and hence terminate the simulation
		complete <= true;
		wait; --process suspended forever.
			
	end process;
    
   USB_data <= D_P; --assume D_P as DPLL input...
 
end behav;
