module draw_maze #(y=0, x=0, size_y = 20, size_x = 40) (
	input [9:0] DrawX, DrawY,
	input [0:size_x-1] maze [size_y-1:0],
	output draw
	);

	assign draw = ( maze[y][x] && DrawX >= 16*x && (DrawX) < 16*(x+1) && DrawY >= 16*y && DrawY < 16*(y+1) ) ? 1'b1 : 1'b0;
	
endmodule
