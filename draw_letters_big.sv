module draw_letters_big #(size_y = 20, size_x = 40)(
	input [9:0] DrawX, DrawY,
	input [0:size_x-1] maze_letters [size_y-1:0],
	output draw,
	output [0:15] sprite [15:0]
);
	
	logic [0:size_x*size_y-1] Drew; // Drew is helping us draw.
	logic [7:0] letters[size_y-1:0][0:size_x-1];
	
	generate
		genvar y, x;
		
		for (y = 0; y < size_y; y++)
		begin: create_y
			for (x = 0; x < size_x; x++)
			begin: create_x
				draw_letter #(.y(y), .x(x), .size_y(size_y), .size_x(size_x)) dl ( 
					.DrawX(DrawX),
					.DrawY(DrawY),
					.maze_letters(maze_letters),
					.draw(Drew[x+y*size_x])
				);
			end
		end
	endgenerate
	
	letter_lookup #(.size_y(size_y), .size_x(size_x)) ll (.letters(letters));
	
	sprite_alphabet sa (.sprite_index(letters[DrawY/16][DrawX/16]), .sprite(sprite));
	
	assign draw = Drew > 0;
		
endmodule
