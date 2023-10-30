`timescale 1ns / 1ps
module BigAdder_tb;

reg clk;
reg [15:0] Ai = 16'b1111000011110000;
reg [15:0] Bi = 16'b0000111100001111;
wire [15:0] Co;
wire [15:0] Sum;

BigAdder b1(
	.a_in (Ai),
	.b_in (Bi),
	.c_out(Co),
	.So(Sum)
);

initial
begin 
	$dumpfile("wave.vcd");
	$dumpvars(0, BigAdder_tb);
end

initial
begin
	clk = 0;
	Ai = 16'hF0F0;
	Bi = 16'h0F0F;
	#50
	Ai = 16'hE2A1;
	Bi = 16'h1234;
	#50
	Ai = 16'h1E3B;
	Bi = 16'h2024;
	#50
	Ai = 16'h2AFB;
	Bi = 16'h0144;
	#50
	Ai = 16'h1234;
	Bi = 16'h8765;
	#50 $finish;
end

always
#5 clk = ~clk;

endmodule