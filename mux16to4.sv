module mux16to4 (input [15:0] In,
					  input [1:0] S,
					  output logic [3:0] Out);
	
	
	
	always_comb
begin
	
	case (S)
		2'b00 : 	Out = In[3:0];
		2'b01 : 	Out = In[7:4];
		2'b10 : 	Out = In[11:8];
		2'b11 : 	Out = In[15:12];
		default: Out = 'bX;
	endcase
end

endmodule