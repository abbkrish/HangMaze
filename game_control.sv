module game_control #(size_y = 20, size_x = 40) (
	input Clk, Start, Reset, win, lose,
	output logic init, ready, start,
	output logic [0:size_x-1] init_maze_letters [size_y-1:0],
	output logic [7:0] ilc
);

	enum logic [2:0] {START_SCREEN, START_SCREEN_HOLD, INIT1, INIT2, GAME_READY, WIN, LOSE} state, next_state;
	
	always_ff @ (posedge Clk or negedge Reset)
	begin: on_clock
		if (~Reset)
			state <= START_SCREEN;
		else
			state <= next_state;
	end

	always_comb
	begin: next_state_logic
		
		next_state = state;
		
		unique case (state)
			START_SCREEN: begin
				if (~Start) // active low
					next_state = START_SCREEN_HOLD;
			end
			
			START_SCREEN_HOLD: begin
				if (Start) //active low
					next_state = INIT1;
			end
			
			INIT1: begin
				next_state = INIT2;
			end
			
			INIT2: begin
				next_state = GAME_READY;
			end
			
			GAME_READY: begin	// the game is ready to play
				if (win)
					next_state = WIN;
				else if (lose)
					next_state = LOSE;
			end
			
			WIN: begin
				
			end
			
			LOSE: begin
			
			end
			
			default: begin
				
			end
		endcase
	end
	
	always_comb
	begin: signal_output
		
		init = 1'b0;
		ready = 1'b0;
		ilc = 8'h00;
		start = 1'b0;
			
		unique case (state)
			START_SCREEN: begin
				
			end
			
			START_SCREEN_HOLD: begin
				start = 1'b1;
			end
			
			INIT1: begin
				init = 1'b1;
				
				ilc = 8'h63;
			end
			
			INIT2: begin
				ilc = 8'h63;
			end
			
			GAME_READY: begin
				ready = 1'b1;
			end
			
			WIN: begin
				
			end
			
			LOSE: begin
			
			end
			
			default: begin
			
			end
		endcase
	end
	
	generate
		genvar y, x;
		for ( y = 0; y < size_y; y++ )
		begin: create_y
			for ( x = 0; x < size_x; x++ )
			begin: create_x
				always_comb
				begin: init_maze
					
					init_maze_letters[y][x]	= 0;
				
					unique case (state)
						START_SCREEN: begin
							
						end
							
						START_SCREEN_HOLD: begin
						
						end
						
						INIT1: begin
							if ( y == 2 && x == 7 ) // a
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 7 && x == 1 ) // b
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 3 && x == 22) // c
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 5 && x == 13) // d
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 4 && x == 9 ) // e
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 3 && x == 16) // f
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 7 && x == 20) // g
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 1 && x == 12)// h
								init_maze_letters[y][x] 	= 1'b1; 
							else if ( y == 6 && x == 5) // i
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 1 && x == 15) // j
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 2 && x == 17) // k
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 13 && x == 9) // l
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 5 && x == 1) // m
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 3 && x == 19) // n
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 10 && x == 25) // o
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 2 && x == 23) // p
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 13 && x == 2) // q
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 1 && x == 20) // r
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 11 && x == 10) // s
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 7 && x == 9) // t
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 4 && x == 4) // u
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 12 && x == 19) // v
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 6 && x == 11) // w
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 1 && x == 16) // x
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 10 && x == 10) // y
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 16 && x == 15) // z
								init_maze_letters[y][x] 	= 1'b1;
							else
								init_maze_letters[y][x]		= 1'b0;
						end
						
						INIT2: begin
							if ( y == 2 && x == 7 ) // a
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 7 && x == 1 ) // b
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 3 && x == 22) // c
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 5 && x == 13) // d
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 4 && x == 9 ) // e
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 3 && x == 16) // f
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 7 && x == 20) // g
								init_maze_letters[y][x]		= 1'b1;
							else if ( y == 1 && x == 12)// h
								init_maze_letters[y][x] 	= 1'b1; 
							else if ( y == 6 && x == 5) // i
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 1 && x == 15) // j
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 2 && x == 17) // k
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 13 && x == 9) // l
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 5 && x == 1) // m
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 3 && x == 19) // n
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 10 && x == 25) // o
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 2 && x == 23) // p
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 13 && x == 2) // q
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 1 && x == 20) // r
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 11 && x == 10) // s
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 7 && x == 9) // t
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 4 && x == 4) // u
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 12 && x == 19) // v
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 6 && x == 11) // w
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 1 && x == 16) // x
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 10 && x == 10) // y
								init_maze_letters[y][x] 	= 1'b1;
							else if ( y == 16 && x == 15) // z
								init_maze_letters[y][x] 	= 1'b1;
							else
								init_maze_letters[y][x]		= 1'b0;
						end
						
						GAME_READY: begin
						
						end
						
						WIN: begin
						
						end
						
						LOSE: begin
						
						end
						
						default: begin
							
						end
					endcase
				end
			end
		end
	endgenerate

	
endmodule
