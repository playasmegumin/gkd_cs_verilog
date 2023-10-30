module BigAdder(
	input	[15:0] a_in,
	input	[15:0] b_in,
	output	[15:0] c_out,
	output	[15:0] So
);

wire [15:0] p_in = a_in | b_in;  // 这里是所有p和g的产生
wire [15:0] g_in = a_in & b_in;  // 这里处理成内部线路，将a、b作为整个模块的输入

wire [3:0] Po;
wire [3:0] Go;
wire [3:0] c_back;

assign So = a_in ^ b_in ^ c_out;

Carry4 carry4_0(
	.c_in 	(1'b0),
	.p_in 	(p_in[3:0]),
	.g_in 	(g_in[3:0]),
	.p_out	(Po[0]),
	.g_out	(Go[0]),
	.c_out	(c_out[3:0])
);

Carry4 carry4_1(
	.c_in 	(c_back[1]),
	.p_in 	(p_in[7:4]),
	.g_in 	(g_in[7:4]),
	.p_out	(Po[1]),
	.g_out	(Go[1]),
	.c_out	(c_out[7:4])
);

Carry4 carry4_2(
	.c_in 	(c_back[2]),
	.p_in 	(p_in[11:8]),
	.g_in 	(g_in[11:8]),
	.p_out	(Po[2]),
	.g_out	(Go[2]),
	.c_out	(c_out[11:8])
);

Carry4 carry4_3(
	.c_in 	(c_back[3]),
	.p_in 	(p_in[15:12]),
	.g_in 	(g_in[15:12]),
	.p_out	(Po[3]),
	.g_out	(Go[3]),
	.c_out	(c_out[15:12])
);

Carry4 carry4__Upper(
	.c_in 	(a_in[0] & b_in[0]),
	.p_in 	(Po),
	.g_in 	(Go),
	.p_out	(),
	.g_out	(),
	.c_out	(c_back[3:0])
);

endmodule