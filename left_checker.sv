module left_checker (
					input current_block, right_block,
					output constrain
);

	// if the current block exists, we are checking to see if it has a neighbor to the right. 
	// if not does not, that means the character cannot move past the current block in the leftward direction
	assign constrain = ( current_block & ~right_block ? 1'b1 : 1'b0 );
		
endmodule
