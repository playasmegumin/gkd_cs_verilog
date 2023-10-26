`timescale 1ns / 1ps
module BigAdder_tb;

reg clk;
reg [15:0] Ai = 16'b1111000011110000;
reg [15:0] Bi = 16'b0000111100001111;
wire [15:0] Co;
wire [15:0] Sum;

BigAdder b1(
	.clk  (clk),
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
	Ai = 16'b1111000011110000;
	Bi = 16'b0000111100001111;
end

always
#5 clk = ~clk;

initial
begin
	#100
	Ai = 16'b1001001001001001;
	Bi = 16'b0111001110011100;
	#200 $finish;
end

endmodule