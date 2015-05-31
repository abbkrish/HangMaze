module down_checker_big #(size_y = 20, size_x = 40) (
					input [0:size_x - 1] maze [size_y - 1:0],
					output [0:size_x - 1] down_constraint [size_y - 1:0]
);

	assign down_constraint[0] = 0;

	generate
		genvar y, x;
		
		for (y = 1; y < size_y; y++)
		begin: create_y
			for (x = 0; x < size_x; x++)
			begin: create_x
				down_checker dc ( .current_block(maze[y][x]), .above_block(maze[y-1][x]), .constrain(down_constraint[y][x]) );
			end
		end
	endgenerate

endmodule
