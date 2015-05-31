module  color_mapper #(size_y = 20, size_x = 40) (
							input					game_ready,
							input	[9:0]			DrawX, DrawY, BallX, BallY, Ball_size, ball_x, ball_y,
							input	[1:0]			screen_loc,
							input 					sprite_index,
							input	[0:size_x-1]	maze [size_y-1:0],	maze_letters [size_y-1:0],
							input 	[15:0]			sprite [15:0],
							input	[7:0]			collected_letter,
							// from hangman
							input					check_guess, lose, win,
							input 	[47:0]			missed,
							input 	[95:0] 			revealed,
							input 	[2:0] 			body,
							input 	[3:0] 			length,
							output	[7:0]			Red, Green, Blue				
);
					
	//SCREEN VARIABLES	
	
	logic [9:0] HEAD_POS_X, HEAD_POS_Y, TORSO_POS_X, TORSO_POS_Y, 
			LEFT_ARM_POS_X, LEFT_ARM_POS_Y, RIGHT_ARM_POS_X, 
			RIGHT_ARM_POS_Y, LEFT_LEG_POS_X, LEFT_LEG_POS_Y, RIGHT_LEG_POS_X, RIGHT_LEG_POS_Y;
	
	parameter SPRITE_WIDTH = 16;
	parameter SPRITE_HEIGHT = 16;
	parameter START_SCR_X = 640/2 - 8*19/2;
	parameter START_SCR_Y = 480/2 - 16*2/2;
	
	parameter HANGMAN_X = 16;
	parameter HANGMAN_Y = 480 - 16*2;
	
	parameter CHECK_GUESS_X = HANGMAN_X;
	parameter CHECK_GUESS_Y = HANGMAN_Y;
	
	parameter LOSE_X = HANGMAN_X + 16*1;
	parameter LOSE_Y = HANGMAN_Y;
	
	parameter WIN_X = LOSE_X + 16*1;
	parameter WIN_Y = HANGMAN_Y;
	
	parameter MISSED_X = WIN_X + 16*2;
	parameter MISSED_Y = HANGMAN_Y;
	
	parameter REVEALED_X = MISSED_X + 16*7; // a bit after the missed words
	parameter REVEALED_Y = HANGMAN_Y;
	
	parameter UNDER_X = REVEALED_X;
	parameter UNDER_Y = REVEALED_Y + 16*1 + 4;
	
	parameter HEAD_X = 640/2 - 8;
	parameter HEAD_Y = REVEALED_Y - 16*6;
	assign HEAD_POS_X = DrawX - HEAD_X;
	assign HEAD_POS_Y = DrawY - HEAD_Y;
	
	parameter TORSO_X = HEAD_X;
	parameter TORSO_Y = HEAD_Y + 16;
	assign TORSO_POS_X = DrawX - TORSO_X;
	assign TORSO_POS_Y = DrawY - TORSO_Y;
	
	parameter LEFT_ARM_X = TORSO_X - 16;
	parameter LEFT_ARM_Y = TORSO_Y;
	assign LEFT_ARM_POS_X = DrawX - LEFT_ARM_X;
	assign LEFT_ARM_POS_Y = DrawY - LEFT_ARM_Y;
	
	parameter RIGHT_ARM_X = TORSO_X + 16;
	parameter RIGHT_ARM_Y = TORSO_Y;
	assign RIGHT_ARM_POS_X = DrawX - RIGHT_ARM_X;
	assign RIGHT_ARM_POS_Y = DrawY - RIGHT_ARM_Y;
	
	parameter LEFT_LEG_X = TORSO_X - 8;
	parameter LEFT_LEG_Y = TORSO_Y + 16;
	assign LEFT_LEG_POS_X = DrawX - LEFT_LEG_X;
	assign LEFT_LEG_POS_Y = DrawY - LEFT_LEG_Y;
	
	parameter RIGHT_LEG_X = TORSO_X + 8;
	parameter RIGHT_LEG_Y = TORSO_Y + 16;
	assign RIGHT_LEG_POS_X = DrawX - RIGHT_LEG_X;
	assign RIGHT_LEG_POS_Y = DrawY - RIGHT_LEG_Y;
	
	//BALL CHAR VARIABLES
	int DistX, DistY, Size;
	assign DistX = DrawX - BallX;
	assign DistY = DrawY - BallY;
	assign Size = Ball_size;
	//logic ball_dot;
	//assign ball_dot = ( DrawX/16 == ball_x && DrawY/16 == ball_y ) ? 1'b1 : 1'b0;
	
	//font_rom f(addr, out);
	//sprite_alphabet s (2'h61, out);
	logic [0:15] letter_sprite [15:0];
	//sprite_table st(2'd01, char);
	
	logic bg_draw;	
	logic letter_draw;
	logic ball_draw;
	logic draw_my_maze;
	
	logic hm_check;
	logic hm_lose;
	logic hm_win;
	logic hm_missed;
	logic hm_revealed;
	
	logic hm_missed_spr0;
	logic hm_missed_spr1;
	logic hm_missed_spr2;
	logic hm_missed_spr3;
	logic hm_missed_spr4;
	logic hm_missed_spr5;
	logic hm_revealed_spr0;
	logic hm_revealed_spr1;
	logic hm_revealed_spr2;
	logic hm_revealed_spr3;
	logic hm_revealed_spr4;
	logic hm_revealed_spr5;
	logic hm_revealed_spr6;
	logic hm_revealed_spr7;
	logic hm_revealed_spr8;
	logic hm_revealed_spr9;
	logic hm_revealed_spr10;
	logic hm_revealed_spr11;
	
	logic hm_head;
	logic hm_torso;
	logic hm_left_arm;
	logic hm_right_arm;
	logic hm_left_leg;
	logic hm_right_leg;
	
	logic hm_rev_under0;
	logic hm_rev_under1;
	logic hm_rev_under2;
	logic hm_rev_under3;
	logic hm_rev_under4;
	logic hm_rev_under5;
	logic hm_rev_under6;
	logic hm_rev_under7;
	logic hm_rev_under8;
	logic hm_rev_under9;
	logic hm_rev_under10;
	logic hm_rev_under11;
	
