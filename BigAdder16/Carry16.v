module Carry16(
	input	[15:0] p_in,
	input	[15:0] g_in,
	input	c_in,
	output	[15:0] c_out,
	output	p_out,
	output	g_out
);

wire [3:0] p_inter;
wire [3:0] g_inter;
wire [3:0] c_back;

Carry4 carry4_0(
	.c_in 	(c_in),
	.p_in 	(p_in[3:0]),
	.g_in 	(g_in[3:0]),
	.p_out	(p_inter[0]),
	.g_out	(g_inter[0]),
	.c_out	(c_out[3:0])
);

Carry4 carry4_1(
	.c_in 	(c_back[1]),
	.p_in 	(p_in[7:4]),
	.g_in 	(g_in[7:4]),
	.p_out	(p_inter[1]),
	.g_out	(g_inter[1]),
	.c_out	(c_out[7:4])
);

Carry4 carry4_2(
	.c_in 	(c_back[2]),
	.p_in 	(p_in[11:8]),
	.g_in 	(g_in[11:8]),
	.p_out	(p_inter[2]),
	.g_out	(g_inter[2]),
	.c_out	(c_out[11:8])
);

Carry4 carry4_3(
	.c_in 	(c_back[3]),
	.p_in 	(p_in[15:12]),
	.g_in 	(g_in[15:12]),
	.p_out	(p_inter[3]),
	.g_out	(g_inter[3]),
	.c_out	(c_out[15:12])
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