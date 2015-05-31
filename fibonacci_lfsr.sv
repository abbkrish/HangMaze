module LFSR (input clock,     
				 input reset,     
				 output logic[12:0] rnd);   

				 
logic feedback_lf;
   

logic [12:0] random, random_next, random_done; 

logic [3:0] count, count_next; //to keep track of the shifts   

assign feedback_lf = random[12] ^ random[3] ^ random[2] ^ random[0]; 

always @ (posedge clock) 
	begin
	 random_next = random; //default state stays the same  
	 count_next = count;       
	 random_next = {random[11:0],feedback_lf}; //shift left the xor'd every posedge clock   
	 count_next = count + 1;   

		if (reset)  
		begin  
			random = 13'hF; //An LFSR cannot have an all 0 state, thus reset to FF  
			count = 0;  
		end 

		if (count == 13)  
		begin  
			count = 0;  
		 	random_done = random; //assign the random number to output after 13 shifts  
		end     


	   else 
		begin  
			random = random_next;   
			count = count_next; 
		 end
	end  


//	begin 
//		random_next = random; //default state stays the same  
//		count_next = count;       
//
//		random_next = {random[11:0], feedback}; //shift left the xor'd every posedge clock   
//		count_next = count + 1;    
//	
	
	 assign rnd = random_done; 
	 
endmodule