//	assign hm_rev_under0 = ((DrawX - REVEALED_X)/16 - 4) >= 16*0 && ((DrawX - REVEALED_X)/16 - 4) < 16*1-8 && length >= 12 ? 1'b1 : 1'b0;
//	assign hm_rev_under1 = ((DrawX - REVEALED_X)/16 - 4) >= 16*1 && ((DrawX - REVEALED_X)/16 - 4) < 16*2-8 && length >= 11 ? 1'b1 : 1'b0;
//	assign hm_rev_under2 = ((DrawX - REVEALED_X)/16 - 4) >= 16*2 && ((DrawX - REVEALED_X)/16 - 4) < 16*3-8 && length >= 10 ? 1'b1 : 1'b0;
//	assign hm_rev_under3 = ((DrawX - REVEALED_X)/16 - 4) >= 16*3 && ((DrawX - REVEALED_X)/16 - 4) < 16*4-8 && length >= 9 ? 1'b1 : 1'b0;
//	assign hm_rev_under4 = ((DrawX - REVEALED_X)/16 - 4) >= 16*4 && ((DrawX - REVEALED_X)/16 - 4) < 16*5-8 && length >= 8 ? 1'b1 : 1'b0;
//	assign hm_rev_under5 = ((DrawX - REVEALED_X)/16 - 4) >= 16*5 && ((DrawX - REVEALED_X)/16 - 4) < 16*6-8 && length >= 7 ? 1'b1 : 1'b0;
//	assign hm_rev_under6 = ((DrawX - REVEALED_X)/16 - 4) >= 16*6 && ((DrawX - REVEALED_X)/16 - 4) < 16*7-8 && length >= 6 ? 1'b1 : 1'b0;
//	assign hm_rev_under7 = ((DrawX - REVEALED_X)/16 - 4) >= 16*7 && ((DrawX - REVEALED_X)/16 - 4) < 16*8-8 && length >= 5 ? 1'b1 : 1'b0;
//	assign hm_rev_under8 = ((DrawX - REVEALED_X)/16 - 4) >= 16*8 && ((DrawX - REVEALED_X)/16 - 4) < 16*9-8 && length >= 4 ? 1'b1 : 1'b0;
//	assign hm_rev_under9 = ((DrawX - REVEALED_X)/16 - 4) >= 16*9 && ((DrawX - REVEALED_X)/16 - 4) < 16*10-8 && length >= 3 ? 1'b1 : 1'b0;
//	assign hm_rev_under10 = ((DrawX - REVEALED_X)/16 - 4) >= 16*10 && ((DrawX - REVEALED_X)/16 - 4) < 16*11-8 && length >= 2 ? 1'b1 : 1'b0;
//	assign hm_rev_under11 = ((DrawX - REVEALED_X)/16 - 4) >= 16*11 && ((DrawX - REVEALED_X)/16 - 4) < 16*12-8 && length >= 1 ? 1'b1 : 1'b0;
	
	draw_maze_big #(.size_y(size_y), .size_x(size_x)) dm (.maze(maze), .DrawX(DrawX), .DrawY(DrawY), .draw(draw_my_maze));
	draw_letters_big #(.size_y(size_y), .size_x(size_x)) dl (.maze_letters(maze_letters), .DrawX(DrawX), .DrawY(DrawY), .draw(letter_draw), .sprite(letter_sprite));
	
	always_comb
	begin: Maze_sprite
		bg_draw = 1'b0;
		ball_draw = 1'b0;
		
		hm_check = 1'b0;
		hm_lose = 1'b0;
		hm_win = 1'b0;
		hm_missed = 1'b0;
		hm_revealed = 1'b0;
		
		hm_missed_spr0 = 1'b0;
		hm_missed_spr1 = 1'b0;
		hm_missed_spr2 = 1'b0;
		hm_missed_spr3 = 1'b0;
		hm_missed_spr4 = 1'b0;
		hm_missed_spr5 = 1'b0;
		hm_revealed_spr0 = 1'b0;
		hm_revealed_spr1 = 1'b0;
		hm_revealed_spr2 = 1'b0;
		hm_revealed_spr3 = 1'b0;
		hm_revealed_spr4 = 1'b0;
		hm_revealed_spr5 = 1'b0;
		hm_revealed_spr6 = 1'b0;
		hm_revealed_spr7 = 1'b0;
		hm_revealed_spr8 = 1'b0;
		hm_revealed_spr9 = 1'b0;
		hm_revealed_spr10 = 1'b0;
		hm_revealed_spr11 = 1'b0;
		
		hm_head = 1'b0;
		hm_torso = 1'b0;
		hm_left_arm = 1'b0;
		hm_right_arm = 1'b0;
		hm_left_leg = 1'b0;
		hm_right_leg = 1'b0;
			
		if ( ( DistX*DistX + DistY*DistY) <= (Size * Size))
			ball_draw = 1'b1;					
		else if ( (DrawX - CHECK_GUESS_X) >= 0 && (DrawX - CHECK_GUESS_X) < 16 &&
				  (DrawY - CHECK_GUESS_Y) >= 0 && (DrawY - CHECK_GUESS_Y) < 16
				)
			hm_check = 1'b1;
		else if ( (DrawX - LOSE_X) >= 0 && (DrawX - LOSE_X) < 16 &&
				  (DrawY - LOSE_Y) >= 0 && (DrawY - LOSE_Y) < 16
				)
			hm_lose = 1'b1;
		else if ( (DrawX - WIN_X) >= 0 && (DrawX - WIN_X) < 16 &&
				  (DrawY - WIN_Y) >= 0 && (DrawY - WIN_Y) < 16
				)
			hm_win = 1'b1;
		else if ( (DrawX - MISSED_X) >= 0 && (DrawX - MISSED_X) < 16*6 &&
				  (DrawY - MISSED_Y) >= 0 && (DrawY - MISSED_Y) < 16
				)
				begin
					hm_missed = 1'b1;
					case ((DrawX - REVEALED_X)/16)
						0:	hm_missed_spr5 = 1'b1;
						1:	hm_missed_spr4 = 1'b1;
						2:	hm_missed_spr3 = 1'b1;
						3:	hm_missed_spr2 = 1'b1;
						4:	hm_missed_spr1 = 1'b1;
						5:	hm_missed_spr0 = 1'b1;
						default: ;
					endcase
				end
		else if ( (DrawX - REVEALED_X) >= 0 && (DrawX - REVEALED_X) < 16*12 &&
				  (DrawY - REVEALED_Y) >= 0 && (DrawY - REVEALED_Y) < 16
				)
				begin
					hm_revealed = 1'b1;
					case ((DrawX - REVEALED_X)/16)
						0:	hm_revealed_spr11 = 1'b1;
						1:	hm_revealed_spr10 = 1'b1;
						2:	hm_revealed_spr9 = 1'b1;
						3:	hm_revealed_spr8 = 1'b1;
						4:	hm_revealed_spr7 = 1'b1;
						5:	hm_revealed_spr6 = 1'b1;
						6:	hm_revealed_spr5 = 1'b1;
						7:	hm_revealed_spr4 = 1'b1;
						8:	hm_revealed_spr3 = 1'b1;
						9:	hm_revealed_spr2 = 1'b1;
						10:	hm_revealed_spr1 = 1'b1;
						11:	hm_revealed_spr0 = 1'b1;
						default: ;
					endcase
				end
		else if (HEAD_POS_X >= 0 && HEAD_POS_X < 16 && HEAD_POS_Y >= 0 && HEAD_POS_Y < 16)
			hm_head = 1'b1;
		else if (TORSO_POS_X >= 0 && TORSO_POS_X < 16 && TORSO_POS_Y >= 0 && TORSO_POS_Y < 16)
			hm_torso = 1'b1;
		else if (LEFT_ARM_POS_X >= 0 && LEFT_ARM_POS_X < 16 && LEFT_ARM_POS_Y >= 0 && LEFT_ARM_POS_Y < 16)
			hm_left_arm = 1'b1;
		else if (RIGHT_ARM_POS_X >= 0 && RIGHT_ARM_POS_X < 16 && RIGHT_ARM_POS_Y >= 0 && RIGHT_ARM_POS_Y < 16)
			hm_right_arm = 1'b1;
		else if (LEFT_LEG_POS_X >= 0 && LEFT_LEG_POS_X < 16 && LEFT_LEG_POS_Y >= 0 && LEFT_LEG_POS_Y < 16)
			hm_left_leg = 1'b1;
		else if (RIGHT_LEG_POS_X >= 0 && RIGHT_LEG_POS_X < 16 && RIGHT_LEG_POS_Y >= 0 && RIGHT_LEG_POS_Y < 16)
			hm_right_leg = 1'b1;
		else
			bg_draw = 1'b1;
	end
	
	always_comb
	begin: draw_underscores
		hm_rev_under0 = 1'b0;
		hm_rev_under1 = 1'b0;
		hm_rev_under2 = 1'b0;
		hm_rev_under3 = 1'b0;
		hm_rev_under4 = 1'b0;
		if ((DrawY - UNDER_Y) >= 0 && (DrawY - UNDER_Y) < 4)
		begin
			if (hm_revealed_spr0 && (DrawX - REVEALED_X - 4)/16 == 11 && (DrawX - REVEALED_X + 4)/16 == 11 && length >= 1)
				hm_rev_under0 = 1'b1;
			if (hm_revealed_spr1 && (DrawX - REVEALED_X - 4)/16 == 10 && (DrawX - REVEALED_X + 4)/16 == 10 && length >= 2)
				hm_rev_under1 = 1'b1;
			if (hm_revealed_spr2 && (DrawX - REVEALED_X - 4)/16 == 9 && (DrawX - REVEALED_X + 4)/16 == 9 && length >= 3)
				hm_rev_under2 = 1'b1;
			if (hm_revealed_spr3 && (DrawX - REVEALED_X - 4)/16 == 8 && (DrawX - REVEALED_X + 4)/16 == 8 && length >= 4)
				hm_rev_under3 = 1'b1;
			if (hm_revealed_spr4 && (DrawX - REVEALED_X - 4)/16 == 7 && (DrawX - REVEALED_X + 4)/16 == 7 && length >= 5)
				hm_rev_under4 = 1'b1;
		end
	end
		
	always_comb
	begin: RGB_display

		Red = 8'h00;
		Green = 8'h00;
		Blue = 8'h00;

		
		if (game_ready | win | lose)
		begin
			// DRAW MAZE
			if (draw_my_maze && (sprite[DrawY % 16][DrawX % 16] == 1'b1))
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (draw_my_maze && (sprite[DrawY % 16][DrawX % 16] == 1'b0))
			begin
				Red = 8'hf9;
				Green = 8'h63;
				Blue = 8'ha0;
			end
//			else if (ball_dot == 1'b1 && (DrawX % 16) == 8 && (DrawY % 16) == 8)
//			begin
//				Red = 8'hff;
//				Green = 8'hff;
//				Blue = 8'hff;
//			end
			// DRAW BALL
			else if (ball_draw == 1'b1)
			begin
//				Red = 8'h00;
//				Green = 8'h00;
//				Blue = 8'h00;
				if ( skull[(DistY+Size) % 16][(DistX + Size) % 16] == 3'b000 ) // white
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
				if ( skull[(DistY + Size) % 16][(DistX + Size) % 16] == 3'b001 ) // light gray
				begin
					Red = 8'h7f;
					Green = 8'h7f;
					Blue = 8'h7f;
				end
				if ( skull[(DistY + Size) % 16][(DistX + Size) % 16] == 3'b010 ) // dark gray
				begin
					Red = 8'hc3;
					Green = 8'hc3;
					Blue = 8'hc3;
				end
				if ( skull[(DistY + Size) % 16][(DistX + Size) % 16] == 3'b011 ) // black
				begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'hff;
				end
			end
			// DRAW LETTERS
			else if (letter_draw && letter_sprite[DrawY % 16][DrawX % 16] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			// DRAW CHECK_GUESS
			else if (hm_check && check_guess)
			begin
				Red = 8'hff; 
				Green = 8'h00;
				Blue = 8'hff;			
			end
			// DRAW LOSE
			else if (hm_lose && lose)
			begin
				Red = 8'hff; 
				Green = 8'h00;
				Blue = 8'h00;
			end
			// DRAW WIN
			else if (hm_win && win)
			begin
				Red = 8'h00; 
				Green = 8'hff;
				Blue = 8'h00;
			end
			// DRAW MISSED LETTERS
			else if (hm_missed_spr0 && missed_sprite0[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_missed_spr1 && missed_sprite1[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_missed_spr2 && missed_sprite2[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_missed_spr3 && missed_sprite3[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_missed_spr4 && missed_sprite4[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_missed_spr5 && missed_sprite5[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			// DRAW MISSED BACKGROUND
			else if (hm_missed)
			begin
				Red = 8'hff / 2; 
				Green = 8'h00;
				Blue = 8'h00;
			end
			// DRAW REVEALED LETTERS
			else if (hm_revealed_spr0 && revealed_sprite0[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr1 && revealed_sprite1[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr2 && revealed_sprite2[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr3 && revealed_sprite3[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr4 && revealed_sprite4[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr5 && revealed_sprite5[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr6 && revealed_sprite6[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr7 && revealed_sprite7[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr8 && revealed_sprite8[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr9 && revealed_sprite9[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr10 && revealed_sprite10[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_revealed_spr11 && revealed_sprite11[DrawY % 16][DrawX % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_rev_under0)
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_rev_under1)
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_rev_under2)
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_rev_under3)
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if (hm_rev_under4)
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			// DRAW REVEALED BACKGROUND
//			else if (hm_revealed)
//			begin
//				Red = 8'h00; 
//				Green = 8'hff / 2;
//				Blue = 8'h00;
//			end
			else if (hm_head && body == 3'b001 && head_sprite[HEAD_POS_Y % 16][HEAD_POS_X % 16])
			begin
				Red = 8'hff; 
				Green = 8'hff / 2;
				Blue = 8'h00;
			end
			else if (hm_torso && body == 3'b010 && torso_sprite[TORSO_POS_Y % 16][TORSO_POS_X % 16])
			begin
				Red = 8'hff;
				Green = 8'hff / 2;
				Blue = 8'h00;
			end
			else if (hm_left_arm && body == 3'b011 && left_arm_sprite[LEFT_ARM_POS_Y % 16][LEFT_ARM_POS_X % 16])
			begin
				Red = 8'hff;
				Green = 8'hff / 2;
				Blue = 8'h00;
			end
			else if (hm_right_arm && body == 3'b100 && right_arm_sprite[RIGHT_ARM_POS_Y % 16][RIGHT_ARM_POS_X % 16])
			begin
				Red = 8'hff;
				Green = 8'hff / 2;
				Blue = 8'h00;
			end
			else if (hm_left_leg && body == 3'b101 && left_leg_sprite[LEFT_LEG_POS_Y % 16][LEFT_LEG_POS_X % 16])
			begin
				Red = 8'hff;
				Green = 8'hff / 2;
				Blue = 8'h00;
			end
			else if (hm_right_leg && body == 3'b110 && right_arm_sprite[RIGHT_ARM_POS_Y % 16][RIGHT_ARM_POS_X % 16])
			begin
				Red = 8'hff;
				Green = 8'hff / 2;
				Blue = 8'h00;
			end
			else if ( ((DrawX - REVEALED_X)/16 - 4) >= 0 && ((DrawY - REVEALED_Y) + 16) >= 0 && ((DrawY - REVEALED_Y) + 24 < 0)
						)
			begin
				Red = 8'hff; 
				Green = 8'hff;
				Blue = 8'hff;
			end
			else		/*BACKGROUND COLOR*/
			begin
				Red = 8'h3c; 
				Green = 8'h12;
				Blue = 8'h4f;
			end
		end
//		else if (win)
//		begin
//			
//		end
//		else if (lose)
//		begin
//			
//		end
		else
		begin			/*BACKGROUND COLOR*/
			if ( (DrawY - START_SCR_Y) >= 0 && 
				 (DrawY - START_SCR_Y) < 16 &&
				 (DrawX - START_SCR_X) >= 0 &&
				 (DrawX - START_SCR_X) < 152 &&
				 text[DrawY % 16][(DrawX - START_SCR_X)/8][(DrawX-4) % 8] == 1'b1
				)
			begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if ( 
				 (DrawY - START_SCR_Y) >= 16 &&
				 (DrawY - START_SCR_Y) < 32 &&
				 (DrawX - START_SCR_X) >= 0 && 
				 (DrawX - START_SCR_X) < 88 &&
				 text[DrawY % 16][(DrawX - START_SCR_X)/8+19][(DrawX-4) % 8] == 1'b1
				)
			begin
				Red = 8'h00; 
				Green = 8'h00;
				Blue = 8'hff;
			end
			else
			begin
				Red = 8'h00; 
				Green = 8'h00;
				Blue = 8'h00;
			end
		end
	end

	logic [0:15] collected_sprite [15:0];
	logic [0:15] missed_sprite0 [15:0];
	logic [0:15] missed_sprite1 [15:0];
	logic [0:15] missed_sprite2 [15:0];
	logic [0:15] missed_sprite3 [15:0];
	logic [0:15] missed_sprite4 [15:0];
	logic [0:15] missed_sprite5 [15:0];
	logic [0:15] revealed_sprite0 [15:0];
	logic [0:15] revealed_sprite1 [15:0];
	logic [0:15] revealed_sprite2 [15:0];
	logic [0:15] revealed_sprite3 [15:0];
	logic [0:15] revealed_sprite4 [15:0];
	logic [0:15] revealed_sprite5 [15:0];
	logic [0:15] revealed_sprite6 [15:0];
	logic [0:15] revealed_sprite7 [15:0];
	logic [0:15] revealed_sprite8 [15:0];
	logic [0:15] revealed_sprite9 [15:0];
	logic [0:15] revealed_sprite10 [15:0];
	logic [0:15] revealed_sprite11 [15:0];
	logic [15:0][2:0] skull [15:0];
	logic [15:0] head_sprite [15:0];
	logic [15:0] torso_sprite [15:0];
	logic [15:0] left_arm_sprite [15:0];
	logic [15:0] right_arm_sprite [15:0];
	logic [15:0] left_leg_sprite [15:0];
	logic [15:0] right_leg_sprite [15:0];	
	
	sprite_alphabet sac (.sprite_index(collected_letter), .sprite(collected_sprite));
	
	sprite_alphabet sam0 (.sprite_index(missed[7:0]), .sprite(missed_sprite5));
	sprite_alphabet sam1 (.sprite_index(missed[15:8]), .sprite(missed_sprite4));
	sprite_alphabet sam2 (.sprite_index(missed[23:16]), .sprite(missed_sprite3));
	sprite_alphabet sam3 (.sprite_index(missed[31:24]), .sprite(missed_sprite2));
	sprite_alphabet sam4 (.sprite_index(missed[39:32]), .sprite(missed_sprite1));
	sprite_alphabet sam5 (.sprite_index(missed[47:40]), .sprite(missed_sprite0));
	
	sprite_alphabet sar11 (.sprite_index(revealed[95:88]), .sprite(revealed_sprite11));
	sprite_alphabet sar10 (.sprite_index(revealed[87:80]), .sprite(revealed_sprite10));
	sprite_alphabet sar9 (.sprite_index(revealed[79:72]), .sprite(revealed_sprite9));
	sprite_alphabet sar8 (.sprite_index(revealed[71:64]), .sprite(revealed_sprite8));
	sprite_alphabet sar7 (.sprite_index(revealed[63:56]), .sprite(revealed_sprite7));
	sprite_alphabet sar6 (.sprite_index(revealed[55:48]), .sprite(revealed_sprite6));
	sprite_alphabet sar5 (.sprite_index(revealed[47:40]), .sprite(revealed_sprite5));
	sprite_alphabet sar4 (.sprite_index(revealed[39:32]), .sprite(revealed_sprite4));
	sprite_alphabet sar3 (.sprite_index(revealed[31:24]), .sprite(revealed_sprite3));
	sprite_alphabet sar2 (.sprite_index(revealed[23:16]), .sprite(revealed_sprite2));
	sprite_alphabet sar1 (.sprite_index(revealed[15:8]), .sprite(revealed_sprite1));
	sprite_alphabet sar0 (.sprite_index(revealed[7:0]), .sprite(revealed_sprite0));
	
	sprite_table_2 st2 (.sprite_index(8'h00), .sprite(skull));
	sprite_table st_head (.sprite_index(4'h1), .sprite(head_sprite));
	sprite_table st_torso (.sprite_index(4'h2), .sprite(torso_sprite));
	sprite_table st_left_arm (.sprite_index(4'h3), .sprite(left_arm_sprite));
	sprite_table st_right_arm (.sprite_index(4'h3), .sprite(right_arm_sprite));
	sprite_table st_left_leg (.sprite_index(4'h4), .sprite(left_leg_sprite));
	sprite_table st_right_leg (.sprite_index(4'h5), .sprite(right_leg_sprite));
	
	logic [0:7] text [15:0][29:0];
	screen sc (
		.text(text)
	);
	
endmodule

module screen (
	output [0:7] text [15:0][29:0]
	//       b                 y     x
	// y -> row of letter
	// x -> letter in message
	// b (first) -> bits of letter
);

	logic [0:7] W [15:0], H [15:0], M [15:0], P [15:0], S [15:0],
				T [15:0], A [15:0], R [15:0], e [15:0], l [15:0],
				c [15:0], o [15:0], m [15:0], t [15:0], a [15:0],
				n [15:0], g [15:0], z [15:0], r [15:0], s [15:0],
				space [15:0];

	sprite_alphabet_small sa_W (.sprite_index(8'h57), .sprite(W));
	sprite_alphabet_small sa_H (.sprite_index(8'h48), .sprite(H));
	sprite_alphabet_small sa_M (.sprite_index(8'h4d), .sprite(M));
	sprite_alphabet_small sa_P (.sprite_index(8'h50), .sprite(P));
	sprite_alphabet_small sa_S (.sprite_index(8'h53), .sprite(S));
	sprite_alphabet_small sa_T (.sprite_index(8'h54), .sprite(T));
	sprite_alphabet_small sa_A (.sprite_index(8'h41), .sprite(A));
	sprite_alphabet_small sa_R (.sprite_index(8'h52), .sprite(R));
	sprite_alphabet_small sa_e (.sprite_index(8'h65), .sprite(e));
	sprite_alphabet_small sa_l (.sprite_index(8'h6c), .sprite(l));
	sprite_alphabet_small sa_c (.sprite_index(8'h63), .sprite(c));
	sprite_alphabet_small sa_o (.sprite_index(8'h6f), .sprite(o));
	sprite_alphabet_small sa_m (.sprite_index(8'h6d), .sprite(m));
	sprite_alphabet_small sa_t (.sprite_index(8'h74), .sprite(t));
	sprite_alphabet_small sa_a (.sprite_index(8'h61), .sprite(a));
	sprite_alphabet_small sa_n (.sprite_index(8'h6e), .sprite(n));
	sprite_alphabet_small sa_g (.sprite_index(8'h67), .sprite(g));
	sprite_alphabet_small sa_z (.sprite_index(8'h7a), .sprite(z));
	sprite_alphabet_small sa_r (.sprite_index(8'h72), .sprite(r));
	sprite_alphabet_small sa_s (.sprite_index(8'h73), .sprite(s));
	sprite_alphabet_small sa_space (.sprite_index(8'h00), .sprite(space));
	
	//		Welcome to HangMaze
	//			 Press START
	
	generate
		genvar y;
			for ( y = 0; y < 16; y++ )
			begin: create_y
				assign text[y][0] = W[y];
				assign text[y][1] = e[y];
				assign text[y][2] = l[y];
				assign text[y][3] = c[y];
				assign text[y][4] = o[y];
				assign text[y][5] = m[y];
				assign text[y][6] = e[y];
				assign text[y][7] = space[y];
				assign text[y][8] = t[y];
				assign text[y][9] = o[y];
				assign text[y][10] = space[y];
				assign text[y][11] = H[y];
				assign text[y][12] = a[y];
				assign text[y][13] = n[y];
				assign text[y][14] = g[y];
				assign text[y][15] = M[y];
				assign text[y][16] = a[y];
				assign text[y][17] = z[y];
				assign text[y][18] = e[y];
				assign text[y][19] = P[y];
				assign text[y][20] = r[y];
				assign text[y][21] = e[y];
				assign text[y][22] = s[y];
				assign text[y][23] = s[y];
				assign text[y][24] = space[y];
				assign text[y][25] = S[y];
				assign text[y][26] = T[y];
				assign text[y][27] = A[y];
				assign text[y][28] = R[y];
				assign text[y][29] = T[y];	
			end
	endgenerate
endmodule

