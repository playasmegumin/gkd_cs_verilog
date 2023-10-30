module BigAdder64(
	input	[63:0] a_in,
	input 	[63:0] b_in,
	output	[63:0] c_out,
	output 	[63:0] s_out
);

wire [63:0] p_in = a_in | b_in;
wire [63:0] g_in = a_in & b_in;

assign s_out = a_in ^ b_in ^ c_out;

Carry64 cr64(
	.c_in (1'b0),
	.p_in (p_in),
	.g_in (g_in),
	.p_out(),
	.g_out(),
	.c_out(c_out)
);

endmodule