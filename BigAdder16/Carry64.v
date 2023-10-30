module Carry64(
	input	[63:0] p_in,
	input	[63:0] g_in,
	input	c_in,
	output	[63:0] c_out,
	output	p_out,
	output	g_out
);

wire [3:0] p_inter;
wire [3:0] g_inter;
wire [3:0] c_back;

Carry16 carry16_0(
	.c_in 	(c_in),
	.p_in 	(p_in[15:0]),
	.g_in 	(g_in[15:0]),
	.p_out	(p_inter[0]),
	.g_out	(g_inter[0]),
	.c_out	(c_out[15:0])
);

Carry16 carry16_1(
	.c_in 	(c_back[1]),
	.p_in 	(p_in[31:16]),
	.g_in 	(g_in[31:16]),
	.p_out	(p_inter[1]),
	.g_out	(g_inter[1]),
	.c_out	(c_out[31:16])
);

Carry16 carry16_2(
	.c_in 	(c_back[2]),
	.p_in 	(p_in[47:32]),
	.g_in 	(g_in[47:32]),
	.p_out	(p_inter[2]),
	.g_out	(g_inter[2]),
	.c_out	(c_out[47:32])
);

Carry16 carry16_3(
	.c_in 	(c_back[3]),
	.p_in 	(p_in[63:48]),
	.g_in 	(g_in[63:48]),
	.p_out	(p_inter[3]),
	.g_out	(g_inter[3]),
	.c_out	(c_out[63:48])
);

Carry4 carry4_Upper(
	.c_in 	(c_in),
	.p_in 	(p_inter),
	.g_in 	(g_inter),
	.p_out	(p_out),
	.g_out	(g_out),
	.c_out	(c_back[3:0])
);

endmodule