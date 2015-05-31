module right_checker_big #(size_y = 20, size_x = 40) (
					input [0:size_x - 1] maze [size_y - 1:0],
					output [0:size_x - 1] right_constraint [size_y - 1:0]
);

//	assign right_constraint[0][0] = 0;
//	assign right_constraint[1][0] = 0;
//	assign right_constraint[2][0] = 0;
//	assign right_constraint[3][0] = 0;
//	assign right_constraint[4][0] = 0;
//	assign right_constraint[5][0] = 0;
//	assign right_constraint[6][0] = 0;
//	assign right_constraint[7][0] = 0;
//	assign right_constraint[8][0] = 0;
//	assign right_constraint[9][0] = 0;
//	assign right_constraint[10][0] = 0;
//	assign right_constraint[11][0] = 0;
//	assign right_constraint[12][0] = 0;
//	assign right_constraint[13][0] = 0;
//	assign right_constraint[14][0] = 0;
//	assign right_constraint[15][0] = 0;
//	assign right_constraint[16][0] = 0;
//	assign right_constraint[17][0] = 0;
//	assign right_constraint[18][0] = 0;
//	assign right_constraint[19][0] = 0;

	generate
		genvar y, x;
		
		for (y = 0; y < size_y; y++)
		begin: create_y
			for (x = 1; x < size_x; x++)
			begin: create_x
				assign right_constraint[y][0] = 0;
				right_checker dc ( .current_block(maze[y][x]), .left_block(maze[y][x-1]), .constrain(right_constraint[y][x]) );
			end
		end
	endgenerate

endmodule
