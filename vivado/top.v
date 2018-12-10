module top(
    input wire iwClk100M,
    input wire [15:0]iwSw,
    input wire iwKey,
    output wire [6:0] ownSeg,
    output wire [3:0] ownAn
);

wire [31:0]wReadAddr;
wire [31:0]wWriteAddr;
wire [31:0]wWriteData;
wire [3:0]wWstrb;

wire [31:0]wReadData;
wire [31:0]wLastData;

wire wnRst = ~iwSw[0];

wire wNewClk;

wire [3:0]wData[0:3];

clock_divider #(
	.pFactor(32'd4)
)mClockDivider(iwClk100M, wnRst, wNewClk);

digital_display_driver mDisplayDriver(iwClk100M, wnRst, wData[0], wData[1], wData[2], wData[3], ownSeg, ownAn);

simple_memory mSimMemory(wNewClk, wnRst, wReadAddr, wWriteAddr, wWriteData, wWstrb, wReadData, wLastData);

ice_risc_rv mIceRiscRV(wNewClk, wnRst, wReadAddr, wWriteAddr, wWriteData, wWstrb, wReadData);

assign wData[0] = wLastData[3:0];
assign wData[1] = wLastData[7:4];
assign wData[2] = wLastData[15:8];
assign wData[3] = wLastData[19:16];

endmodule
