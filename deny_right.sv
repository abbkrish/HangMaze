module deny_right #(y=0, x=0, size_y = 20, size_x = 40) (
	input [9:0] bottom, left, right, top,
	input [0:size_x-1] right_constraint [size_y-1:0],
	output deny
	);
	
	assign deny = ( right_constraint[y][x] && right >= 16*x && right < 16*(x+1) && top < 16*(y+1) && bottom > 16*(y) ) ? 1'b1 : 1'b0;
	
endmodule
