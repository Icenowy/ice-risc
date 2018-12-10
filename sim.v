`include "config/tb_timescale.v"

module sim();

wire [31:0]wReadAddr;
wire [31:0]wWriteAddr;
wire [31:0]wWriteData;
wire [3:0]wWstrb;

wire [31:0]wReadData;
wire [31:0]wLastData;

reg rClk;
reg rnRst;

last_word_memory mSimMemory(rClk, rnRst, wReadAddr, wWriteAddr, wWriteData, wWstrb, wReadData, wLastData);

ice_risc_rv #(
	.pMemReadWait(1)
)mIceRiscRV(rClk, rnRst, wReadAddr, wWriteAddr, wWriteData, wWstrb, wReadData);

initial begin
	$dumpfile("sim.vcd");
        $dumpvars(0,sim);
	rClk = 1;
	rnRst = 1;
	#10
	rnRst = 0;
	#50
	rnRst = 1;
	#100000
	$stop;
end

always begin
	#10
	rClk = ~rClk;
end

endmodule
