module lfsr (
	output logic  	[31:0]	out,  		// Output of the counter
	output logic 	[31:0]	random_range100,
	input         			enable,  	// Enable  for counter
	input 			[31:0]	seed,
	input          			clk,  		// clock input
	input          			reset     	// reset input
);


logic       linear_feedback;
logic value;
assign linear_feedback = !(out[31] ^ out[21] ^ out[1] ^ out[0]);//this is the feedback bit http://en.wikipedia.org/wiki/Linear_feedback_shift_register



always_ff @(posedge clk)
	if (reset) 
		begin // active high reset
			out <= 32'b0 ;
		end 

	else if (enable)
		out <= seed;
	else 
	begin
		out <= {out[30:0], linear_feedback};
		value <= {out[30:0], linear_feedback};
		random_range100 = out % 100;
	end  

endmodule 