module ValueToDisplayCount(input clk,
									input reset,
									output logic [15:0] value);
	
	logic [50:0] clock_counter;
	logic [15:0] current_value;
		
	parameter MAX_VALUE = 100000000;
	assign value = current_value;
		
	always @( posedge clk)
	begin
	
		if (reset)
		begin
				current_value = 0;
				clock_counter = 0;
		end
	
		if (clock_counter >= MAX_VALUE)
		begin
			clock_counter = 0;
			current_value = current_value + 1;
		end
		else
		begin
			clock_counter = clock_counter + 1;
		end
	
  
		
	end
	
	

endmodule