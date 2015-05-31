module DisplayScanCounter(input clk,
								  input reset,
								  output logic [1:0] hexOutput);
								  
	logic [1:0] current_value = 0;
	logic [18:0] clock_counter;
	
	assign hexOutput = current_value;
	parameter MAX_VALUE = 800000;
	always @(clk)
	begin
		
		if (reset)
		begin
			current_value = 0;
			clock_counter = 0;
		end
		
		if (clock_counter == MAX_VALUE )
		begin
			clock_counter = 0;
			current_value = current_value + 1;
		end
		else
			clock_counter = clock_counter + 1;
			
	end

endmodule

