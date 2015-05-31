module sprite_alphabets (input [7:0] sprite_index,
								 output [7:0] sprite [15:0]);
								 
		
		
		logic  [0:7] alphabet [0:15];
		
		always @(sprite_index)
		if (sprite_index == 2'h61)
		begin
			alphabet[0] = 8'b00000000;
			alphabet[1] = 8'b00000000;
			alphabet[2] = 8'b00000000;
			alphabet[3] = 8'b00000000;
			alphabet[4] = 8'b01111000;
			alphabet[5] = 8'b00001100;
			alphabet[6] = 8'b01111100;
			alphabet[7] = 8'b11001100;
			alphabet[8] = 8'b11001100;
			alphabet[9] = 8'b11001100;
			alphabet[10] = 8'b01110110;
			alphabet[11] = 8'b00000000;
			alphabet[12] = 8'b00000000;
			alphabet[13] = 8'b00000000;
			alphabet[14] = 8'b00000000;
			alphabet[15] = 8'b00000000;	
		end
		assign sprite = alphabet;

		endmodule