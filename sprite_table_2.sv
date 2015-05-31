module sprite_table_2 (input [2:0] sprite_index,
					output logic [15:0][2:0] sprite  [15:0]);
							
			
	logic [15:0][2:0] local_sprite[15:0];
		
	always_comb
	begin
		
		//general brick sprite
		unique case (sprite_index)
		
			2'b00:
			begin
				local_sprite[0] 	= '{7,7,7,7,7,3,3,3,3,3,3,7,7,7,7,7};
				local_sprite[1] 	= '{7,7,7,3,3,0,0,0,0,0,0,3,3,7,7,7};
				local_sprite[2] 	= '{7,7,3,1,0,0,0,0,0,0,0,0,1,3,7,7};
				local_sprite[3] 	= '{7,3,1,0,0,0,0,0,0,0,0,0,0,1,3,7};

				local_sprite[4] 	= '{7,3,0,0,2,3,0,0,0,0,2,3,0,0,3,7};
				local_sprite[5] 	= '{7,3,0,2,3,3,3,0,0,2,3,3,3,0,3,7};
				local_sprite[6] 	= '{7,3,0,1,3,3,2,0,0,1,3,3,2,0,3,7};
				local_sprite[7] 	= '{7,3,0,0,2,2,1,2,1,0,2,2,1,0,3,7};

				local_sprite[8] 	= '{7,3,0,0,0,0,0,2,2,1,0,0,0,0,3,7};
				local_sprite[9] 	= '{7,3,2,2,0,0,0,0,0,0,0,0,1,2,3,7};
				local_sprite[10]	= '{7,3,0,3,1,3,2,3,2,3,2,3,2,0,3,7};
				local_sprite[11]	= '{7,7,3,0,2,1,0,1,0,1,0,1,0,3,7,7};

				local_sprite[12]	= '{7,7,3,1,2,3,2,3,2,3,2,3,1,3,7,7};
				local_sprite[13]	= '{7,7,7,3,0,1,0,1,0,1,0,1,3,7,7,7};
				local_sprite[14] 	= '{7,7,7,7,2,3,3,3,3,3,3,2,7,7,7,7};
				local_sprite[15] 	= '{7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7};
			end
			
			default: begin
				local_sprite[0] = 0;
				local_sprite[1] = 0;
				local_sprite[2] = 0;
				local_sprite[3] = 0;
				local_sprite[4] = 0;
				local_sprite[5] = 0;
				local_sprite[6] = 0;
				local_sprite[7] = 0;
				local_sprite[8] = 0;
				local_sprite[9] = 0;
				local_sprite[10] = 0;
				local_sprite[11] = 0;
				local_sprite[12] = 0;
				local_sprite[13] = 0;
				local_sprite[14] = 0;
				local_sprite[15] = 0;
			end
		endcase
		
		sprite = local_sprite; 
	end
		
		
endmodule
