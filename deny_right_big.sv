module deny_right_big #(size_y = 20, size_x = 40) (
	input [9:0] bottom, left, right, top,
	input [0:size_x-1] right_constraint [size_y-1:0],
	output deny
	);
	
	logic [0:size_x*size_y-1] no_right;

	generate
		genvar y, x;
		
		for (y = 0; y < size_y; y++)
		begin: create_y
			for (x = 0; x < size_x; x++)
			begin: create_x
				deny_right #(.y(y), .x(x), .size_y(size_y), .size_x(size_x)) dr ( .deny(no_right[x+y*size_x]), .* );
			end
		end
	endgenerate
	
	assign deny = no_right > 0;
			
endmodule
