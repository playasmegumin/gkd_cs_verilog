module SmallAdder
(
	input  c_in,
	input  clk,
	input  [3:0] p_in,
	input  [3:0] g_in,
	output reg [3:0] c_out,
	output reg p_out,
	output reg g_out
);

always@(posedge clk) begin
	p_out 		<= p_in[3] & p_in[2] & p_in[1] & p_in[0];
	g_out		<= g_in[3] | (p_in[3]&g_in[2]) | (p_in[3]&p_in[2]&g_in[1]) | (p_in[3]&p_in[2]&p_in[1]&g_in[0]);
	c_out[0] 	<= c_in;
	c_out[1] 	<= g_in[0] |      	    (p_in[0]&c_in);
	c_out[2] 	<= g_in[1] |      	 (p_in[1]&g_in[0]) |      	 (p_in[1]&p_in[0]&c_in);
	c_out[3] 	<= g_in[2] | (p_in[2]&p_in[1]&g_in[0]) | (p_in[2]&p_in[1]&p_in[0]&c_in);
end

endmodule