module testbench();

timeunit 10ns;

timeprecision 1ns;

logic Clk = 0;
logic Reset = 0;
logic Start = 0;
logic lfsr_enable;
logic [31:0] random_range100;
logic [31:0] lfsr_out;

logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
 logic [8:0]  LEDG;
 logic [17:0] LEDR;
  // VGA Interface 
  logic [7:0]  Red,Green,Blue;
  logic        VGA_clk,
 sync,
 blank,
 vs,
 hs;
  // CY7C67200 Interface
  wire [15:0]  OTG_DATA;						//	CY7C67200 Data bus 16 Bits
  logic [1:0]  OTG_ADDR;						//	CY7C67200 Address 2 Bits
  logic        OTG_CS_N,						//	CY7C67200 Chip Select
 OTG_RD_N,						//	CY7C67200 Write
 OTG_WR_N,						//	CY7C67200 Read
 OTG_RST_N;				//	CY7C67200 Reset
  logic			 OTG_INT;						//	CY7C67200 Interrupt
  // SDRAM Interface for Nios II Software
  logic [12:0] sdram_wire_addr;				// SDRAM Address 13 Bits
  wire[31:0]  sdram_wire_dq;				// SDRAM Data 32 Bits
  logic [1:0]  sdram_wire_ba;				// SDRAM Bank Address 2 Bits
  logic [3:0]  sdram_wire_dqm;		// SDRAM Data Mast 4 Bits
  logic			 sdram_wire_ras_n;		// SDRAM Row Address Strobe
  logic			 sdram_wire_cas_n;			// SDRAM Column Address Strobe
  logic			 sdram_wire_cke;				// SDRAM Clock Enable
  logic			 sdram_wire_we_n;				// SDRAM Write Enable
  logic			 sdram_wire_cs_n;				// SDRAM Chip Select
  logic			 sdram_clk;	
  logic [8*11:1] 			 word;
  logic [15:0] output_value_vd;
 logic [3:0] output_mux;
 logic [1:0] dsc_output;
 logic [3:0] htd_output1;
 logic [3:0] htd_output2;
 logic [1:0] tens_place = 0;
logic 		counter_signal;
logic load_seed;

//COntrol unit
 logic [3:0] direction;
 logic starting_pos;
 logic [7:0] keycode;
 
 
  Final_Project Final_Project1(.*);
  
  always begin : CLOCK_GENERATION
	#1 Clk = ~Clk;
end

// TESTING

initial begin : TEST_VECTORS
	Reset = 1;
	
	#0
	load_seed = 1;
	#1
	lfsr_enable = 1;
	
		#2
	Reset = 0;
	
	#2 
	lfsr_enable = 1;
	
	#3
	load_seed = 1;
	
	#4
	load_seed = 0;

		
	#3
	keycode = 1;
	
	#5
	keycode = 2;
	
	#9
	keycode = 3;
	
	#13
	keycode = 4;
	
	#2
	direction = 1;
	
	#4 
	direction = 2;
	
	#5 
	direction = 4;
	

	
	#4
	$display(word[0],word[1],word[2]);
end
	

  
  endmodule