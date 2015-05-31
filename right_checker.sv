module right_checker (
					input current_block, left_block,
					output constrain
);

	// if the current block exists, we are checking to see if it has a neighbor to the left. 
	// if not does not, that means the character cannot move past the current block in the rightward direction
	assign constrain = ( current_block & ~left_block ? 1'b1 : 1'b0 );
		
endmodule
