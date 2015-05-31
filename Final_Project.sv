module Final_Project(
						input		 	Clk, Reset, Start, lfsr_enable,
						output [6:0]  	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
						output [8:0]  	LEDG,
						output [17:0] 	LEDR,
							  // VGA Interface 
						output [7:0]	Red, Green, Blue,
						output			VGA_clk, sync, blank, vs, hs,
												 
							  // CY7C67200 Interface
							  inout [15:0]  OTG_DATA,						//	CY7C67200 Data bus 16 Bits
							  output [1:0]  OTG_ADDR,						//	CY7C67200 Address 2 Bits
							  output logic	   OTG_CS_N,						//	CY7C67200 Chip Select
												 OTG_RD_N,						//	CY7C67200 Write
												 OTG_WR_N,						//	CY7C67200 Read
												 OTG_RST_N,						//	CY7C67200 Reset
							  input			 OTG_INT,						//	CY7C67200 Interrupt
							  // SDRAM Interface for Nios II Software
							  output logic [12:0] sdram_wire_addr,				// SDRAM Address 13 Bits
							  inout [31:0]  sdram_wire_dq,				// SDRAM Data 32 Bits
							  output logic[1:0]  sdram_wire_ba,				// SDRAM Bank Address 2 Bits
							  output logic[3:0]  sdram_wire_dqm,				// SDRAM Data Mast 4 Bits
							  output	logic		 sdram_wire_ras_n,			// SDRAM Row Address Strobe
							  output	logic		 sdram_wire_cas_n,			// SDRAM Column Address Strobe
							  output	logic		 sdram_wire_cke,				// SDRAM Clock Enable
							  output	logic		 sdram_wire_we_n,				// SDRAM Write Enable
							  output	logic		 sdram_wire_cs_n,				// SDRAM Chip Select
							  output	logic		 sdram_clk				// SDRAM Clock
//							  output logic [31:0] lfsr_out,					//feedback register out
//							  output logic [31:0] random_range100,
//							  output logic [8*11:1] word,
//							  input [3:0] direction,
//							  output logic starting_pos,
//							  input 	[7:0] keycode,
//							  input load_seed
							  
//							  output logic [15:0] output_value_vd,
//							  output logic [3:0] output_mux,
//							  output logic [1:0] dsc_output,
//							  input [1:0] tens_place,
//							  output logic [3:0] htd_output2,
//							  output logic [3:0] htd_output1

							  
								);	
											
			logic Reset_h, vssig;
			logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
			
			logic [15:0] sprite [15:0];
			logic [1:0] sprite_location;
			//UNCOMMENT THIS FOR THE FPGA
			logic [7:0] keycode;
			logic [3:0] direction;
			logic start_counter;
			
			logic [31:0] seed = 8'h1ef23;

			logic temp;
			
			//random word
			logic [31:0] lfrs_out;
			logic [31:0] random_range100;
			logic [8*12-1:0] word;
			
			//1's place logic
			logic [15:0] output_value_vd;
			logic [3:0] output_mux;
			logic [1:0] dsc_output;
			
			//1's 10's 100's hex display input
			logic [3:0] htd_output1;
			logic [3:0] htd_output2;
			logic [3:0] htd_output100;
			
			//counter signals
			logic 		counter_signal;
			logic 		counter_signal1;
			logic 		counter_signal100;
			
			//10's place logic
			logic [15:0] output_value_vd1;
			logic [3:0] output_mux1;
			logic [1:0] dsc_output1;
			
			//100's place logic
			logic [15:0] output_value_vd100;
			logic [3:0] output_mux100;
			logic [1:0] dsc_output100;
	
			assign Reset_h = ~(Reset);  // The push buttons are active low
			assign OTG_FSPEED = 1'bz;
			assign OTG_LSPEED = 1'bz;
			
			
		 usb_system usbsys_instance(
										 .clk_clk(Clk),		 
										 .reset_reset_n(1'b1),   
										 .sdram_wire_addr(sdram_wire_addr), 
										 .sdram_wire_ba(sdram_wire_ba),   
										 .sdram_wire_cas_n(sdram_wire_cas_n),
										 .sdram_wire_cke(sdram_wire_cke),  
										 .sdram_wire_cs_n(sdram_wire_cs_n), 
										 .sdram_wire_dq(sdram_wire_dq),   
										 .sdram_wire_dqm(sdram_wire_dqm),  
										 .sdram_wire_ras_n(sdram_wire_ras_n),
										 .sdram_wire_we_n(sdram_wire_we_n), 
										 .sdram_out_clk_clk(sdram_clk),
										 .keycode_export(keycode),  
										 .usb_DATA(OTG_DATA),	
										 .usb_ADDR(OTG_ADDR),	
										 .usb_RD_N(OTG_RD_N),	
										 .usb_WR_N(OTG_WR_N),	
										 .usb_CS_N(OTG_CS_N),	
										 .usb_RST_N(OTG_RST_N),   
										 .usb_INT(OTG_INT) );


	
			parameter size_y = 15;
			parameter size_x = 27;
			
			logic init, game_ready, game_start;
			
			logic [5:0] ball_x, ball_y;
			logic [7:0] collected_letter, collected_letter2, ilc;
			
			logic [0:size_x-1]
				desired_maze		[size_y-1:0], 
				maze 				[size_y-1:0],
				maze_letters		[size_y-1:0],
				init_maze_letters	[size_y-1:0],
				unocc_maze_blocks	[size_y-1:0],
				down_constraint 	[size_y-1:0], 
				up_constraint 		[size_y-1:0], 
				left_constraint 	[size_y-1:0], 
				right_constraint 	[size_y-1:0];	
			
			
			assign desired_maze[0] 	= 27'b111111111111111111111111111;
			assign desired_maze[1] 	= 27'b100000000000000000000000001;
			assign desired_maze[2] 	= 27'b100000000000000000000000001;
			assign desired_maze[3] 	= 27'b100000000000000000000000001;
			assign desired_maze[4] 	= 27'b100000000000000000000000001;
			assign desired_maze[5] 	= 27'b100000000000000000000000001;
			assign desired_maze[6] 	= 27'b100000000000000000000000001;
			assign desired_maze[7] 	= 27'b100000000000000000000000001;
			assign desired_maze[8] 	= 27'b100000000000000000000000001;
			assign desired_maze[9] 	= 27'b100000000000000000000000001;
			assign desired_maze[10]	= 27'b100000000000000000000000001;
			assign desired_maze[11]	= 27'b100000000000000000000000001;
			assign desired_maze[12] = 27'b100000000000000000000000001;
			assign desired_maze[13] = 27'b100000000000000000000000001;
			assign desired_maze[14] = 27'b111111111111111111111111111;
			
//			assign desired_maze[0] 	= 27'b111111111111111111111111111;
//			assign desired_maze[1] 	= 27'b100000000000000000000000001;
//			assign desired_maze[2] 	= 27'b101000100010001000100111001;
//			assign desired_maze[3] 	= 27'b101000100101001100101000001;
//			assign desired_maze[4] 	= 27'b101111100000101010101001101;
//			assign desired_maze[5] 	= 27'b101000101111101001101000101;
//			assign desired_maze[6] 	= 27'b101000101000101000100111001;
//			assign desired_maze[7] 	= 27'b100000000000000000000000001;
//			assign desired_maze[8] 	= 27'b101000100010001111101111101;
//			assign desired_maze[9] 	= 27'b101101100101000001001000001;
//			assign desired_maze[10]	= 27'b101010101000100010001110001;
//			assign desired_maze[11]	= 27'b101000101111100100001000001;
//			assign desired_maze[12] = 27'b101000101000101111101111101;
//			assign desired_maze[13] = 27'b100000000000000000000000001;
//			assign desired_maze[14] = 27'b111111111111111111111111111;

//			assign desired_maze[10] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[11] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[12] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[13] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[14] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[15] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[16] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[17] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[18] = 40'b1000000000000000000000000000000000000001;
//			assign desired_maze[19] = 40'b1111111111111111111111111111111111111111;
			
			generate
				genvar y, x;
				for (y = 0; y < size_y; y++)
				begin: create_y
					for (x = 0; x < size_x; x++)
					begin: create_x
						if ( y != 1 && x != 1 ) // initial player position
							assign unocc_maze_blocks[y][x] = ~desired_maze[y][x];
						else
							assign unocc_maze_blocks[y][x] = 1'b0;
					end
				end
			endgenerate
			
			game_control #(.size_y(size_y), .size_x(size_x)) gc (
				.Clk(Clk),
				.Start(Start),
				.Reset(Reset), // active low
				.init(init),
				.win(win),
				.lose(lose),
				.start(game_start),
				.ilc(ilc),
				.init_maze_letters(init_maze_letters),
				.ready(game_ready)
			);
			
			maze_world #(.size_y(size_y), .size_x(size_x)) mw ( 
				.*
			);
			
			maze_letter #(.size_y(size_y), .size_x(size_x)) ml (
				.Clk(Clk),
				.Reset(Reset), //ACTIVE LOW
				.init(init),
				.ilc(ilc),
				.init_maze_letters(init_maze_letters),
				.ball_x(ball_x),
				.ball_y(ball_y),
				.maze_letters(maze_letters),
				.collected_letter(collected_letter),
				.check_guess(check_guess),
				.collected_next_round(collected_next_round)
			);
			
			random_no rand1(
				.clk(Clk),
				.reset(Reset_h),
				.clk_en(game_start),
				.load(1'b0),
				.seed(seed),
				.out(lfsr_out),
				.random_range100(random_range100)
			);
				
			random_word rw(
				.Clk(Clk),
				.index(random_range100),
				.word(word),
				.length(length)
			);
	
			vga_controller vgasync_instance(
				.*,
				.Clk(Clk),
				.Reset(Reset_h),
				.pixel_clk(VGA_clk),
				.DrawX(drawxsig),
				.DrawY(drawysig)
			);
			
			sprite_table st(
				1'b0,
				sprite
			);
			
			game_entity g(
				1'b0,
				sprite_location
			);
			
			color_mapper #(.size_y(size_y), .size_x(size_x)) cm (
				.game_ready(game_ready),
				.DrawX(drawxsig), 
				.DrawY(drawysig), 
				.BallX(ballxsig), 
				.BallY(ballysig), 
				.Ball_size(ballsizesig),
				.ball_x(ball_x),
				.ball_y(ball_y),
				.screen_loc(screen_location), 
				.sprite(sprite), 
				.Red(Red), 
				.Green(Green), 
				.Blue(Blue),
				.maze(maze), 
				.maze_letters(maze_letters),
				.collected_letter(collected_letter),
				
				.check_guess(check_guess), // for debugging, just in case it shows up all the time and stuff. don't want that, ya know
				.body(body),
				.revealed(revealed),
				.length(length),
				.missed(missed), // the missed letters
				.win(win),
				.lose(lose)
			);
	
			ball #(.size_y(size_y), .size_x(size_x)) b (
				.game_ready(game_ready),
				.Keycode(keycode), 
				.Reset(Reset_h), 
				.frame_clk(vs), 
				.Clk(Clk), 
				.BallX(ballxsig), 
				.BallY(ballysig), 
				.BallS(ballsizesig),
				.ball_x(ball_x),
				.ball_y(ball_y),
				.up_constraint(up_constraint), 
				.down_constraint(down_constraint), 
				.right_constraint(right_constraint), 
				.left_constraint(left_constraint)
			);
			
			logic check_guess, miss, lose, win;
			logic [47:0] missed;
			logic [79:0] hm_word, revealed;
			logic [2:0] body;
			logic [3:0] length;

			hangman hm (
				.Clk(collected_next_round),
				.Reset(Reset), //active low
				.check_guess(check_guess),
				.guess(collected_letter),
				.revealed(revealed),
				.word(word),
				.missed(missed),			// holds 6 letters, used to tell which letters were wrong
				.length(length),
				.body(body),
				.win(win),
				.lose(lose),
				.miss(miss)
			);
			
