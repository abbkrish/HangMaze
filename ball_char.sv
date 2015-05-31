module ball #(size_y = 20, size_x = 40) ( 
					input game_ready,
					input [7:0] Keycode,
					input Reset, frame_clk, Clk,
					input [0:size_x-1] up_constraint [size_y-1:0], down_constraint [size_y-1:0], left_constraint [size_y-1:0], right_constraint [size_y-1:0],
					output [9:0] BallX, BallY, BallS,
					output [5:0] ball_x, ball_y 			// the current x and y coords
);
	
	logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size, Ball_Left, Ball_Right, Ball_Top, Ball_Bottom;
	logic no_up, no_left, no_right, no_down, no_up0, no_left0, no_right0, no_down0;
	 
	parameter [9:0] Ball_X_Center=24; // Center position on the X axis
	parameter [9:0] Ball_Y_Center=24; // Center position on the Y axis
	parameter [9:0] Ball_X_Min=0;	  // Leftmost point on the X axis
	parameter [9:0] Ball_X_Max=639;	 // Rightmost point on the X axis
	parameter [9:0] Ball_Y_Min=0;	  // Topmost point on the Y axis
	parameter [9:0] Ball_Y_Max=size_y*16-1;	 // Bottommost point on the Y axis
	parameter [9:0] Ball_X_Step=2;	 // Step size on the X axis  Candice went to great lengths to change this!
	parameter [9:0] Ball_Y_Step=2;	 // Step size on the Y axis	 
	 
	assign Ball_Size = 4; // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	assign Ball_Left = Ball_X_Pos - Ball_Size;
	assign Ball_Right = Ball_X_Pos + Ball_Size;
	assign Ball_Top = Ball_Y_Pos - Ball_Size;
	assign Ball_Bottom = Ball_Y_Pos + Ball_Size;
	assign ball_x = Ball_X_Pos/16;
	assign ball_y = Ball_Y_Pos/16;

	deny_down_big 	#(.size_y(size_y), .size_x(size_x)) ddb (.down_constraint(down_constraint), .bottom(Ball_Bottom), .left(Ball_Left), .right(Ball_Right), .top(Ball_Top), .deny(no_down0));
	deny_up_big 	#(.size_y(size_y), .size_x(size_x)) dub (.up_constraint(up_constraint), .bottom(Ball_Bottom), .left(Ball_Left), .right(Ball_Right), .top(Ball_Top), .deny(no_up0));
	deny_left_big 	#(.size_y(size_y), .size_x(size_x)) dlb (.left_constraint(left_constraint), .bottom(Ball_Bottom), .left(Ball_Left), .right(Ball_Right), .top(Ball_Top), .deny(no_left0));
	deny_right_big 	#(.size_y(size_y), .size_x(size_x)) drb (.right_constraint(right_constraint), .bottom(Ball_Bottom), .left(Ball_Left), .right(Ball_Right), .top(Ball_Top), .deny(no_right0));
	
	always_comb
	begin
		no_up = ( Ball_Top <= Ball_Y_Min + 1'b1 ? 1'b1 | no_up0 : no_up0 );
		no_left = ( Ball_Left <= Ball_X_Min + 1'b1 ? 1'b1 | no_left0 : no_left0 );
		no_down = ( Ball_Top >= Ball_Y_Max ? 1'b1 | no_down0 : no_down0 );
		no_right = ( Ball_Right >= Ball_X_Max ? 1'b1 | no_right0 : no_right0 );
	end
	
	always_ff @ (posedge Reset or posedge Clk )
	begin: Ball_Motion_1
		if (Reset) // Asynchronous Reset
			Ball_Y_Motion <= 10'd0;
		else if (~game_ready)
		begin
			Ball_Y_Motion <= 10'd0;
		end
		else
		begin
			unique case (Keycode)
				8'd26 : // W
				begin			
					if ( no_up )
						Ball_Y_Motion <= 0;
					else
						Ball_Y_Motion <= (~(Ball_Y_Step) + 1'b1);
				end
				
				8'd22 : // S
				begin
					if ( no_down )
						Ball_Y_Motion <= 0;
					else
						Ball_Y_Motion <= Ball_Y_Step;							
				end
				default: // no key
				begin
					Ball_Y_Motion <= 0;
				end
			endcase
		end
	end
	
	always_ff @ (posedge Reset or posedge Clk )
	begin: Ball_Motion_2
		if (Reset) // Asynchronous Reset
			Ball_X_Motion <= 10'd0;
		else if (~game_ready)
		begin
			Ball_X_Motion <= 10'd0;
		end
		else
		begin
			unique case (Keycode)
				8'd04 : // A
				begin
					if ( no_left )
						Ball_X_Motion <= 0;
					else
						Ball_X_Motion <= (~(Ball_X_Step) + 1'b1);
				end
				
				8'd07 : // D
				begin
					if ( no_right )
						Ball_X_Motion <= 0;
					else
						Ball_X_Motion <= Ball_X_Step;
				end
				default: // no key
				begin
					Ball_X_Motion <= 0;
				end
			endcase
		end
	end
	
	always_ff @ (posedge Reset or posedge frame_clk)
	begin: Update_Pos
		if (Reset)
		begin
			Ball_Y_Pos <= Ball_Y_Center;
			Ball_X_Pos <= Ball_X_Center;
		end
		else
		begin
			Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion); // Update ball position
			Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
		end
	end
	  
	assign BallX = Ball_X_Pos;
  
	assign BallY = Ball_Y_Pos;
  
	assign BallS = Ball_Size;

endmodule
