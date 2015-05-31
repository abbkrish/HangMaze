module random_no (
					input						clk,
					input						reset,
												clk_en,
												load,		
					input [31:0]				seed,	
					output logic [31:0]			out,
					output logic [31:0] 		random_range100

				);

	logic linear_feedback;
	
	assign linear_feedback = !(out[31] ^ out[21] ^ out[1] ^ out[0]);
	
	always_ff @ ( posedge clk )//or posedge reset or posedge load )
	begin
		if (reset) 
		// active high reset
			out <= 32'b0;
		else if ( clk_en == 1'b1 )
		begin
			out <= {out[30:0], linear_feedback};
			random_range100 <= out % 100;
		end
		else if ( load == 1'b1 )
			out <= seed;
		else
			out <= out;
	end
	
	
endmodule
