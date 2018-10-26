`include "config/tb_timescale.v"

module sim();

wire [31:0]wRead1Addr;
wire [31:0]wRead2Addr;
wire [31:0]wWriteAddr;
wire [31:0]wWriteData;
wire [3:0]wWstrb;

wire [31:0]wRead1Data;
wire [31:0]wRead2Data;
wire [31:0]wLastData;

reg rClk;
reg rnRst;

sim_memory mSimMemory(rClk, rnRst, wRead1Addr, wRead2Addr, wWriteAddr, wWriteData, wWstrb, wRead1Data, wRead2Data, wLastData);

ice_risc_rv mIceRiscRV(rClk, rnRst, wRead1Addr, wRead2Addr, wWriteAddr, wWriteData, wWstrb, wRead1Data, wRead2Data);

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
