module sprite_alphabet_small (
	input [7:0] sprite_index,
	output [0:7] sprite [15:0]
);

	always_comb
	begin
		unique case (sprite_index)
		8'h41:
		begin	
			 // code x41
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00010000; // 2    *
			sprite[3] = 8'b00111000; // 3   ***
			sprite[4] = 8'b01101100; // 4  ** **
			sprite[5] = 8'b11000110; // 5 **   **
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b11111110; // 7 *******
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b11000110; // b **   **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h42:
		begin	
			 // code x42
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11111100; // 2 ******
			sprite[3] = 8'b01100110; // 3  **  **
			sprite[4] = 8'b01100110; // 4  **  **
			sprite[5] = 8'b01100110; // 5  **  **
			sprite[6] = 8'b01111100; // 6  *****
			sprite[7] = 8'b01100110; // 7  **  **
			sprite[8] = 8'b01100110; // 8  **  **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b11111100; // b ******
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h43:
		begin	
			 // code x43
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00111100; // 2   ****
			sprite[3] = 8'b01100110; // 3  **  **
			sprite[4] = 8'b11000010; // 4 **    *
			sprite[5] = 8'b11000000; // 5 **
			sprite[6] = 8'b11000000; // 6 **
			sprite[7] = 8'b11000000; // 7 **
			sprite[8] = 8'b11000000; // 8 **
			sprite[9] = 8'b11000010; // 9 **    *
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b00111100; // b   ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h44:
		begin	
			 // code x44
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11111000; // 2 *****
			sprite[3] = 8'b01101100; // 3  ** **
			sprite[4] = 8'b01100110; // 4  **  **
			sprite[5] = 8'b01100110; // 5  **  **
			sprite[6] = 8'b01100110; // 6  **  **
			sprite[7] = 8'b01100110; // 7  **  **
			sprite[8] = 8'b01100110; // 8  **  **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b01101100; // a  ** **
			sprite[11] = 8'b11111000; // b *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h45:
		begin	
			 // code x45
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11111110; // 2 *******
			sprite[3] = 8'b01100110; // 3  **  **
			sprite[4] = 8'b01100010; // 4  **   *
			sprite[5] = 8'b01101000; // 5  ** *
			sprite[6] = 8'b01111000; // 6  ****
			sprite[7] = 8'b01101000; // 7  ** *
			sprite[8] = 8'b01100000; // 8  **
			sprite[9] = 8'b01100010; // 9  **   *
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b11111110; // b *******
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h46:
		begin	
			 // code x46
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11111110; // 2 *******
			sprite[3] = 8'b01100110; // 3  **  **
			sprite[4] = 8'b01100010; // 4  **   *
			sprite[5] = 8'b01101000; // 5  ** *
			sprite[6] = 8'b01111000; // 6  ****
			sprite[7] = 8'b01101000; // 7  ** *
			sprite[8] = 8'b01100000; // 8  **
			sprite[9] = 8'b01100000; // 9  **
			sprite[10] = 8'b01100000; // a  **
			sprite[11] = 8'b11110000; // b ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h47:
		begin	
			 // code x47
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00111100; // 2   ****
			sprite[3] = 8'b01100110; // 3  **  **
			sprite[4] = 8'b11000010; // 4 **    *
			sprite[5] = 8'b11000000; // 5 **
			sprite[6] = 8'b11000000; // 6 **
			sprite[7] = 8'b11011110; // 7 ** ****
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b00111010; // b   *** *
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h48:
		begin	
			 // code x48
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11000110; // 2 **   **
			sprite[3] = 8'b11000110; // 3 **   **
			sprite[4] = 8'b11000110; // 4 **   **
			sprite[5] = 8'b11000110; // 5 **   **
			sprite[6] = 8'b11111110; // 6 *******
			sprite[7] = 8'b11000110; // 7 **   **
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b11000110; // b **   **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h49:
		begin	
			 // code x49
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00111100; // 2   ****
			sprite[3] = 8'b00011000; // 3    **
			sprite[4] = 8'b00011000; // 4    **
			sprite[5] = 8'b00011000; // 5    **
			sprite[6] = 8'b00011000; // 6    **
			sprite[7] = 8'b00011000; // 7    **
			sprite[8] = 8'b00011000; // 8    **
			sprite[9] = 8'b00011000; // 9    **
			sprite[10] = 8'b00011000; // a    **
			sprite[11] = 8'b00111100; // b   ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h4a:
		begin	
			 // code x4a
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00011110; // 2    ****
			sprite[3] = 8'b00001100; // 3     **
			sprite[4] = 8'b00001100; // 4     **
			sprite[5] = 8'b00001100; // 5     **
			sprite[6] = 8'b00001100; // 6     **
			sprite[7] = 8'b00001100; // 7     **
			sprite[8] = 8'b11001100; // 8 **  **
			sprite[9] = 8'b11001100; // 9 **  **
			sprite[10] = 8'b11001100; // a **  **
			sprite[11] = 8'b01111000; // b  ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h4b:
		begin	
			 // code x4b
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11100110; // 2 ***  **
			sprite[3] = 8'b01100110; // 3  **  **
			sprite[4] = 8'b01100110; // 4  **  **
			sprite[5] = 8'b01101100; // 5  ** **
			sprite[6] = 8'b01111000; // 6  ****
			sprite[7] = 8'b01111000; // 7  ****
			sprite[8] = 8'b01101100; // 8  ** **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b11100110; // b ***  **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h4c:
		begin	
			 // code x4c
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11110000; // 2 ****
			sprite[3] = 8'b01100000; // 3  **
			sprite[4] = 8'b01100000; // 4  **
			sprite[5] = 8'b01100000; // 5  **
			sprite[6] = 8'b01100000; // 6  **
			sprite[7] = 8'b01100000; // 7  **
			sprite[8] = 8'b01100000; // 8  **
			sprite[9] = 8'b01100010; // 9  **   *
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b11111110; // b *******
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h4d:
		begin	
			 // code x4d
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11000011; // 2 **    **
			sprite[3] = 8'b11100111; // 3 ***  ***
			sprite[4] = 8'b11111111; // 4 ********
			sprite[5] = 8'b11111111; // 5 ********
			sprite[6] = 8'b11011011; // 6 ** ** **
			sprite[7] = 8'b11000011; // 7 **    **
			sprite[8] = 8'b11000011; // 8 **    **
			sprite[9] = 8'b11000011; // 9 **    **
			sprite[10] = 8'b11000011; // a **    **
			sprite[11] = 8'b11000011; // b **    **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h4e:
		begin	
			 // code x4e
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11000110; // 2 **   **
			sprite[3] = 8'b11100110; // 3 ***  **
			sprite[4] = 8'b11110110; // 4 **** **
			sprite[5] = 8'b11111110; // 5 *******
			sprite[6] = 8'b11011110; // 6 ** ****
			sprite[7] = 8'b11001110; // 7 **  ***
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b11000110; // b **   **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h4f:
		begin	
			 // code x4f
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b01111100; // 2  *****
			sprite[3] = 8'b11000110; // 3 **   **
			sprite[4] = 8'b11000110; // 4 **   **
			sprite[5] = 8'b11000110; // 5 **   **
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b11000110; // 7 **   **
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h50:
		begin	
			 // code x50
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11111100; // 2 ******
			sprite[3] = 8'b01100110; // 3  **  **
			sprite[4] = 8'b01100110; // 4  **  **
			sprite[5] = 8'b01100110; // 5  **  **
			sprite[6] = 8'b01111100; // 6  *****
			sprite[7] = 8'b01100000; // 7  **
			sprite[8] = 8'b01100000; // 8  **
			sprite[9] = 8'b01100000; // 9  **
			sprite[10] = 8'b01100000; // a  **
			sprite[11] = 8'b11110000; // b ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h51:
		begin	
			 // code x510
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b01111100; // 2  *****
			sprite[3] = 8'b11000110; // 3 **   **
			sprite[4] = 8'b11000110; // 4 **   **
			sprite[5] = 8'b11000110; // 5 **   **
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b11000110; // 7 **   **
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11010110; // 9 ** * **
			sprite[10] = 8'b11011110; // a ** ****
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00001100; // c     **
			sprite[13] = 8'b00001110; // d     ***
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h52:
		begin	
			 // code x52
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11111100; // 2 ******
			sprite[3] = 8'b01100110; // 3  **  **
			sprite[4] = 8'b01100110; // 4  **  **
			sprite[5] = 8'b01100110; // 5  **  **
			sprite[6] = 8'b01111100; // 6  *****
			sprite[7] = 8'b01101100; // 7  ** **
			sprite[8] = 8'b01100110; // 8  **  **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b11100110; // b ***  **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h53:
		begin	
			 // code x53
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b01111100; // 2  *****
			sprite[3] = 8'b11000110; // 3 **   **
			sprite[4] = 8'b11000110; // 4 **   **
			sprite[5] = 8'b01100000; // 5  **
			sprite[6] = 8'b00111000; // 6   ***
			sprite[7] = 8'b00001100; // 7     **
			sprite[8] = 8'b00000110; // 8      **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h54:
		begin	
			 // code x54
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11111111; // 2 ********
			sprite[3] = 8'b11011011; // 3 ** ** **
			sprite[4] = 8'b10011001; // 4 *  **  *
			sprite[5] = 8'b00011000; // 5    **
			sprite[6] = 8'b00011000; // 6    **
			sprite[7] = 8'b00011000; // 7    **
			sprite[8] = 8'b00011000; // 8    **
			sprite[9] = 8'b00011000; // 9    **
			sprite[10] = 8'b00011000; // a    **
			sprite[11] = 8'b00111100; // b   ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h55:
		begin	
			 // code x55
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11000110; // 2 **   **
			sprite[3] = 8'b11000110; // 3 **   **
			sprite[4] = 8'b11000110; // 4 **   **
			sprite[5] = 8'b11000110; // 5 **   **
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b11000110; // 7 **   **
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h56:
		begin	
			 // code x56
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11000011; // 2 **    **
			sprite[3] = 8'b11000011; // 3 **    **
			sprite[4] = 8'b11000011; // 4 **    **
			sprite[5] = 8'b11000011; // 5 **    **
			sprite[6] = 8'b11000011; // 6 **    **
			sprite[7] = 8'b11000011; // 7 **    **
			sprite[8] = 8'b11000011; // 8 **    **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b00111100; // a   ****
			sprite[11] = 8'b00011000; // b    **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h57:
		begin	
			 // code x57
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11000011; // 2 **    **
			sprite[3] = 8'b11000011; // 3 **    **
			sprite[4] = 8'b11000011; // 4 **    **
			sprite[5] = 8'b11000011; // 5 **    **
			sprite[6] = 8'b11000011; // 6 **    **
			sprite[7] = 8'b11011011; // 7 ** ** **
			sprite[8] = 8'b11011011; // 8 ** ** **
			sprite[9] = 8'b11111111; // 9 ********
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b01100110; // b  **  **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h58:
		begin	
			 // code x58
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11000011; // 2 **    **
			sprite[3] = 8'b11000011; // 3 **    **
			sprite[4] = 8'b01100110; // 4  **  **
			sprite[5] = 8'b00111100; // 5   ****
			sprite[6] = 8'b00011000; // 6    **
			sprite[7] = 8'b00011000; // 7    **
			sprite[8] = 8'b00111100; // 8   ****
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b11000011; // a **    **
			sprite[11] = 8'b11000011; // b **    **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h59:
		begin			
			 // code x59
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11000011; // 2 **    **
			sprite[3] = 8'b11000011; // 3 **    **
			sprite[4] = 8'b11000011; // 4 **    **
			sprite[5] = 8'b01100110; // 5  **  **
			sprite[6] = 8'b00111100; // 6   ****
			sprite[7] = 8'b00011000; // 7    **
			sprite[8] = 8'b00011000; // 8    **
			sprite[9] = 8'b00011000; // 9    **
			sprite[10] = 8'b00011000; // a    **
			sprite[11] = 8'b00111100; // b   ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
        8'h5a:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11111111; // 2 ********
			sprite[3] = 8'b11000011; // 3 **    **
			sprite[4] = 8'b10000110; // 4 *    **
			sprite[5] = 8'b00001100; // 5     **
			sprite[6] = 8'b00011000; // 6    **
			sprite[7] = 8'b00110000; // 7   **
			sprite[8] = 8'b01100000; // 8  **
			sprite[9] = 8'b11000001; // 9 **     *
			sprite[10] = 8'b11000011; // a **    **
			sprite[11] = 8'b11111111; // b ********
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000; // f
		end
		8'h61:
		begin
			sprite[0] = 8'b00000000; // 0 
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b01111000; // 5  ****
			sprite[6] = 8'b00001100; // 6     **
			sprite[7] = 8'b01111100; // 7  *****
			sprite[8] = 8'b11001100; // 8 **  **
			sprite[9] = 8'b11001100; // 9 **  **
			sprite[10] = 8'b11001100; // a **  **
			sprite[11] = 8'b01110110; // b  *** **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
		
			 // code x62
		8'h62:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11100000; // 2  ***
			sprite[3] = 8'b01100000; // 3   **
			sprite[4] = 8'b01100000; // 4   **
			sprite[5] = 8'b01111000; // 5   ****
			sprite[6] = 8'b01101100; // 6   ** **
			sprite[7] = 8'b01100110; // 7   **  **
			sprite[8] = 8'b01100110; // 8   **  **
			sprite[9] = 8'b01100110; // 9   **  **
			sprite[10] = 8'b01100110; // a   **  **
			sprite[11] = 8'b01111100; // b   *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x63
		8'h63:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b01111100; // 5  *****
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b11000000; // 7 **
			sprite[8] = 8'b11000000; // 8 **
			sprite[9] = 8'b11000000; // 9 **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x64
		8'h64:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00011100; // 2    ***
			sprite[3] = 8'b00001100; // 3     **
			sprite[4] = 8'b00001100; // 4     **
			sprite[5] = 8'b00111100; // 5   ****
			sprite[6] = 8'b01101100; // 6  ** **
			sprite[7] = 8'b11001100; // 7 **  **
			sprite[8] = 8'b11001100; // 8 **  **
			sprite[9] = 8'b11001100; // 9 **  **
			sprite[10] = 8'b11001100; // a **  **
			sprite[11] = 8'b01110110; // b  *** **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x65
		8'h65:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b01111100; // 5  *****
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b11111110; // 7 *******
			sprite[8] = 8'b11000000; // 8 **
			sprite[9] = 8'b11000000; // 9 **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x66
		8'h66:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00111000; // 2   ***
			sprite[3] = 8'b01101100; // 3  ** **
			sprite[4] = 8'b01100100; // 4  **  *
			sprite[5] = 8'b01100000; // 5  **
			sprite[6] = 8'b11110000; // 6 ****
			sprite[7] = 8'b01100000; // 7  **
			sprite[8] = 8'b01100000; // 8  **
			sprite[9] = 8'b01100000; // 9  **
			sprite[10] = 8'b01100000; // a  **
			sprite[11] = 8'b11110000; // b ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x67
		8'h67:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b01110110; // 5  *** **
			sprite[6] = 8'b11001100; // 6 **  **
			sprite[7] = 8'b11001100; // 7 **  **
			sprite[8] = 8'b11001100; // 8 **  **
			sprite[9] = 8'b11001100; // 9 **  **
			sprite[10] = 8'b11001100; // a **  **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00001100; // c     **
			sprite[13] = 8'b11001100; // d **  **
			sprite[14] = 8'b01111000; // e  ****
			sprite[15] = 8'b00000000;
		end
			 // code x68
		8'h68:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11100000; // 2 ***
			sprite[3] = 8'b01100000; // 3  **
			sprite[4] = 8'b01100000; // 4  **
			sprite[5] = 8'b01101100; // 5  ** **
			sprite[6] = 8'b01110110; // 6  *** **
			sprite[7] = 8'b01100110; // 7  **  **
			sprite[8] = 8'b01100110; // 8  **  **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b11100110; // b ***  **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x69
		8'h69:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00011000; // 2    **
			sprite[3] = 8'b00011000; // 3    **
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b00111000; // 5   ***
			sprite[6] = 8'b00011000; // 6    **
			sprite[7] = 8'b00011000; // 7    **
			sprite[8] = 8'b00011000; // 8    **
			sprite[9] = 8'b00011000; // 9    **
			sprite[10] = 8'b00011000; // a    **
			sprite[11] = 8'b00111100; // b   ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x6a
		8'h6a:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000110; // 2      **
			sprite[3] = 8'b00000110; // 3      **
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b00001110; // 5     ***
			sprite[6] = 8'b00000110; // 6      **
			sprite[7] = 8'b00000110; // 7      **
			sprite[8] = 8'b00000110; // 8      **
			sprite[9] = 8'b00000110; // 9      **
			sprite[10] = 8'b00000110; // a      **
			sprite[11] = 8'b00000110; // b      **
			sprite[12] = 8'b01100110; // c  **  **
			sprite[13] = 8'b01100110; // d  **  **
			sprite[14] = 8'b00111100; // e   ****
			sprite[15] = 8'b00000000;
		end
			 // code x6b0000
		8'h6b:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b11100000; // 2 ***
			sprite[3] = 8'b01100000; // 3  **
			sprite[4] = 8'b01100000; // 4  **
			sprite[5] = 8'b01100110; // 5  **  **
			sprite[6] = 8'b01101100; // 6  ** **
			sprite[7] = 8'b01111000; // 7  ****
			sprite[8] = 8'b01111000; // 8  ****
			sprite[9] = 8'b01101100; // 9  ** **
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b11100110; // b ***  **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x6c
		8'h6c:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00111000; // 2   ***
			sprite[3] = 8'b00011000; // 3    **
			sprite[4] = 8'b00011000; // 4    **
			sprite[5] = 8'b00011000; // 5    **
			sprite[6] = 8'b00011000; // 6    **
			sprite[7] = 8'b00011000; // 7    **
			sprite[8] = 8'b00011000; // 8    **
			sprite[9] = 8'b00011000; // 9    **
			sprite[10] = 8'b00011000; // a    **
			sprite[11] = 8'b00111100; // b   ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x6d
		8'h6d:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11100110; // 5 ***  **
			sprite[6] = 8'b11111111; // 6 ********
			sprite[7] = 8'b11011011; // 7 ** ** **
			sprite[8] = 8'b11011011; // 8 ** ** **
			sprite[9] = 8'b11011011; // 9 ** ** **
			sprite[10] = 8'b11011011; // a ** ** **
			sprite[11] = 8'b11011011; // b ** ** **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x6e
		8'h6e:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11011100; // 5 ** ***
			sprite[6] = 8'b01100110; // 6  **  **
			sprite[7] = 8'b01100110; // 7  **  **
			sprite[8] = 8'b01100110; // 8  **  **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b01100110; // b  **  **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x6f
		8'h6f:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b01111100; // 5  *****
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b11000110; // 7 **   **
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x70
		8'h70:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11011100; // 5 ** ***
			sprite[6] = 8'b01100110; // 6  **  **
			sprite[7] = 8'b01100110; // 7  **  **
			sprite[8] = 8'b01100110; // 8  **  **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b01100000; // c  **
			sprite[13] = 8'b01100000; // d  **
			sprite[14] = 8'b11110000; // e ****
			sprite[15] = 8'b00000000;
		end
			 // code x71
		8'h71:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b01110110; // 5  *** **
			sprite[6] = 8'b11001100; // 6 **  **
			sprite[7] = 8'b11001100; // 7 **  **
			sprite[8] = 8'b11001100; // 8 **  **
			sprite[9] = 8'b11001100; // 9 **  **
			sprite[10] = 8'b11001100; // a **  **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00001100; // c     **
			sprite[13] = 8'b00001100; // d     **
			sprite[14] = 8'b00011110; // e    ****
			sprite[15] = 8'b00000000;
		end
			 // code x72
		8'h72:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11011100; // 5 ** ***
			sprite[6] = 8'b01110110; // 6  *** **
			sprite[7] = 8'b01100110; // 7  **  **
			sprite[8] = 8'b01100000; // 8  **
			sprite[9] = 8'b01100000; // 9  **
			sprite[10] = 8'b01100000; // a  **
			sprite[11] = 8'b11110000; // b ****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x73
		8'h73:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b01111100; // 5  *****
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b01100000; // 7  **
			sprite[8] = 8'b00111000; // 8   ***
			sprite[9] = 8'b00001100; // 9     **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b01111100; // b  *****
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x74
		8'h74:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00010000; // 2    *
			sprite[3] = 8'b00110000; // 3   **
			sprite[4] = 8'b00110000; // 4   **
			sprite[5] = 8'b11111100; // 5 ******
			sprite[6] = 8'b00110000; // 6   **
			sprite[7] = 8'b00110000; // 7   **
			sprite[8] = 8'b00110000; // 8   **
			sprite[9] = 8'b00110000; // 9   **
			sprite[10] = 8'b00110110; // a   ** **
			sprite[11] = 8'b00011100; // b    ***
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x75
		8'h75:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11001100; // 5 **  **
			sprite[6] = 8'b11001100; // 6 **  **
			sprite[7] = 8'b11001100; // 7 **  **
			sprite[8] = 8'b11001100; // 8 **  **
			sprite[9] = 8'b11001100; // 9 **  **
			sprite[10] = 8'b11001100; // a **  **
			sprite[11] = 8'b01110110; // b  *** **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x76
		8'h76:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11000011; // 5 **    **
			sprite[6] = 8'b11000011; // 6 **    **
			sprite[7] = 8'b11000011; // 7 **    **
			sprite[8] = 8'b11000011; // 8 **    **
			sprite[9] = 8'b01100110; // 9  **  **
			sprite[10] = 8'b00111100; // a   ****
			sprite[11] = 8'b00011000; // b    **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x77
		8'h77:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11000011; // 5 **    **
			sprite[6] = 8'b11000011; // 6 **    **
			sprite[7] = 8'b11000011; // 7 **    **
			sprite[8] = 8'b11011011; // 8 ** ** **
			sprite[9] = 8'b11011011; // 9 ** ** **
			sprite[10] = 8'b11111111; // a ********
			sprite[11] = 8'b01100110; // b  **  **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x78
		8'h78:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11000011; // 5 **    **
			sprite[6] = 8'b01100110; // 6  **  **
			sprite[7] = 8'b00111100; // 7   ****
			sprite[8] = 8'b00011000; // 8    **
			sprite[9] = 8'b00111100; // 9   ****
			sprite[10] = 8'b01100110; // a  **  **
			sprite[11] = 8'b11000011; // b **    **
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
			 // code x79
		8'h79:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11000110; // 5 **   **
			sprite[6] = 8'b11000110; // 6 **   **
			sprite[7] = 8'b11000110; // 7 **   **
			sprite[8] = 8'b11000110; // 8 **   **
			sprite[9] = 8'b11000110; // 9 **   **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b01111110; // b  ******
			sprite[12] = 8'b00000110; // c      **
			sprite[13] = 8'b00001100; // d     **
			sprite[14] = 8'b11111000; // e *****
			sprite[15] = 8'b00000000;
		end
			 // code x7a
		8'h7a:
		begin
			sprite[0] = 8'b00000000; // 0
			sprite[1] = 8'b00000000; // 1
			sprite[2] = 8'b00000000; // 2
			sprite[3] = 8'b00000000; // 3
			sprite[4] = 8'b00000000; // 4
			sprite[5] = 8'b11111110; // 5 *******
			sprite[6] = 8'b11001100; // 6 **  **
			sprite[7] = 8'b00011000; // 7    **
			sprite[8] = 8'b00110000; // 8   **
			sprite[9] = 8'b01100000; // 9  **
			sprite[10] = 8'b11000110; // a **   **
			sprite[11] = 8'b11111110; // b *******
			sprite[12] = 8'b00000000; // c
			sprite[13] = 8'b00000000; // d
			sprite[14] = 8'b00000000; // e
			sprite[15] = 8'b00000000;
		end
		default: 
		begin
			sprite[0] = 8'b0;
			sprite[1] = 8'b0;
			sprite[2] = 8'b0;
			sprite[3] = 8'b0;
			sprite[4] = 8'b0;
			sprite[5] = 8'b0;
			sprite[6] = 8'b0;
			sprite[7] = 8'b0;
			sprite[8] = 8'b0;
			sprite[9] = 8'b0;
			sprite[10] = 8'b0;
			sprite[11] = 8'b0;
			sprite[12] = 8'b0;
			sprite[13] = 8'b0;
			sprite[14] = 8'b0;
			sprite[15] = 8'b0;
		end
	endcase
	
	end
	
endmodule