module sprite_table (input [4:0] sprite_index,
							output logic [15:0] sprite  [15:0]);
							
			
	logic  [15:0] local_sprite[15:0];
		
		
	always_comb
	begin
		
		//general brick sprite
		unique case (sprite_index)
		
			4'b0000:
			begin
				local_sprite[0] = 16'b1111111111111111;
				local_sprite[1] =16'b1001001001001001;
				local_sprite[2] =16'b1010010010010011;
				local_sprite[3] =16'b1100100100100101;
				local_sprite[4] =16'b1001001001001001;
				local_sprite[5] =16'b1010010010010011;
				local_sprite[6] =16'b1100100100100101;
				local_sprite[7] =16'b1001001001001001;
				local_sprite[8] =16'b1010010010010011;
				local_sprite[9] =16'b1100100100100101;
				local_sprite[10] =16'b1001001001001001;
				local_sprite[11] =16'b1010010010010011;
				local_sprite[12] =16'b1100100100100101;
				local_sprite[13] =16'b1001001001001001;
				local_sprite[14] =16'b1010010010010011;
				local_sprite[15] =16'b1111111111111111;
			end
			
			4'b0001:
			begin
				local_sprite[0] 	=16'b0000000110000000;
				local_sprite[1] 	=16'b0000111111110000;
				local_sprite[2] 	=16'b0011111111111100;
				local_sprite[3] 	=16'b0111111111111110;
				local_sprite[4] 	=16'b0111111111111110;
				local_sprite[5] 	=16'b1111111111111111;
				local_sprite[6] 	=16'b1111111111111111;
				local_sprite[7] 	=16'b1110000111000011;
				local_sprite[8] 	=16'b1110000111000011;
				local_sprite[9] 	=16'b1111111111111111;
				local_sprite[10] 	=16'b1111111111111111;
				local_sprite[11] 	=16'b0111111111111110;
				local_sprite[12] 	=16'b0111111111111110;
				local_sprite[13] 	=16'b0011111111111100;
				local_sprite[14] 	=16'b0000111111110000;
				local_sprite[15] 	=16'b0000000110000000;
			end
			
			4'b0010:
			begin
				local_sprite[0] =	16'b0000000110000000;
				local_sprite[1] =	16'b0000001111000000;
				local_sprite[2] =	16'b0111111111111110;
				local_sprite[3] =	16'b1111111111111111;
				local_sprite[4] =	16'b1111111111111111;
				local_sprite[5] =	16'b0111111111111110;
				local_sprite[6] =	16'b0000001111000000;
				local_sprite[7] =	16'b0000001111000000;
				local_sprite[8] =	16'b0000001111000000;
				local_sprite[9] =	16'b0000001111000000;
				local_sprite[10] =16'b0000001111000000;
				local_sprite[11] =16'b0000001111000000;
				local_sprite[12] =16'b0000001111000000;
				local_sprite[13] =16'b0000001111000000;
				local_sprite[14] =16'b0000001111000000;
				local_sprite[15] =16'b0000000110000000;
			end
			
			4'b0011:
			begin
				local_sprite[0] =	16'b0000000000000000;
				local_sprite[1] =	16'b0000000000000000;
				local_sprite[2] =	16'b0011111111111110;
				local_sprite[3] =	16'b0111111111111111;
				local_sprite[4] =	16'b0111111111111111;
				local_sprite[5] =	16'b0011111111111110;
				local_sprite[6] =	16'b0000000000000000;
				local_sprite[7] =	16'b0000000000000000;
				local_sprite[8] =	16'b0000000000000000;
				local_sprite[9] =	16'b0000000000000000;
				local_sprite[10] =16'b0000000000000000;
				local_sprite[11] =16'b0000000000000000;
				local_sprite[12] =16'b0000000000000000;
				local_sprite[13] =16'b0000000000000000;
				local_sprite[14] =16'b0000000000000000;
				local_sprite[15] =16'b0000000000000000;
			end
			
			4'b0100:
			begin
				local_sprite[0] =	16'b0000000000000000;
				local_sprite[1] =	16'b0000000000001100;
				local_sprite[2] =	16'b0000000000011110;
				local_sprite[3] =	16'b0000000000111110;
				local_sprite[4] =	16'b0000000001111100;
				local_sprite[5] =	16'b0000000011111000;
				local_sprite[6] =	16'b0000000111110000;
				local_sprite[7] =	16'b0000001111100000;
				local_sprite[8] =	16'b0000011111000000;
				local_sprite[9] =	16'b0000111110000000;
				local_sprite[10] =16'b0001111100000000;
				local_sprite[11] =16'b0011111000000000;
				local_sprite[12] =16'b0111110000000000;
				local_sprite[13] =16'b1111100000000000;
				local_sprite[14] =16'b1111000000000000;
				local_sprite[15] =16'b0110000000000000;
			end
			
			4'b0101:
			begin
				local_sprite[0] =	16'b0000000000000000;
				local_sprite[1] =	16'b0011000000000000;
				local_sprite[2] =	16'b0111100000000000;
				local_sprite[3] = 16'b0111110000000000;
				local_sprite[4] =	16'b0011111000000000;
				local_sprite[5] =	16'b0001111100000000;
				local_sprite[6] =	16'b0000111110000000;
				local_sprite[7] =	16'b0000011111000000;
				local_sprite[8] =	16'b0000001111100000;
				local_sprite[9] =	16'b0000000111110000;
				local_sprite[10] =16'b0000000011111000;
				local_sprite[11] =16'b0000000001111100;
				local_sprite[12] =16'b0000000000111110;
				local_sprite[13] =16'b0000000000011111;
				local_sprite[14] =16'b0000000000001111;
				local_sprite[15] =16'b0000000000000110;
			end
			
			default: begin
				local_sprite[0] = 16'b0;
				local_sprite[1] = 16'b0;
				local_sprite[2] = 16'b0;
				local_sprite[3] = 16'b0;
				local_sprite[4] = 16'b0;
				local_sprite[5] = 16'b0;
				local_sprite[6] = 16'b0;
				local_sprite[7] = 16'b0;
				local_sprite[8] = 16'b0;
				local_sprite[9] = 16'b0;
				local_sprite[10] = 16'b0;
				local_sprite[11] = 16'b0;
				local_sprite[12] = 16'b0;
				local_sprite[13] = 16'b0;
				local_sprite[14] = 16'b0;
				local_sprite[15] = 16'b0;
			end
		endcase
		
		sprite = local_sprite; 
	end
		
		
endmodule		
									
								
	
	   
    





































