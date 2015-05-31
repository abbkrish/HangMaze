module deny_left #(y=0, x=0, size_y = 20, size_x = 40) (
	input [9:0] bottom, left, right, top,
	input [0:size_x-1] left_constraint [size_y-1:0],
	output deny
	);
	
	assign deny = ( left_constraint[y][x] && left <= 16*(x+1) && left > 16*x && top < 16*(y+1) && bottom > 16*(y) ) ? 1'b1 : 1'b0;
	
endmodule
