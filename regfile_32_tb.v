`include "config/tb_timescale.v"
module regfile_32_tb();

reg rnRst;
reg rClk;
reg [31:0]rData3;
reg [4:0]rReg1;
reg [4:0]rReg2;
reg [4:0]rReg3;
reg rWriteEnable;

wire [31:0]wData1;
wire [31:0]wData2;

regfile_32 mToTest(rClk, rnRst, rWriteEnable, rReg1, rReg2, rReg3, wData1, wData2, rData3);

initial begin
	$dumpfile("regfile_32_tb.vcd");
        $dumpvars(0,regfile_32_tb);
	rClk = 1'b0;
	rnRst = 1'b1;
	rWriteEnable = 1'b0;
	#10
	rnRst = 1'b0;
	#100
	rnRst = 1'b1;
	#300
	rData3 = 32'd1234;
	rReg3 = 5'd7;
	rWriteEnable = 1'b1;
	#400
	rData3 = 32'd5678;
	rReg3 = 5'd6;
	#500
	rData3 = 32'd3333;
	rReg3 = 5'd0;
	#600
	rReg1 = 5'd7;
	rReg2 = 5'd6;
	rWriteEnable = 1'b0;
	#700
	rReg1 = 5'd0;
	#800
	$stop;
end

always begin
	#10
	rClk = ~rClk;
end

endmodule
