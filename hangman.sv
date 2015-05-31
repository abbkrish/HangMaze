module hangman	(
						input Clk, Reset, check_guess,
						input [95:0] word,
						input [3:0] length,
						input [7:0] guess,
						output logic [95:0] revealed,
						//output logic [95:0] word,
						output logic [47:0] missed,			// holds 6 letters, used to tell which letters were wrong
						//output logic [3:0] length,
						output logic [2:0] body,
						output logic win, lose, miss
					);
	
	enum logic [5:0] {			RESET, WAIT, 
								CHECK_POS0, CHECK_POS1, CHECK_POS2, CHECK_POS3, CHECK_POS4, CHECK_POS5,
								CHECK_POS6, CHECK_POS7, CHECK_POS8, CHECK_POS9,	CHECK_POS10, CHECK_POS11,
								REVEAL_POS0, REVEAL_POS1, REVEAL_POS2, REVEAL_POS3, REVEAL_POS4, REVEAL_POS5,
								REVEAL_POS6, REVEAL_POS7, REVEAL_POS8, REVEAL_POS9, REVEAL_POS10, REVEAL_POS11,
								CHECK_DONE, REPORT_MISS,
								LOSE
	} state, next_state;
	
	logic hit, clear_hit;
	
	logic pos0, pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, pos10, pos11;
	logic rev0, rev1, rev2, rev3, rev4, rev5, rev6, rev7, rev8, rev9, rev10, rev11;
	
