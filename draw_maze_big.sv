module draw_maze_big #(size_y = 20, size_x = 40)(
	input [9:0] DrawX, DrawY,
	input [0:size_x-1] maze[size_y-1:0],
	output draw
	);

	logic [0:size_x*size_y-1] Drew; // Drew is helping us draw.
	
	generate
		genvar y, x;
		
		for (y = 0; y < size_y; y++)
		begin: create_y
			for (x = 0; x < size_x; x++)
			begin: create_x
				draw_maze #(.y(y), .x(x), .size_y(size_y), .size_x(size_x)) dm ( 
					.DrawX(DrawX),
					.DrawY(DrawY),
					.maze(maze),
					.draw(Drew[x+y*size_x])
				);
			end
		end
	endgenerate

	assign draw = Drew > 0; 
	
endmodule
