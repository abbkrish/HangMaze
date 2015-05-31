module game_entity (input sprite_index,
						  output logic [1:0] location);
		
		always_comb
		begin
		location = 2'b0;
			if (sprite_index == 0)
			begin
				location[0] = 0;
				location[1] = 0;
			end
		end
		
endmodule