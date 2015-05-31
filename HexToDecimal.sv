module HexToDecimal (input reset,
							input [3:0] hexVal,
							output logic [3:0] output_hex1,
							output logic counter_signal);
							
	
assign output_hex1 = hex11;

logic [3:0] hex11;

//hex2;
//logic tens_place;
logic [3:0] temp;


always@(*)
begin
	if (reset)
		begin
				hex11 <= 0;
				counter_signal <= 1;
		end
	else
		begin
			if (hexVal == 10)
				begin
					counter_signal <= 1;
					hex11 <= hexVal - 10;
				end		 
			else
				begin
					hex11 <= hexVal;
					counter_signal <= 0;
				end
			
			end
			
end
	
	
	


	endmodule
	
				