//	assign word = _word;
//	assign length = _length;
	
	always_ff @ (posedge Clk or negedge Reset)
	begin: on_clock
		if (~Reset)
		begin
			state <= RESET;
		end
		else
		begin
			state <= next_state;
			
			revealed[7:0] = rev0 ? word[7:0] : 8'b00000000;
			revealed[15:8] = rev1 ? word[15:8] : 8'b00000000;
			revealed[23:16] = rev2 ? word[23:16] : 8'b00000000;
			revealed[31:24] = rev3 ? word[31:24] : 8'b00000000;
			revealed[39:32] = rev4 ? word[39:32] : 8'b00000000;
			revealed[47:40] = rev5 ? word[47:40] : 8'b00000000;
			revealed[55:48] = rev6 ? word[55:48] : 8'b00000000;
			revealed[63:56] = rev7 ? word[63:56] : 8'b00000000;
			revealed[71:64] = rev8 ? word[71:64] : 8'b00000000;
			revealed[79:72] = rev9 ? word[79:72] : 8'b00000000;
			revealed[87:80] = rev10 ? word[87:80] : 8'b00000000;
			revealed[95:88] = rev11 ? word[95:88] : 8'b00000000;
			
		end
	end
	
	always_comb
	begin: next_state_logic
		
		next_state = state;
	
		unique case (state)
			RESET: begin
				next_state = WAIT;
			end
			
			WAIT: begin
				if (lose)
					next_state = REVEAL_POS0;
				if (check_guess)
					next_state = CHECK_POS0;
			end
			
			CHECK_POS0: begin
				if (length <= 4'd0) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[7:0])
					next_state = REVEAL_POS0;
				else
					next_state = CHECK_POS1;
			end
			
			CHECK_POS1: begin
				if (length <= 4'd1) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[15:8])
					next_state = REVEAL_POS1;
				else
					next_state = CHECK_POS2;
			end
			
			CHECK_POS2: begin
				if (length <= 4'd2) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[23:16])
					next_state = REVEAL_POS2;
				else
					next_state = CHECK_POS3;
			end
			
			CHECK_POS3: begin
				if (length <= 4'd3) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[31:24])
					next_state = REVEAL_POS3;
				else
					next_state = CHECK_POS4;
			end
			
			CHECK_POS4: begin
				if (length <= 4'd4) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[39:32])
					next_state = REVEAL_POS4;
				else
					next_state = CHECK_POS5;
			end
			
			CHECK_POS5: begin
				if (length <= 4'd5) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[47:40])
					next_state = REVEAL_POS5;
				else
					next_state = CHECK_POS6;
			end
			
			CHECK_POS6: begin
				if (length <= 4'd6) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[55:48])
					next_state = REVEAL_POS6;
				else
					next_state = CHECK_POS7;
			end
			
			CHECK_POS7: begin
				if (length <= 4'd7) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[63:56])
					next_state = REVEAL_POS7;
				else
					next_state = CHECK_POS8;
			end
			
			CHECK_POS8: begin
				if (length <= 4'd8) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[71:64])
					next_state = REVEAL_POS8;
				else
					next_state = CHECK_POS9;
			end
			
			CHECK_POS9: begin
				if (length <= 4'd9) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[79:72])
					next_state = REVEAL_POS9;
				else
					next_state = CHECK_POS10;
			end
			
			CHECK_POS10: begin
				if (length <= 4'd10) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[87:80])
					next_state = REVEAL_POS10;
				else
					next_state = CHECK_POS11;
			end
			
			CHECK_POS11: begin
				if (length <= 4'd11) 			//if length exceeded
					next_state = CHECK_DONE;
				else if (guess == word[95:88])
					next_state = REVEAL_POS11;
				else
					next_state = CHECK_DONE;
			end
			
			REVEAL_POS0: begin
				if (lose)
					next_state = REVEAL_POS1;
				else
					next_state = CHECK_POS1;
			end
			
			REVEAL_POS1: begin
				if (lose)
					next_state = REVEAL_POS2;
				else
					next_state = CHECK_POS2;
			end
			
			REVEAL_POS2: begin
				if (lose)
					next_state = REVEAL_POS3;
				else
					next_state = CHECK_POS3;
			end
			
			REVEAL_POS3: begin
				if (lose)
					next_state = REVEAL_POS4;
				else
					next_state = CHECK_POS4;
			end
			
			REVEAL_POS4: begin
				if (lose)
					next_state = REVEAL_POS5;
				else
					next_state = CHECK_POS5;
			end
			
			REVEAL_POS5: begin
				if (lose)
					next_state = REVEAL_POS6;
				else
					next_state = CHECK_POS6;
			end
			
			REVEAL_POS6: begin
				if (lose)
					next_state = REVEAL_POS7;
				else
					next_state = CHECK_POS7;
			end
			
			REVEAL_POS7: begin
				if (lose)
					next_state = REVEAL_POS8;
				else
					next_state = CHECK_POS8;
			end
			
			REVEAL_POS8: begin
				if (lose)
					next_state = REVEAL_POS9;
				else
					next_state = CHECK_POS9;
			end
			
			REVEAL_POS9: begin
				if (lose)
					next_state = REVEAL_POS10;
				else
					next_state = CHECK_POS10;
			end
			
			REVEAL_POS10: begin
				if (lose)
					next_state = REVEAL_POS11;
				else
					next_state = CHECK_DONE;
			end
			
			REVEAL_POS11: begin
				if (lose)
					next_state = LOSE;
				else
					next_state = CHECK_DONE;
			end
			
			CHECK_DONE: begin
				if (~hit)
					next_state = REPORT_MISS;
				else
					next_state = WAIT;				/// TEMP
			end
			
			REPORT_MISS: begin
				next_state = WAIT;
			end
			
			LOSE: begin
				//don't do anything
			end
		endcase
	end
	
	always_comb
	begin: signal_output	
		pos0 = 1'b0;
		pos1 = 1'b0;
		pos2 = 1'b0;
		pos3 = 1'b0;
		pos4 = 1'b0;
		pos5 = 1'b0;
		pos6 = 1'b0;
		pos7 = 1'b0;
		pos8 = 1'b0;
		pos9 = 1'b0;
		pos10 = 1'b0;
		pos11 = 1'b0;
		
		miss = 1'b0;
		
		clear_hit = 1'b1; // ACTIVE LOW!
		unique case (state)
			RESET: begin

			end
			
			WAIT: begin
				clear_hit = 1'b0; // ACTIVE LOW!
			end
			
			CHECK_POS0: begin
				
			end
			
			CHECK_POS1: begin
				
			end
			
			CHECK_POS2: begin
				
			end
			
			CHECK_POS3: begin
				
			end
			
			CHECK_POS4: begin
				
			end
			
			CHECK_POS5: begin
				
			end
			
			CHECK_POS6: begin
				
			end
			
			CHECK_POS7: begin
				
			end
			
			CHECK_POS8: begin
				
			end
			
			CHECK_POS9: begin
				
			end
			
			CHECK_POS10: begin
				
			end
			
			CHECK_POS11: begin
				
			end
			
			REVEAL_POS0: begin
				pos0 = 1'b1;
			end
			
			REVEAL_POS1: begin
				pos1 = 1'b1;
			end
			
			REVEAL_POS2: begin
				pos2 = 1'b1;
			end
			
			REVEAL_POS3: begin
				pos3 = 1'b1;
			end
			
			REVEAL_POS4: begin
				pos4 = 1'b1;
			end
			
			REVEAL_POS5: begin
				pos5 = 1'b1;
			end
			
			REVEAL_POS6: begin
				pos6 = 1'b1;
			end
			
			REVEAL_POS7: begin
				pos7 = 1'b1;
			end
			
			REVEAL_POS8: begin
				pos8 = 1'b1;
			end
			
			REVEAL_POS9: begin
				pos9 = 1'b1;
			end
			
			REVEAL_POS10: begin
				pos10 = 1'b1;
			end
			
			REVEAL_POS11: begin
				pos11 = 1'b1;
			end
			
			CHECK_DONE: begin
			
			end
			
			REPORT_MISS: begin
				miss = 1'b1;
			end
			
			LOSE: begin
				// nothin'
			end
		endcase
	end
	
	d_flip_flop dff0 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos0),
		.Q(rev0)
	);
	
	d_flip_flop dff1 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos1),
		.Q(rev1)
	);
	
	d_flip_flop dff2 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos2),
		.Q(rev2)
	);
	
	d_flip_flop dff3 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos3),
		.Q(rev3)
	);
	
	d_flip_flop dff4 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos4),
		.Q(rev4)
	);
	
	d_flip_flop dff5 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos5),
		.Q(rev5)
	);
	
	d_flip_flop dff6 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos6),
		.Q(rev6)
	);
	
	d_flip_flop dff7 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos7),
		.Q(rev7)
	);
	
	d_flip_flop dff8 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos8),
		.Q(rev8)
	);
	
	d_flip_flop dff9 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos9),
		.Q(rev9)
	);
	
	d_flip_flop dff10 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos10),
		.Q(rev10)
	);
	
	d_flip_flop dff11 (
		.Clk(Clk),
		.D(1'b1),
		.Reset(Reset),
		.En(pos11),
		.Q(rev11)
	);
	
	d_flip_flop hit_dff (
		.Clk(Clk),
		.D(1'b1),
		.Reset(clear_hit),
		.En(pos0 | pos1 | pos2 | pos3 | pos4 | pos5 | pos6 | pos7 | pos8 | pos9 | pos10 | pos11),
		.Q(hit)
	);
	
	win_checker WC (
		.length(length),
		.letters({rev11, rev10, rev9, rev8, rev7, rev6, rev5, rev4, rev3, rev2, rev1, rev0}),
		.win(win),
		.lose(lose)
	);
	
	missed_letters ml (
		.miss(miss),
		.Clk(Clk),
		.Reset(Reset),
		.guess(guess),
		.missed(missed),
		.lose(lose),
		.body(body)
	);
	
endmodule

module win_checker ( input [3:0] length, input [11:0] letters, input lose, output logic win );
	assign win = ~lose && (	(length == 4'd1 && letters[0] == 1'b1)
						||	(length == 4'd2 && letters[1:0] == 2'b11)
						||	(length == 4'd3 && letters[2:0] == 3'b111)
						||	(length == 4'd4 && letters[3:0] == 4'b1111)
						||	(length == 4'd5 && letters[4:0] == 5'b11111)
						||	(length == 4'd6 && letters[5:0] == 6'b111111)
						||	(length == 4'd7 && letters[6:0] == 7'b1111111)
						||	(length == 4'd8 && letters[7:0] == 8'b11111111)
						||	(length == 4'd9 && letters[8:0] == 9'b111111111)
						||	(length == 4'd10 && letters[9:0] == 10'b1111111111)
						||	(length == 4'd11 && letters[10:0] == 11'b11111111111)
						||	(length == 4'd12 && letters[11:0] == 12'b111111111111)
						);
endmodule

module missed_letters ( 
								input miss, Clk, Reset,
								input [7:0] guess,
								output logic [47:0] missed,
								output logic lose,
								output logic [3:0] body
							);

	logic en0, en1, en2, en3, en4, en5;
	
	enum logic [3:0] { 
					AWAIT_MISS1, AWAIT_MISS2, AWAIT_MISS3, AWAIT_MISS4, AWAIT_MISS5, AWAIT_MISS6,
					MISS1, MISS2, MISS3, MISS4, MISS5, MISS6,
					LOSE
	} mstate, next_mstate;
	
	always_ff @ (posedge Clk or negedge Reset)
	begin: on_clock
		if (Reset == 1'b0)
			mstate <= AWAIT_MISS1;
		else
			mstate <= next_mstate;
	end
	
	always_comb
	begin: next_state_logic
	
		next_mstate = mstate;
	
		unique case (mstate)
			AWAIT_MISS1: begin
				if (miss)
					next_mstate = MISS1;
			end
			
			AWAIT_MISS2: begin
				if (miss)
					next_mstate = MISS2;
			end
			
			AWAIT_MISS3: begin
				if (miss)
					next_mstate = MISS3;
			end
			
			AWAIT_MISS4: begin
				if (miss)
					next_mstate = MISS4;
			end
			
			AWAIT_MISS5: begin
				if (miss)
					next_mstate = MISS5;
			end
			
			AWAIT_MISS6: begin
				if (miss)
					next_mstate = MISS6;
			end
			
			
			
			MISS1: begin
				next_mstate = AWAIT_MISS2;
			end
			
			MISS2: begin
				next_mstate = AWAIT_MISS3;
			end
			
			MISS3: begin
				next_mstate = AWAIT_MISS4;
			end
			
			MISS4: begin
				next_mstate = AWAIT_MISS5;
			end
			
			MISS5: begin
				next_mstate = AWAIT_MISS6;
			end
			
			MISS6: begin
				next_mstate = LOSE;
			end
			
			LOSE: begin
				// don't do shit
			end
			
		endcase
	end
	
	always_comb
	begin: signal_output
		en0 = 1'b0;
		en1 = 1'b0;
		en2 = 1'b0;
		en3 = 1'b0;
		en4 = 1'b0;
		en5 = 1'b0;
		lose = 1'b0;

		body = 3'b0;

		unique case (mstate)
		
			AWAIT_MISS1: begin
				
			end
			
			AWAIT_MISS2: begin
				body = 3'b001;
			end
			
			AWAIT_MISS3: begin
				body = 3'b010;
			end
			
			AWAIT_MISS4: begin
				body = 3'b011;
			end
			
			AWAIT_MISS5: begin
				body = 3'b100;
			end
			
			AWAIT_MISS6: begin
				body = 3'b101;
			end
			
			
			
			MISS1: begin
				en0 = 1'b1;
				
				body = 3'b001;
			end
			
			MISS2: begin
				en1 = 1'b1;
				
				body = 3'b010;
			end
			
			MISS3: begin
				en2 = 1'b1;
				
				body = 3'b011;
			end
			
			MISS4: begin
				en3 = 1'b1;
				
				body = 3'b100;
			end
			
			MISS5: begin
				en4 = 1'b1;
				
				body = 3'b101;
			end
			
			MISS6: begin
				en5 = 1'b1;
				
				body = 3'b110;
			end
			
			LOSE: begin
				lose = 1'b1;
				
				body = 3'b110;
			end
			
		endcase
	end
	
	reg_8 missed_letter0 (
		.En(en0),
		.Clk(Clk),
		.Reset(Reset),
		.In(guess),
		.Out(missed[7:0])
	);
	
	reg_8 missed_letter1 (
		.En(en1),
		.Clk(Clk),
		.Reset(Reset),
		.In(guess),
		.Out(missed[15:8])
	);
	
	reg_8 missed_letter2 (
		.En(en2),
		.Clk(Clk),
		.Reset(Reset),
		.In(guess),
		.Out(missed[23:16])
	);
	
	reg_8 missed_letter3 (
		.En(en3),
		.Clk(Clk),
		.Reset(Reset),
		.In(guess),
		.Out(missed[31:24])
	);
	
	reg_8 missed_letter4 (
		.En(en4),
		.Clk(Clk),
		.Reset(Reset),
		.In(guess),
		.Out(missed[39:32])
	);
	
	reg_8 missed_letter5 (
		.En(en5),
		.Clk(Clk),
		.Reset(Reset),
		.In(guess),
		.Out(missed[47:40])
	);

endmodule
