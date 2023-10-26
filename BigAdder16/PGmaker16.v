module PGmaker16 
(
	input  [15:0] a,
	input  [15:0] b,
	output [15:0] p,
	output [15:0] g
);
	
assign p = a | b;
assign g = a & b;

endmodule