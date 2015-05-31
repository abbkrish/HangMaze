module d_flip_flop (
					input Clk, D, En, Reset,  // Reset is ACTIVE LOW
					output logic Q
				);
	
	always_ff @ (posedge Clk, negedge Reset)
	begin
		if (Reset == 1'b0) //ACTIVE LOW
			Q <= 0;
		else if (En == 1'b1)
			Q <= D;
		else
			Q <= Q;
	end
	
endmodule				
