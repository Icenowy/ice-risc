module top(
    input wire iwClk100M,
    input wire [15:0]iwSw,
    input wire iwKey,
    output wire [6:0] ownSeg,
    output wire [3:0] ownAn
);

wire [31:0]wRead1Addr;
wire [31:0]wRead2Addr;
wire [31:0]wWriteAddr;
wire [31:0]wWriteData;
wire [3:0]wWstrb;

wire [31:0]wRead1Data;
wire [31:0]wRead2Data;
wire [31:0]wLastData;

wire wnRst = ~iwSw[0];

wire wNewClk;

reg [3:0]rData[0:3];

key_debouncer mKeyDebouncer(iwClk100M, wnRst, iwKey, wNewClk);

digital_display_driver mDisplayDriver(iwClk100M, wnRst, rData[0], rData[1], rData[2], rData[3], ownSeg, ownAn);

simple_memory mSimMemory(wNewClk, wnRst, wRead1Addr, wRead2Addr, wWriteAddr, wWriteData, wWstrb, wRead1Data, wRead2Data, wLastData);

ice_risc_rv mIceRiscRV(wNewClk, wnRst, wRead1Addr, wRead2Addr, wWriteAddr, wWriteData, wWstrb, wRead1Data, wRead2Data);

always @(iwSw[14] or iwSw[15] or mIceRiscRV.mMainControlUnit.wNextPc or
    mIceRiscRV.mMainControlUnit.wPc or mIceRiscRV.mMainControlUnit.wReadReg1Value or
    mIceRiscRV.mMainControlUnit.wReadReg1 or
    mIceRiscRV.mMainControlUnit.wReadReg2Value or
    mIceRiscRV.mMainControlUnit.wReadReg2 or
    mIceRiscRV.mMainControlUnit.wWriteRegValue or
    mIceRiscRV.mMainControlUnit.wAluResult) begin
    if (iwSw[15:14] == 2'b00) begin
        rData[0] = mIceRiscRV.mMainControlUnit.wNextPc[3:0];
        rData[1] = mIceRiscRV.mMainControlUnit.wNextPc[7:4];
        rData[2] = mIceRiscRV.mMainControlUnit.wPc[3:0];
        rData[3] = mIceRiscRV.mMainControlUnit.wPc[7:4];
    end else if (iwSw[15:14] == 2'b01) begin
        rData[0] = mIceRiscRV.mMainControlUnit.wReadReg1Value[3:0];
        rData[1] = mIceRiscRV.mMainControlUnit.wReadReg1Value[7:4];
        rData[2] = mIceRiscRV.mMainControlUnit.wReadReg1[3:0];
        rData[3] = {3'b0, mIceRiscRV.mMainControlUnit.wReadReg1[4]};
    end else if (iwSw[15:14] == 2'b10) begin
        rData[0] = mIceRiscRV.mMainControlUnit.wReadReg2Value[3:0];
        rData[1] = mIceRiscRV.mMainControlUnit.wReadReg2Value[7:4];
        rData[2] = mIceRiscRV.mMainControlUnit.wReadReg2[3:0];
        rData[3] = {3'b0, mIceRiscRV.mMainControlUnit.wReadReg2[4]};
    end else begin
        rData[0] = mIceRiscRV.mMainControlUnit.wWriteRegValue[3:0];
        rData[1] = mIceRiscRV.mMainControlUnit.wWriteRegValue[7:4];
        rData[2] = mIceRiscRV.mMainControlUnit.wAluResult[3:0];
        rData[3] = mIceRiscRV.mMainControlUnit.wAluResult[7:4];
    end
end

endmodule
