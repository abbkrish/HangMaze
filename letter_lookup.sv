module letter_lookup #(size_y = 20, size_x = 40) (
	output [7:0] letters[size_y-1:0][0:size_x-1]
);

//	generate
//		genvar a;
//		
//		for (a = 0; a < 26; a++)
//		
//	endgenerate
	
	generate
		genvar y, x;
	
		for (y = 0; y < size_y; y++)
		begin: create_y
			for (x = 0; x < size_x; x++)
			begin: create_x
				always_comb
				begin	
					letters[y][x] = 8'h00;
					
					if ( y == 2 && x == 7 ) // a
						letters[y][x]		= 8'h61;
					else if ( y == 7 && x == 1 ) // b
						letters[y][x]		= 8'h62;
					else if ( y == 3 && x == 22) // c
						letters[y][x]		= 8'h63;
					else if ( y == 5 && x == 13) // d
						letters[y][x]		= 8'h64;
					else if ( y == 4 && x == 9 ) // e
						letters[y][x]		= 8'h65;
					else if ( y == 3 && x == 16) // f
						letters[y][x]		= 8'h66;
					else if ( y == 7 && x == 20) // g
						letters[y][x]		= 8'h67;
					else if ( y == 1 && x == 12)// h
						letters[y][x] 		= 8'h68; 
					else if ( y == 6 && x == 5) // i
						letters[y][x] 		= 8'h69;
					else if ( y == 1 && x == 15) // j
						letters[y][x] 		= 8'h6a;
					else if ( y == 2 && x == 17) // k
						letters[y][x] 		= 8'h6b;
					else if ( y == 13 && x == 9) // l
						letters[y][x] 		= 8'h6c;
					else if ( y == 5 && x == 1) // m
						letters[y][x] 		= 8'h6d;
					else if ( y == 3 && x == 19) // n
						letters[y][x] 		= 8'h6e;
					else if ( y == 10 && x == 25) // o
						letters[y][x] 		= 8'h6f;
					else if ( y == 2 && x == 23) // p
						letters[y][x] 		= 8'h70;
					else if ( y == 13 && x == 2) // q
						letters[y][x] 		= 8'h71;
					else if ( y == 1 && x == 20) // r
						letters[y][x] 		= 8'h72;
					else if ( y == 11 && x == 10) // s
						letters[y][x] 		= 8'h73;
					else if ( y == 7 && x == 9) // t
						letters[y][x] 		= 8'h74;
					else if ( y == 4 && x == 4) // u
						letters[y][x] 		= 8'h75;
					else if ( y == 12 && x == 19) // v
						letters[y][x] 		= 8'h76;
					else if ( y == 6 && x == 11) // w
						letters[y][x] 		= 8'h77;
					else if ( y == 1 && x == 16) // x
						letters[y][x] 		= 8'h78;
					else if ( y == 10 && x == 10) // y
						letters[y][x] 		= 8'h79;
					else if ( y == 16 && x == 15) // z
						letters[y][x] 		= 8'h7a;
				end
			end
		end
	endgenerate
	
	/*
		61 a	62 b	63 c	64 d	65 e
		66 f	67 g	68 h	69 i	6a j
		6b k	6c l	6d m	6e n	6f o
		70 p	71 q	72 r	73 s	74 t
		75 u	76 v	77 w	78 x	79 y
		7a z
	*/
	//underpay
	/*
		letters would be indicate in the grid
		say the character picks up the letter
		then we would look up the letter at that location
		and send it to hangman
	
		0000000000000
		0000000100000
		0000000000100
		0010001000000
		0000100000110
		0001010001000
		0000000000001
		1000001010101
		0000000000000
	*/
	
endmodule
