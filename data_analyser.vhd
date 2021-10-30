----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Harsha Sandirigama
-- 
-- Create Date:    17:58:41 05/21/2020 
-- Design Name: 
-- Module Name:    data_analyser - Behavioral 
-- Project Name: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.PCK_CRC16_D1.all;
use work.PCK_CRC5_D1.all;

entity data_analyser is
    Port ( reset 				: in  STD_LOGIC;
           clk_recovered  	: in  STD_LOGIC;
           data_recovered  : in  STD_LOGIC;
           EOP_found_pin 	: in  boolean;
           PID_recovered 	: out  STD_LOGIC_VECTOR (7 downto 0);
			  print_byte		: out STD_LOGIC;
           data_byte 		: out  STD_LOGIC_VECTOR (7 downto 0));
end data_analyser;

architecture Behavioral of data_analyser is

signal byte_buffer      :std_logic_vector(7 downto 0);
signal byte_out_buffer  :std_logic_vector(7 downto 0):=(others=>'0');
signal token_out_buffer	:std_logic_vector(7 downto 0);
signal PID_recovered_sig:std_logic_vector(7 downto 0):=(others=>'0');
signal SYNC_detect 		:boolean := false;
signal token_detect		:boolean := false;
signal data_detect 		:boolean := false;
signal handshake_detect :boolean := false;
type PID_TYPE	is (PIDOUT,PIDIN,PIDSETUP,DATA0,DATA1,ACK,NACK,NYET,STALL,PID_NULL);
signal PID,handshake_type,token_type,data_packet_type	:PID_TYPE;



type state_type is (IDLE,PID_STATE,DATA_STATE,TOKEN_STATE,HANDSHAKE_STATE,CRC5_STATE,CRC16_STATE,EOP_STATE);
signal current_state,next_state : state_type;

signal enable_shift_reg:std_logic:='1';

signal counter_enable: std_logic:='0';
signal counter_val   : integer:=0;

signal print_byte_signal : std_logic := '1';

signal crc5 : std_logic_vector(4 downto 0);
signal crc16 : std_logic_vector(15 downto 0);
signal one_bit_counter : integer:=0;

constant SYNC 		:std_logic_vector(7 downto 0):="01010100";
constant PID_OUT  :std_logic_vector(7 downto 0):="11100001";
constant PID_IN   :std_logic_vector(7 downto 0):="01101001";
constant PID_SETUP:std_logic_vector(7 downto 0):="00101101";
constant DATA_0   :std_logic_vector(7 downto 0):="11000011";
constant DATA_1   :std_logic_vector(7 downto 0):="01001011";
constant ACK_PID  :std_logic_vector(7 downto 0):="11010010";
constant NACK_PID :std_logic_vector(7 downto 0):="01011010";
constant STALL_PID:std_logic_vector(7 downto 0):="00011110";
constant NYET_PID :std_logic_vector(7 downto 0):="10010110";

begin

Inst_var_shift_reg: entity work.var_shift_reg PORT MAP(
   enable=>enable_shift_reg,
	clock =>clk_recovered,
	data  =>data_recovered,
	reg   => byte_buffer
);

Inst_counter: entity work.counter PORT MAP(
	reset => reset,
	en => counter_enable,
	clk =>clk_recovered,
	cout =>counter_val  
);


data_byte <= byte_out_buffer;
PID_recovered <= PID_recovered_sig;
print_byte <= print_byte_signal;

sync_PID_byte_detector:process(byte_buffer)
begin
			SYNC_detect     <= false;
			token_detect    <= false;
			data_detect     <= false;
			handshake_detect<= false;
	PID_recovered_sig<=(others=>'0');

	case byte_buffer is
		when SYNC =>
			SYNC_detect <= true;
		when DATA_0 =>
			data_detect <= true;
			PID <= DATA0;
			PID_recovered_sig <= byte_buffer;
		when DATA_1 =>
			data_detect <= true;
			PID <= DATA1;
			PID_recovered_sig <= byte_buffer;
		when PID_IN =>
			PID <= PIDIN;
		when PID_OUT =>
			token_detect <= true;
			PID <= PIDOUT;	
			PID_recovered_sig <= byte_buffer;
		when PID_SETUP =>
			token_detect <= true;
			PID <= PIDSETUP;
			PID_recovered_sig <= byte_buffer;
		when ACK_PID =>
			handshake_detect <= true;
			PID <= ACK;
			PID_recovered_sig <= byte_buffer;
		when NACK_PID =>
			handshake_detect <= true;
			PID <= NACK;	
			PID_recovered_sig <= byte_buffer;
		when STALL_PID =>
			handshake_detect <= true;
			PID <= STALL;
			PID_recovered_sig <= byte_buffer;
		when NYET_PID =>
			handshake_detect <= true;
			PID <= NYET;
			PID_recovered_sig <= byte_buffer;
		when others =>
			SYNC_detect     <= false;
			token_detect    <= false;
			data_detect     <= false;
			handshake_detect<= false;
			PID_recovered_sig<=(others=>'0');
	end case;
