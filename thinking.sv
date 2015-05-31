module maze_world #(size_y = 20, size_x = 40)(
							input [0:size_x-1] desired_maze [size_y-1:0],
							output [0:size_x - 1] maze [size_y - 1:0], down_constraint [size_y - 1:0], up_constraint [size_y - 1:0], left_constraint [size_y - 1:0], right_constraint [size_y - 1:0]
						);

	assign maze = desired_maze;
						
	down_checker_big #(.size_y(size_y), .size_x(size_x)) dcb (
		.maze(desired_maze),
		.down_constraint(down_constraint)
	);

	up_checker_big #(.size_y(size_y), .size_x(size_x)) ucb (
		.maze(desired_maze),
		.up_constraint(up_constraint)
	);
	
	left_checker_big #(.size_y(size_y), .size_x(size_x)) lcb (
		.maze(desired_maze),
		.left_constraint(left_constraint)
	);
	
	right_checker_big #(.size_y(size_y), .size_x(size_x)) rcb (
		.maze(desired_maze),
		.right_constraint(right_constraint)
	);

endmodule
