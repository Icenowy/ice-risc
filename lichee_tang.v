module lichee_tang(
	input wire iwClk24M,
	input wire iwnRst,

	output wire [2:0]owLeds
);

wire [31:0]wRead1Addr;
wire [31:0]wRead2Addr;
wire [31:0]wWriteAddr;
wire [31:0]wWriteData;
wire [3:0]wWstrb;

wire [31:0]wRead1Data;
wire [31:0]wRead2Data;

wire [31:0]wInternalLeds;

assign owLeds = wInternalLeds[2:0];

simple_memory mSimpleMemory(iwClk24M, iwnRst, wRead1Addr, wRead2Addr, wWriteAddr, wWriteData, wWstrb, wRead1Data, wRead2Data, wInternalLeds);

ice_risc_rv mIceRiscRV(iwClk24M, iwnRst, wRead1Addr, wRead2Addr, wWriteAddr, wWriteData, wWstrb, wRead1Data, wRead2Data);

endmodule
