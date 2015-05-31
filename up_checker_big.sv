module up_checker_big #(size_y = 20, size_x = 40) (
					input [0:size_x - 1] maze [size_y - 1:0],
					output [0:size_x - 1] up_constraint [size_y - 1:0]
);

	assign up_constraint[size_y - 1] = 0;

	generate
		genvar y, x;
		
		for (y = 0; y < size_y - 1; y++)
		begin: create_y
			for (x = 0; x < size_x; x++)
			begin: create_x
				up_checker dc ( .current_block(maze[y][x]), .below_block(maze[y+1][x]), .constrain(up_constraint[y][x]) );
			end
		end
	endgenerate

endmodule
