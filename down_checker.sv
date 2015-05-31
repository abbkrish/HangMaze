module down_checker (
					input current_block, above_block,
					output constrain
);

	// if the current block exists, we are checking to see if it has a neighbor above. 
	// if not does not, that means the character cannot move past the current block in the downward direction
	assign constrain = ( current_block & ~above_block ? 1'b1 : 1'b0 );
		
endmodule
