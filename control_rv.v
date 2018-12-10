module control_rv#(
	parameter pMemReadWait = 1'b1
)(
	input wire iwClk,
	input wire iwnRst,

	output reg [31:0]orReadAddr,
	output wire [31:0]owWriteAddr,
	output wire [31:0]owWriteData,
	output wire [3:0]owWstrb,

	input wire [31:0]iwReadData,

	output reg rnHalt
);

`include "macros/control.v"

wire [31:0]wPc;
wire [31:0]wOldPc;
wire wPcUpdate;

reg [31:0]rInstruction;

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
wire [19:0]wNextPcImmediate20;
wire [11:0]wNextPcImmediate12;
wire wBranchStatus;

wire wnIllegal;

wire [31:0]wNextPc;

wire [31:0]wReadDMemData;
wire [31:0]wReadDMemResult;

wire wExePresent;
wire wMemPresent;
wire wMemReadWaitPresent;
wire wWbPresent;

wire wnStall;

wire [31:0]wReadDMemAddr;

reg [2:0]rState;
reg [2:0]rStateNext;

reg [31:0]rAluResult;
reg [31:0]rReadReg1Value;
reg [31:0]rReadReg2Value;
reg [31:0]rReadData;

alu mAlu(wAluA, wAluB, wAluOp, wAluZero, wAluSign, wAluResult);

regfile_32 mRegFile(iwClk, iwnRst, wRegWriteEnable, wReadReg1, wReadReg2,
		    wWriteReg, wReadReg1Value, wReadReg2Value, wWriteRegValue);

next_pc_rv mNextPc(wNextPcSrc, wPc, rReadReg1Value, wNextPcImmediate20,
		   wNextPcImmediate12, wBranchStatus, wNextPc);

pc mPc(iwClk, iwnRst, wPcUpdate, wNextPc, wPc, wOldPc);

sub_word_d_mem_read_rv mSubWordRead(wReadDMemData, wReadDMemAddr, wDMemAccess,
				    wDMemSignExtend, wReadDMemResult);

instr_decode_rv mInstrDec(iwnRst, rInstruction, wPc, wAluOp, wAluBSrc,
			  wAluBImmediate, wBranchInverted, wReadReg1,
			  wReadReg2, wWriteReg, wWriteRegSource,
			  wWriteRegImmediate, wDMemWrite, wDMemSignExtend,
			  wDMemAccess, wNextPcSrc, wNextPcImmediate20,
			  wNextPcImmediate12, wExePresent, wMemPresent,
			  wMemReadWaitPresent, wWbPresent, wnIllegal);

assign wPcUpdate = wnStall && rStateNext == `STATE_IF;

assign wAluA = rReadReg1Value;
assign wAluB = (wAluBSrc == `ALU_B_SOURCE_REG ) ?
	       rReadReg2Value : wAluBImmediate;

assign wWriteRegValue = (wWriteRegSource == `REG_SOURCE_ALU) ? rAluResult :
			((wWriteRegSource == `REG_SOURCE_MEMORY) ?
			 wReadDMemResult : wWriteRegImmediate);

assign wBranchStatus = (~wAluZero) ^ wBranchInverted;

assign wnStall = rnHalt;

assign wRegWriteEnable = wnStall && (rState == `STATE_WB || (rState == `STATE_ID && wWriteRegSource == `REG_SOURCE_IMMEDIATE));

assign wReadDMemAddr = {wAluResult[31:2], 2'b00};
assign wReadDMemData = rReadData;

assign owWriteAddr = rAluResult;
assign owWriteData = rReadReg2Value;
assign owWstrb = (!(wDMemWrite && rState == `STATE_MEM)) ? 0 : 
		 ((wDMemAccess == `MEM_ACCESS_BYTE) ? 4'b0001 :
		  ((wDMemAccess == `MEM_ACCESS_HALF_WORD) ? 4'b0011 : 4'b1111));

initial begin
	rInstruction <= 32'h00000013; /* Normalized NOP */
	rnHalt <= 1;
	rState <= `STATE_IF;
	rStateNext <= `STATE_IF;
end

always @(posedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		rState <= `STATE_IF;
		rStateNext <= `STATE_IF;
	end else begin
		if (wnStall) begin
			rState <= rStateNext;
			if (rStateNext == `STATE_IF)
				orReadAddr <= wNextPc;
			if (rStateNext == `STATE_MEM)
				orReadAddr <= {wAluResult[31:2], 2'b00};
			case (rStateNext)
			`STATE_IF: 
				if (pMemReadWait) begin
					rStateNext <= `STATE_IF_READ_WAIT;
				end else begin
					rStateNext <= `STATE_ID;
				end
			`STATE_IF_READ_WAIT:
				rStateNext <= `STATE_ID;
			`STATE_ID: rStateNext <= wExePresent ? `STATE_EXE :
						 (wMemPresent ? `STATE_MEM :
						  (wWbPresent ? `STATE_WB :
						   `STATE_IF));
			`STATE_EXE: rStateNext <= wMemPresent ? `STATE_MEM :
						  (wWbPresent ? `STATE_WB :
						  `STATE_IF);
			`STATE_MEM:
				if (pMemReadWait) begin
					rStateNext <= wMemReadWaitPresent ?
						      `STATE_MEM_READ_WAIT :
						      (wWbPresent ? `STATE_WB :
						       `STATE_IF);
				end else begin
					rStateNext <= wWbPresent ? `STATE_WB :
						      `STATE_IF;
				end
			`STATE_MEM_READ_WAIT:
				rStateNext <= wWbPresent ? `STATE_WB : `STATE_IF;
			`STATE_WB: rStateNext <= `STATE_IF;
			default: rStateNext <= `STATE_IF;
			endcase
			rReadReg1Value <= wReadReg1Value;
			rReadReg2Value <= wReadReg2Value;
		end else begin
			rStateNext <= rState;
		end
	end
end

always @(negedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		rInstruction <= 32'h00000013; /* Normalized NOP */
		rnHalt <= 1;
	end else begin
		if (rState == `STATE_IF && !pMemReadWait)
			rInstruction <= iwReadData;
		if (rState == `STATE_IF_READ_WAIT)
			rInstruction <= iwReadData;
		if (rState == `STATE_ID && rnHalt)
			rnHalt <= wnIllegal;
		if (rState == `STATE_EXE)
			rAluResult <= wAluResult;
		if (rState == `STATE_MEM && !pMemReadWait)
			rReadData <= iwReadData;
		if (rState == `STATE_MEM_READ_WAIT)
			rReadData <= iwReadData;
	end
end

endmodule
