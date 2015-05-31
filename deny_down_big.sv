module deny_down_big #(size_y = 20, size_x = 40) (
	input [9:0] bottom, left, right, top,
	input [0:size_x-1] down_constraint [size_y-1:0],
	output deny
	);
	
	logic [0:size_y*size_x-1] no_down;

	generate
		genvar y, x;
		
		for (y = 0; y < size_y; y++)
		begin: create_y
			for (x = 0; x < size_x; x++)
			begin: create_x
				deny_down #(.y(y), .x(x), .size_y(size_y), .size_x(size_x)) dd ( .deny(no_down[x+y*size_x]), .* );
			end
		end
	endgenerate
	
	assign deny = no_down > 0;
	
endmodule
