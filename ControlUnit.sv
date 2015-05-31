module ControlUnit (input Clk, 
						  input Reset,
						  input [7:0] keycode,
						  output logic[3:0] direction,
						  output logic starting_pos,
						  output logic start_counter,
						  output logic get_word,
						  output logic lfsr_enable
						  );

			enum logic [6:0]  {RESET, WAIT, MOVE_UP, MOVE_DOWN, MOVE_LEFT, MOVE_RIGHT} state, next_state;
			
			//COmmnent out this next line
			//logic lfsr_enable;
			always @ (posedge Clk or posedge Reset)
			begin
				if (Reset)
				begin
					state <= RESET;
					direction = 10;
					starting_pos = 0;
					start_counter = 0;
				end
				else
				begin
					state <= next_state;
					unique case(state)
						WAIT:	begin
							direction <= 0;
							start_counter <= 1;
							get_word <= 1;
							lfsr_enable <= 1;
						end
						MOVE_UP: begin
							direction <= 1;
							start_counter <= 1;
							get_word <= 0;
							lfsr_enable <= 0;
						end
						MOVE_DOWN: begin
							direction <= 2;
							start_counter <= 1;
							get_word <= 0;
							lfsr_enable <= 0;

						end
						MOVE_LEFT:	begin
							direction <= 4;
							start_counter <= 1;
							get_word <= 0;
							lfsr_enable <= 0;
						end
						MOVE_RIGHT: begin
							direction <= 8;
							start_counter <= 1;
							get_word <= 0;
							lfsr_enable <= 0;
						end
					endcase
				end
			end
						
							
			//next_state logic
			always_comb
			begin
				next_state = state;
				unique case(state)
					RESET: begin
						next_state = WAIT;
					end
					WAIT:	begin
					if (keycode == 82) 	//TODO
						next_state = MOVE_UP;
					if (keycode == 81)	//TODO
						next_state = MOVE_DOWN;
					if (keycode == 80)	//TODO
						next_state = MOVE_LEFT;
					if (keycode == 79)	//TODO
						next_state = MOVE_RIGHT;
					end
					MOVE_UP: begin
						next_state = WAIT;
					end
					MOVE_DOWN: begin
						next_state = WAIT;
					end
					MOVE_LEFT: begin
						next_state = WAIT;
					end
					MOVE_RIGHT: begin
						next_state = WAIT;
					end
				endcase
			end
			
			//signals ? 
			always_comb
				begin
				
				end
				
					
			endmodule
						  