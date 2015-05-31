module up_checker (
					input current_block, below_block,
					output constrain
);

	// if the current block exists, we are checking to see if it has a neighbor below. 
	// if not does not, that means the character cannot move past the current block in the upward direction
	assign constrain = ( current_block & ~below_block ? 1'b1 : 1'b0 );
		
endmodule
