module check_collected_counter #(size_y = 20, size_x = 40) (
						input Clk, Reset,
						output logic [5:0] index_x, index_y,
						output logic next_round
					);

	enum logic [1:0] {RESET, INC_X, INC_Y, NEXT_ROUND} state, next_state;
	
	logic [5:0] new_x, new_y;
	logic reset_x, reset_y;
	
	values vx (.old_value(index_x), .new_value(new_x));
	values vy (.old_value(index_y), .new_value(new_y));
	
	assign reset_x = (index_x == size_x - 1 ? 1'b1 : 0);
	assign reset_y = (index_y == size_y - 1 ? 1'b1 : 0);
	
	always_ff @ (posedge Clk or negedge Reset)
	begin
		if (~Reset) // active low
		begin
			state <= RESET;
			index_x <= 0;
			index_y <= 0;
		end
		else
		begin
			state <= next_state;
			case (state)
				INC_X: begin
					if (~reset_x)
						index_x <= new_x;
					else
						index_x <= 0;
				end
				INC_Y: begin
					if (~reset_y)
						index_y <= new_y;
					else
						index_y <= 0;
				end
				default: begin
					index_x <= 0;
					index_y <= 0;
				end
			endcase
		end
	end

	always_comb
	begin
		next_state = state;
		
		unique case (state)
			RESET: begin
				next_state = INC_X;
			end
			
			INC_X: begin
				if (~reset_x)
					next_state = INC_X;
				else
					next_state = INC_Y;
			end
			
			INC_Y: begin
				if (~reset_y)
					next_state = INC_X;
				else
					next_state = NEXT_ROUND;
			end
			
			default: begin
				next_state = RESET;
			end
		endcase
	end
	
	always_comb
	begin: signal_output
		
		next_round = 1'b0;
		
		unique case (state)
			RESET: begin

			end
			
			INC_X: begin
				
			end
			
			INC_Y: begin
				
			end
			
			NEXT_ROUND: begin
				next_round = 1'b1;
			end
			
			default: begin
			
			end
		endcase
	end
	
endmodule

module values( 
	input [5:0] old_value,
	output logic [5:0] new_value
);

	always_comb
	begin
		unique case (old_value)
			0:	new_value = 1;
			1:	new_value = 2;
			2:	new_value = 3;
			3:	new_value = 4;
			4:	new_value = 5;
			5:	new_value = 6;
			6:	new_value = 7;
			7:	new_value = 8;
			8:	new_value = 9;
			9:	new_value = 10;
			10:	new_value = 11;
			11:	new_value = 12;
			12:	new_value = 13;
			13:	new_value = 14;
			14:	new_value = 15;
			15:	new_value = 16;
			16:	new_value = 17;
			17:	new_value = 18;
			18:	new_value = 19;
			19:	new_value = 20;
			20:	new_value = 21;
			21:	new_value = 22;
			22:	new_value = 23;
			23:	new_value = 24;
			24:	new_value = 25;
			25:	new_value = 26;
			26:	new_value = 27;
			27:	new_value = 28;
			28:	new_value = 29;
			29:	new_value = 30;
			30:	new_value = 31;
			31:	new_value = 32;
			32:	new_value = 33;
			33:	new_value = 34;
			34:	new_value = 35;
			35:	new_value = 36;
			36:	new_value = 37;
			37:	new_value = 38;
			38:	new_value = 39;
			39:	new_value = 40;
			40:	new_value = 41;
			41:	new_value = 42;
			42:	new_value = 43;
			43:	new_value = 44;
			44:	new_value = 45;
			45:	new_value = 46;
			46:	new_value = 47;
			47:	new_value = 48;
			48:	new_value = 49;
			49:	new_value = 50;
			50:	new_value = 51;
			51:	new_value = 52;
			52:	new_value = 53;
			53:	new_value = 54;
			54:	new_value = 55;
			55:	new_value = 56;
			56:	new_value = 57;
			57:	new_value = 58;
			58:	new_value = 59;
			59:	new_value = 60;
			60:	new_value = 61;
			61:	new_value = 62;
			62:	new_value = 63;
			63:	new_value = 0;
			default: new_value = 0;
		endcase
	end

endmodule
				