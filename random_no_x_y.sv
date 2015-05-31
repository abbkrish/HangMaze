module random_no_x_y #(size_y = 20, size_x = 40) (
					input						clk,
					input						reset,
												clk_en,
												load,		
					input [31:0]				seed,	
					output logic [5:0] random_x, random_y
				);

	logic linear_feedback;
	logic [31:0] out, random_x_temp, random_y_temp;
	
	assign random_x = random_x_temp[5:0];
	assign random_y = random_y_temp[5:0];
	
	assign linear_feedback = !(out[31] ^ out[21] ^ out[1] ^ out[0]);
	
	always_ff @ ( posedge clk )
	begin
		if (reset) 
		// active high reset
			out <= 32'b0 ;
		else if ( clk_en == 1'b0 )
			out <= out;
		else if ( load == 1'b1 )
			out <= seed;
		else
		begin
			out <= {out[30:0], linear_feedback};
			random_x_temp <= out % size_x;
			random_y_temp <= out % size_y;
		end
	end
	
	
endmodule
