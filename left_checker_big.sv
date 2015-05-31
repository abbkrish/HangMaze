module left_checker_big #(size_y = 20, size_x = 40) (
					input [0:size_x - 1] maze [size_y - 1:0],
					output [0:size_x - 1] left_constraint [size_y - 1:0]
);

//	assign left_constraint[0][39] = 40'b0;
//	assign left_constraint[1][39] = 40'b0;
//	assign left_constraint[2][39] = 40'b0;
//	assign left_constraint[3][39] = 40'b0;
//	assign left_constraint[4][39] = 40'b0;
//	assign left_constraint[5][39] = 40'b0;
//	assign left_constraint[6][39] = 40'b0;
//	assign left_constraint[7][39] = 40'b0;
//	assign left_constraint[8][39] = 40'b0;
//	assign left_constraint[9][39] = 40'b0;
//	assign left_constraint[10][39] = 40'b0;
//	assign left_constraint[11][39] = 40'b0;
//	assign left_constraint[12][39] = 40'b0;
//	assign left_constraint[13][39] = 40'b0;
//	assign left_constraint[14][39] = 40'b0;
//	assign left_constraint[15][39] = 40'b0;
//	assign left_constraint[16][39] = 40'b0;
//	assign left_constraint[17][39] = 40'b0;
//	assign left_constraint[18][39] = 40'b0;
//	assign left_constraint[19][39] = 40'b0;

	generate
		genvar y, x;
		
		for (y = 0; y < size_y; y++)
		begin: create_y
			for (x = 0; x < size_x-1; x++)
			begin: create_x
				assign left_constraint[y][size_x-1] = 0;
				left_checker dc ( .current_block(maze[y][x]), .right_block(maze[y][x+1]), .constrain(left_constraint[y][x]) );
			end
		end
	endgenerate

endmodule
