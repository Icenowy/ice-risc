module control_rv(
	input wire iwClk,
	input wire iwnRst,

	output wire [31:0]owRead1Addr,
	output wire [31:0]owRead2Addr,
	output wire [31:0]owWriteAddr,
	output wire [31:0]owWriteData,
	output wire [3:0]owWstrb,

	input wire [31:0]iwRead1Data,
	input wire [31:0]iwRead2Data,

	output reg rnHalt
);

`include "macros/control.v"
`include "macros/control_rv.v"

wire [31:0]wPc;
wire [31:0]wOldPc;
wire wPcUpdate;

wire [31:0]wInstruction;

wire [3:0]wAluOp;
wire wAluBSrc;
wire [31:0]wAluBImmediate;
wire wBranchInverted;
wire wAluZero;
wire wAluSign;
wire [31:0]wAluA;
wire [31:0]wAluB;
wire [31:0]wAluResult;

wire [4:0]wReadReg1;
wire [4:0]wReadReg2;
wire [4:0]wWriteReg;
wire wRegWriteEnable;
wire [1:0]wWriteRegSource;
wire [31:0]wWriteRegImmediate;
wire [31:0]wWriteRegValue;
wire [31:0]wReadReg1Value;
wire [31:0]wReadReg2Value;

wire wDMemWrite;
wire wDMemSignExtend;
wire [1:0]wDMemAccess;

wire [1:0]wNextPcSrc;
reg [1:0]rNextPcSrc;
wire [19:0]wNextPcImmediate20;
wire [11:0]wNextPcImmediate12;
wire wBranchStatus;

wire wnIllegal;

wire [31:0]wNextPc;

wire [31:0]wReadDMemData;
wire [31:0]wReadDMemResult;

wire wnStall;

alu mAlu(wAluA, wAluB, wAluOp, wAluZero, wAluSign, wAluResult);

regfile_32 mRegFile(iwClk, iwnRst, wRegWriteEnable, wReadReg1, wReadReg2,
		    wWriteReg, wReadReg1Value, wReadReg2Value, wWriteRegValue);

next_pc_rv mNextPc(rNextPcSrc, wPc, wReadReg1Value, wNextPcImmediate20,
		   wNextPcImmediate12, wBranchStatus, wNextPc);

pc mPc(iwClk, iwnRst, wPcUpdate, wNextPc, wPc, wOldPc);

sub_word_d_mem_read_rv mSubWordRead(wReadDMemData, owRead2Addr, wDMemAccess,
				    wDMemSignExtend, wReadDMemResult);

instr_decode_rv mInstrDec(iwnRst, wInstruction, wOldPc, wAluOp, wAluBSrc,
			  wAluBImmediate, wBranchInverted, wReadReg1,
			  wReadReg2, wWriteReg, wWriteRegSource,
			  wWriteRegImmediate, wDMemWrite, wDMemSignExtend,
			  wDMemAccess, wNextPcSrc, wNextPcImmediate20,
			  wNextPcImmediate12, wnIllegal);

assign wPcUpdate = wnStall;

assign wAluA = wReadReg1Value;
assign wAluB = (wAluBSrc == `ALU_B_SOURCE_REG ) ?
	       wReadReg2Value : wAluBImmediate;

assign wWriteRegValue = (wWriteRegSource == `REG_SOURCE_ALU) ? wAluResult :
			((wWriteRegSource == `REG_SOURCE_MEMORY) ?
			 wReadDMemResult : wWriteRegImmediate);

assign wBranchStatus = (~wAluZero) ^ wBranchInverted;

assign wnStall = rnHalt;

assign wRegWriteEnable = wnStall;

assign owRead1Addr = wPc;
assign owRead2Addr = {wAluResult[31:2], 2'b00};
assign wReadDMemData = iwRead2Data;

assign owWriteAddr = wAluResult;
assign owWriteData = wReadReg2Value;
assign owWstrb = (!wDMemWrite) ? 0 : 
		 ((wDMemAccess == `MEM_ACCESS_BYTE) ? 4'b0001 :
		  ((wDMemAccess == `MEM_ACCESS_HALF_WORD) ? 4'b0011 : 4'b1111));

assign wInstruction = iwRead1Data;

initial begin
	rnHalt <= 1;
end

always @(negedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		rNextPcSrc <= `NEXT_PC_SRC_SEQ;
		rnHalt <= 1;
	end else begin
		rNextPcSrc <= wNextPcSrc;
		rnHalt <= wnIllegal;
	end
end

endmodule
