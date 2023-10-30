module Carry4(
	input  c_in,
	input  [3:0] p_in,
	input  [3:0] g_in,
	output [3:0] c_out,
	output p_out,
	output g_out
);

assign p_out 	= p_in[3] & p_in[2] & p_in[1] & p_in[0];
assign g_out	= g_in[3] | (p_in[3]&g_in[2]) | (p_in[3]&p_in[2]&g_in[1]) | (p_in[3]&p_in[2]&p_in[1]&g_in[0]);
assign c_out[0] = c_in;
// c[1] = g[0] | (p[0]&c[0])
assign c_out[1] = g_in[0] | (p_in[0]&c_in);
// c[2] = g[1] | (p[1]&g[0]) | (p[1]&p[0]&c[0])
assign c_out[2] = g_in[1] |      	 (p_in[1]&g_in[0]) |      	 (p_in[1]&p_in[0]&c_in);
// c[3] = g[2] | (p[2]&g[1]) | (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&c[0])
assign c_out[3] = g_in[2] | (p_in[2]&g_in[1]) | (p_in[2]&p_in[1]&g_in[0]) | (p_in[2]&p_in[1]&p_in[0]&c_in);

endmodule