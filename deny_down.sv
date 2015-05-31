module deny_down #(y=0, x=0, size_y = 20, size_x = 40) (
	input [9:0] bottom, left, right, top,
	input [0:size_x-1] down_constraint [size_y-1:0],
	output deny
	);
	
	assign deny = ( down_constraint[y][x] && bottom >= 16*(y) && bottom < 16*(y+1) && left < 16*(x+1) && right > 16*(x) ) ? 1'b1 : 1'b0;
	
endmodule