//			61 a	62 b	63 c	64 d	65 e
//			66 f	67 g	68 h	69 i	6a j
//			6b k	6c l	6d m	6e n	6f o
//			70 p	71 q	72 r	73 s	74 t
//			75 u	76 v	77 w	78 x	79 y
//			7a z
			
			//Control 
			//ControlUnit cv(Clk, Reset_h, keycode, direction, starting_pos, start_counter, get_word);

			
			
			
			/*Modules below for seconds counter on the hex*/
			
//			
//			//1's place counter
//			ValueToDisplayCount vd(Clk, counter_signal, output_value_vd);
//			
//			DisplayScanCounter dsc(Clk, counter_signal, dsc_output);
//			
//			mux16to4 	mx(output_value_vd, dsc_output, output_mux);
//				
//			HexToDecimal	htd(start_counter, output_mux, htd_output1, counter_signal);
//			
//			
//			
//			//10's Place Counter
//			ValueToDisplayCount #(1000000000) vd10(Clk, counter_signal1, output_value_vd1);
//			
//			DisplayScanCounter #(8000000) dsc10(Clk, counter_signal1, dsc_output1);
//			
//			mux16to4 	mx10(output_value_vd1, dsc_output1, output_mux1);
//			
//			HexToDecimal	htd10(start_counter, output_mux1, htd_output2, counter_signal1);
//			
//			
//			//100's Place Counter
//			ValueToDisplayCount #(100000000000) vd100(Clk, counter_signal100, output_value_vd100);
//			
//			DisplayScanCounter #(800000000) dsc100(Clk, counter_signal100, dsc_output100);
//			
//			mux16to4 	mx100(output_value_vd100, dsc_output100, output_mux100);
//			
//			HexToDecimal	htd100(start_counter, output_mux100, htd_output100, counter_signal100);
//
//
//			
//			
//			HexDriver hex_inst_4 (htd_output1, HEX4);	
//			HexDriver hex_inst_5 (htd_output2, HEX5);
//			HexDriver hex_inst_6 (htd_output100, HEX6);
//
//
//
//
//			HexDriver hex_inst_0 (direction[3:0], HEX0);
//			HexDriver hex_inst_1 (keycode, HEX1);
//			HexDriver hex_inst_2 (0, HEX2);
//			HexDriver hex_inst_3 (0, HEX3);

											
		endmodule