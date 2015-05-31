module random_word (
	input Clk,
	input [31:0] index,
	output logic[8*11-1:0] word,
	output logic [3:0] length
);
		
		

	logic [8*11-1:0] words [100:0] ='{"stancher", "shrubbery", "paramour", "conjugate", "adhesive", "propagating", "viler", 
									"reeducated", "trumpeting", "dirks", "tributaries", "chiffon", "nicest", "cinders", 
									"drizzle", "crackles", "transposing", "breakups", "changing", "spares", "gowns", "wangles", 
									"inculpates", "adverbial", "condominium", "uniformity", "lineups", "worries", "chilli", 
									"precipices", "foundry", "nostalgia", "reeducated", "meekness", "bratty", "steels", "dicker", 
									"impulsive", "eeriness", "distention", "precluded", "barbarian", "shovelful", "precipices", 
									"cruelest", "souths", "wicket", "musicology", "overgrowth", "appeased", "juxtaposing", 
									"transposing", "timber", "snowy", "buildings", "invigorated", "needle", "where", "paramour", 
									"livens", "corrupted", "twerp", "false", "malice", "resistance", "academic", "bivalve", 
									"theorize", "spoons", "saucepan", "spoons", "livens", "blowgun", "furtively", "barbarian", 
									"shied", "nostalgia", "bullet", "snowy", "resistance", "fleetest", "relatives", "seceding", 
									"booting", "spent", "shoveled", "singular", "ruffle", "diaries", "flaunting", "appeased", 
									"loopiest", "curvaceous", "underpay", "stancher", "honchos", "seceding", "boodles", "chiffon", 
									"derivatives", "mendicant"
								};
	
	
	assign word = words[index];
	
	always_comb
	begin
		if (word[87:80] > 0)
			length = 11;
		else if (word[79:72] > 0)
			length = 10;
		else if (word[71:64] > 0)
			length = 9;
		else if (word[63:56] > 0)
			length = 8;
		else if (word[55:48] > 0)
			length = 7;
		else if (word[47:40] > 0)
			length = 6;
		else if (word[39:32] > 0)
			length = 5;
		else if (word[31:24] > 0)
			length = 4;
		else if (word[23:16] > 0)
			length = 3;
		else if (word[15:8] > 0)
			length = 2;
		else if (word[7:0] > 0)
			length = 1;
		else
			length = 0;
	end

endmodule
