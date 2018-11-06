`include "config/tb_timescale.v"

module alu_tb();

reg [31:0]rA;
reg [31:0]rB;
reg [3:0]rAluOp;

wire [31:0]wX;
wire wZero;
wire wSign;

alu mToTest(rA, rB, rAluOp, wZero, wSign, wX);

initial begin
	$dumpfile("alu_tb.vcd");
        $dumpvars(0,alu_tb);
	rAluOp = 0;
	rA = 0;
	rB = 0;
	#4000
	$stop;
end

always begin
	#10
	rA = 32'd1234;
	rB = 32'd5678;
	#20
	rB = 32'd1234;
	#30
	rB = 32'd3;
	#40
	rA = 32'h82345671;
	#50
	rB = 32'h82345555;
	#60
	rB = 32'h83455555;
	#100
	rAluOp = rAluOp + 1;
end

endmodule
