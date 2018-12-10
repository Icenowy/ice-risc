module top(
    input wire iwClk50M,
    input wire iwnKey,
    output wire [7:0]owLed
);

wire [31:0]wReadAddr;
wire [31:0]wWriteAddr;
wire [31:0]wWriteData;
wire [3:0]wWstrb;

wire [31:0]wReadData;
wire [31:0]wLastData;

wire wnRst = iwnKey;

wire wNewClk;

clock_divider #(
	.pFactor(32'd2)
)mClockDivider(iwClk50M, wnRst, wNewClk);

simple_memory mSimMemory(wNewClk, wnRst, wReadAddr, wWriteAddr, wWriteData, wWstrb, wReadData, wLastData);

ice_risc_rv mIceRiscRV(wNewClk, wnRst, wReadAddr, wWriteAddr, wWriteData, wWstrb, wReadData);

assign owLed = wLastData[7:0];

endmodule
