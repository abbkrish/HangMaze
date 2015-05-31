module HexToDecimal_TensPlace (input [3:0] tensPlace,
										 output logic [3:0] output_t);
			
	

logic counter = 0;		
			
			always@(*)
			begin
			case(tensPlace)
			0: begin
				output_t[3:0] = 0;
				end
			1:begin
				output_t[3:0] =  tensPlace;
				end
			2:begin
				end
			endcase
			end
			
//			if (tensPlace == 0)
//			begin
//				output_mux = 14;
//			end
//			if (tensPlace == 1)
//			begin
//				output_mux = 4'b0011;
//				counter = output_mux;
//			end
//			if (tensPlace == 4)
//				output_mux = 12;
//			end
			
			
			endmodule