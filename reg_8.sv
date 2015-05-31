module reg_8 (
					input							En, Clk, Reset,
					input 			[7:0]		In,
					output logic	[7:0]		Out
					);

	d_flip_flop dff0 ( .Clk(Clk), .D(In[0]), .Reset(Reset), .En(En), .Q(Out[0]) );
	d_flip_flop dff1 ( .Clk(Clk), .D(In[1]), .Reset(Reset), .En(En), .Q(Out[1]) );
	d_flip_flop dff2 ( .Clk(Clk), .D(In[2]), .Reset(Reset), .En(En), .Q(Out[2]) );
	d_flip_flop dff3 ( .Clk(Clk), .D(In[3]), .Reset(Reset), .En(En), .Q(Out[3]) );
	d_flip_flop dff4 ( .Clk(Clk), .D(In[4]), .Reset(Reset), .En(En), .Q(Out[4]) );
	d_flip_flop dff5 ( .Clk(Clk), .D(In[5]), .Reset(Reset), .En(En), .Q(Out[5]) );
	d_flip_flop dff6 ( .Clk(Clk), .D(In[6]), .Reset(Reset), .En(En), .Q(Out[6]) );
	d_flip_flop dff7 ( .Clk(Clk), .D(In[7]), .Reset(Reset), .En(En), .Q(Out[7]) );

endmodule
