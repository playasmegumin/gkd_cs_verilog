`timescale 1ns / 1ps
module BigAdder64_tb;

reg clk;
reg [63:0] Ai = 64'hFFFF0000FFFF0000;
reg [63:0] Bi = 64'h0000FFFF0000FFFF;
wire [63:0] Co;
wire [63:0] Sum;

BigAdder64 b1(
	.a_in (Ai),
	.b_in (Bi),
	.c_out(Co),
	.s_out(Sum)
);

initial
begin 
	$dumpfile("wave.vcd");
	$dumpvars(0, BigAdder64_tb);
end

initial
begin
	clk = 0;
	Ai = 64'hF0F0F0F0F0F0F0F0;
	Bi = 64'h0F0F0F0F0F0F0F0F;
	#50
	Ai = 64'hE2A1E2A1E2A1E2A1;
	Bi = 64'hDEADBEAF00000000;
	#50
	Ai = 64'h1E3B1E3B1E3B1E3B;
	Bi = 64'h0000DEADBEAF0000;
	#50
	Ai = 64'h2AFB2AFB2AFB2AFB;
	Bi = 64'hFEFEFEFEFEFEFEFE;
	#50
	Ai = 64'h01234567890B0000;
	Bi = 64'h9876543210060000;
	#50 $finish;

end

always
#5 clk = ~clk;

endmodule