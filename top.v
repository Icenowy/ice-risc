module top(
    input wire iwClk24M,
    input wire iwnKey,
    output wire [2:0]ownLed
);

wire [31:0]wReadAddr;
wire [31:0]wWriteAddr;
wire [31:0]wWriteData;
wire [3:0]wWstrb;

wire [31:0]wReadData;
wire [31:0]wLastData;

wire wnRst = iwnKey;

wire wNewClk;

assign wNewClk = iwClk24M;

bram_memory mSimMemory(wNewClk, wnRst, wReadAddr, wWriteAddr, wWriteData, wWstrb, wReadData, wLastData);

ice_risc_rv mIceRiscRV(wNewClk, wnRst, wReadAddr, wWriteAddr, wWriteData, wWstrb, wReadData);

assign ownLed = ~wLastData[2:0];

endmodule
