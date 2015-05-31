module maze_letter #(size_y = 20, size_x = 40) (
	// NOTE: ball_x is reversed on purpose
	input Clk, Reset,
	input init,
	input [7:0] ilc, // initial collected letter (substitute for no character collected)
	input [0:size_x-1] init_maze_letters [size_y-1:0],
	input [0:5] ball_x,
	input [5:0] ball_y,
	output [0:size_x-1] maze_letters [size_y-1:0],
	output [7:0] collected_letter,
	output check_guess,			// guess is instantaneous
	output collected_next_round //slowing "checking for pickup" clock
);

	logic [0:size_x-1] D [size_y-1:0];
	logic [7:0] letters[size_y-1:0][0:size_x-1], collected;
	logic [5:0] index_x, index_y;
	
	letter_lookup #(.size_y(size_y), .size_x(size_x)) ll (.letters(letters));
	
	check_collected_counter ccc( 
		.Clk(Clk),
		.Reset(Reset),
		.index_x(index_x),
		.index_y(index_y),
		.next_round(collected_next_round)
	);
	
	generate		// I fuckin' love generate <3
		genvar y, x;
		
		for (y = 0; y < size_y; y++)
		begin: create_y
			for (x = 0; x < size_x; x++)
			begin: create_x
				
				always_ff @ (posedge collected_next_round or posedge init)
				begin			
					if ( init )
					begin
						D[y][x] <= init_maze_letters[y][x];
					end
					else if ( ball_x == x && ball_y == y )
					begin
						// right when a letter is picked up, the next state of the register is 0, but its current output should still be 1
						D[y][x] <= 1'b0;
					end
					else
					begin
						D[y][x] <= maze_letters[y][x]; // keep original value
					end
				end

				d_flip_flop d (
					.Clk(Clk),
					.D(D[y][x]),
					.En(1'b1),
					.Reset(Reset), //active low
					.Q(maze_letters[y][x])
				);
			end
		end
	endgenerate
	
	// this will activate when a letter is collected
	assign collected = letters[ball_y][ball_x];

	logic rlc_en;
	logic [7:0] rlc_in;
	
	always_ff @ (posedge Clk or posedge init)
	begin
		if (init)
		begin
			rlc_en <= 1'b1;
			rlc_in <= ilc;
		end
		else if (collected > 1 && maze_letters[ball_y][ball_x]) // I don't know why exactly this works, but it does, so shut your damn mouth. This took me hours to debug and you never seem to appreciate the effort I put in! (runs away crying)
		begin
			rlc_en <= 1'b1;
			rlc_in <= collected;
		end
		else
		begin
			rlc_en <= 1'b0;
			rlc_in <= 8'h00;
		end
	end
	
	always_ff @ (posedge collected_next_round or posedge init)
	begin
		if (init)
			check_guess <= 1'b0;
		else if (collected > 1 && maze_letters[ball_y][ball_x])
			check_guess <= 1'b1;
		else
			check_guess <= 1'b0;
	end
	
	reg_8 rlc (
		.En(rlc_en),
		.Clk(Clk),
		.Reset(Reset),
		.In(rlc_in),
		.Out(collected_letter)
	);
	
endmodule