end process;

PID_recovered <= PID_recovered_sig;

state_memory : process(clk_recovered,reset)

begin
	if reset = '1' then 
		current_state<=IDLE;
		one_bit_counter <= 0;
	elsif (rising_edge(clk_recovered)) then 
		case current_state is 
			when IDLE=>
				crc5<=(others=>'1');
				crc16<=(others=>'1');
			when TOKEN_STATE=>
				crc5<=nextCRC5_D1(data_recovered,crc5);
			when DATA_STATE=>
				crc16<=nextCRC16_D1(data_recovered,crc16);
			when others=>
				null;
		end case;
		
		if(data_recovered = '0') then 
			one_bit_counter <= 0;
		elsif (one_bit_counter = 6) then
			one_bit_counter <= 0;
		else
			one_bit_counter<=one_bit_counter+1;
		end if;
		
		current_state<=next_state;
	end if;
end process state_memory;

next_state_logic :process(current_state,SYNC_detect,
token_detect,data_detect,handshake_detect,counter_val,one_bit_counter,byte_buffer,EOP_found_pin,PID)

begin

	counter_enable<='0';--avoid latches
	print_byte_signal<='0';
	enable_shift_reg<='1';
	next_state<=IDLE;
	token_out_buffer<=(others=>'0');
	byte_out_buffer<=(others=>'0');
	handshake_type<=NYET;
	token_type<=PID_NULL;
	data_packet_type<=DATA0;
	
	case current_state is
		
		when IDLE=>
			if SYNC_detect then 
				next_state<=PID_STATE;
			else 
				next_state<=IDLE;
			end if;
			
		when PID_STATE=>
			counter_enable<='1';
			if counter_val = 7 then
				counter_enable<='0';
				print_byte_signal<='1';
				if token_detect then 
					next_state<=TOKEN_STATE;
				elsif data_detect then
					next_state<=DATA_STATE;
				elsif handshake_detect then
					next_state<=HANDSHAKE_STATE;
				else 
					next_state<=IDLE;
				end if;
			else
				next_state<=PID_STATE;
				print_byte_signal<='1';
			end if;
			
		when HANDSHAKE_STATE=>
			if (EOP_found_pin) then 
				next_state<=IDLE;
			else
				case PID is 
					when ACK=>
						handshake_type<=ACK;
					when NACK=>
						handshake_type<=NACK;
					when STALL=>
						handshake_type<=STALL;
					when others=>
						handshake_type<=NYET;
				end case;
				next_state<=HANDSHAKE_STATE;
			end if;
			
		when TOKEN_STATE=>
			counter_enable<='1';
			case PID is 
					when PIDOUT=>
						token_type<=PIDOUT;
					when PIDIN=>
						token_type<=PIDIN;
					when PIDSETUP=>
						token_type<=PIDSETUP;
					when others=>
						NULL;
			end case;
			if (EOP_found_pin) then --high priority..
				next_state<=IDLE;--do the CRC5
				counter_enable<='0';
			elsif counter_val = 7 then
				counter_enable<='0';
				token_out_buffer<=byte_buffer;
			else
				next_state<=TOKEN_STATE;	
			end if;
			
			
		when DATA_STATE=>
			counter_enable<='1';
			
			case PID is 
				when DATA0=>
					data_packet_type<=PIDOUT;
				when DATA1=>
					data_packet_type<=PIDIN;
				when others=>
					NULL;
			end case;
			
			if (one_bit_counter /= 6) then
				enable_shift_reg<='1';
			else
				enable_shift_reg<='0';
			end if;
			
			if (EOP_found_pin) then --high priority..
				next_state<=IDLE;--do the CRC16
				counter_enable<='0';
				print_byte_signal<='0';				
			elsif counter_val = 7 then
				counter_enable<='0';
				byte_out_buffer<=byte_buffer;
				print_byte_signal<='1';
			else 
				next_state<=DATA_STATE;
				print_byte_signal<='0';
			end if;

		when others=>
			next_state<=IDLE;
			byte_out_buffer<=(others=>'0');
			handshake_type<=NYET;
			token_type<=PID_NULL;
			data_packet_type<=DATA0;
			
	end case;	
	
end process;

end Behavioral;

