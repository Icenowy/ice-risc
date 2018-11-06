module instr_exec_rv(
	input wire iwnRst,

	input wire [31:0]iwInstr,
	input wire [31:0]iwPc,
	input wire [31:0]iwOldPc,

	output reg [5:0]orAluOp,
	output wire owAluBSrc,
	output wire [31:0]owAluBImmediate,
	output wire owBranchInverted,

	output wire [4:0]owReadReg1,
	output wire [4:0]owReadReg2,
	output wire [4:0]owWriteReg,
	output wire [1:0]owWriteRegSource,
	output reg [31:0]orWriteRegImmediate,

	output wire owDMemWrite,
	output wire owDMemSignExtend,
	output wire [1:0]owDMemAccess,

	output wire [1:0]owNextPcSrc,
	output wire [19:0]owNextPcImmediate20,
	output wire [11:0]owNextPcImmediate12,

	output reg ornIllegal
);

`include "macros/aluops.v"
`include "macros/opcodes_rv.v"
`include "macros/functions_rv.v"
`include "macros/control.v"
`include "macros/control_rv.v"

wire [4:0]wRs1;
wire [4:0]wRs2;
wire [4:0]wRd;

wire [19:0]wImmediate20;
wire [11:0]wImmediate12;
wire [11:0]wImmediate12SClass;

wire [6:0]wOpCode;
wire [2:0]wFunct3;
wire [6:0]wFunct7;

wire [31:0]wImmediate12Extended;
wire [31:0]wImmediate12SClassExtended;

instr_split_rv mSplitter(iwInstr, wRs1, wRs2, wRd, wImmediate20,
			 wImmediate12, wImmediate12SClass,
			 wOpCode, wFunct3, wFunct7);

sign_extend_12_32 mImmediate20SignExtend(wImmediate12, wImmediate12Extended);
sign_extend_12_32 mImmediate20SClassSignExtend(wImmediate12SClass,
					       wImmediate12SClassExtended);

assign owAluBSrc = (wOpCode == `RISCV_OPCODE_BRANCH ||
		    wOpCode == `RISCV_OPCODE_OP) ?
		   `ALU_B_SOURCE_REG : `ALU_B_SOURCE_IMMEDIATE;

assign owAluBImmediate = (wOpCode == `RISCV_OPCODE_LOAD ||
			  wOpCode == `RISCV_OPCODE_OP_IMM) ?
			 wImmediate12Extended :
			 ((wOpCode == `RISCV_OPCODE_STORE) ?
			  wImmediate12SClassExtended : 0);

assign owBranchInverted = (wFunct3 == `RISCV_FUNCT3_BRANCH_BNE ||
			   wFunct3 == `RISCV_FUNCT3_BRANCH_BGE ||
			   wFunct3 == `RISCV_FUNCT3_BRANCH_BGEU);

assign owReadReg1 = wRs1;
assign owReadReg2 = wRs2;
assign owWriteReg = (!ornIllegal) ? 0 :
		    ((wOpCode == `RISCV_OPCODE_LUI ||
		      wOpCode == `RISCV_OPCODE_AUIPC ||
		      wOpCode == `RISCV_OPCODE_JAL ||
		      wOpCode == `RISCV_OPCODE_JALR ||
		      wOpCode == `RISCV_OPCODE_LOAD ||
		      wOpCode == `RISCV_OPCODE_OP_IMM ||
		      wOpCode == `RISCV_OPCODE_OP) ? wRd : 0);

assign owWriteRegSource = (wOpCode == `RISCV_OPCODE_OP ||
			   wOpCode == `RISCV_OPCODE_OP_IMM) ?
			  `REG_SOURCE_ALU :
			  ((wOpCode == `RISCV_OPCODE_LOAD) ?
			   `REG_SOURCE_MEMORY : `REG_SOURCE_IMMEDIATE);

assign owNextPcImmediate20 = wImmediate20;
assign owNextPcImmediate12 = (wOpCode == `RISCV_OPCODE_BRANCH) ?
			     wImmediate12SClass : wImmediate12;

assign owNextPcSrc = (wOpCode == `RISCV_OPCODE_JAL) ?
		     `NEXT_PC_SRC_JAL :
		     ((wOpCode == `RISCV_OPCODE_JALR) ?
		      `NEXT_PC_SRC_JALR :
		      ((wOpCode == `RISCV_OPCODE_BRANCH) ?
		       `NEXT_PC_SRC_B : `NEXT_PC_SRC_SEQ));

assign owDMemWrite = (!ornIllegal) ? 0 : wOpCode == `RISCV_OPCODE_STORE;

assign owDMemSignExtended = wFunct3 == `RISCV_FUNCT3_LOAD_LB ||
			    wFunct3 == `RISCV_FUNCT3_LOAD_LW;

assign owDMemAccess = (wFunct3 == `RISCV_FUNCT3_LOAD_LB || // Also SB
		       wFunct3 == `RISCV_FUNCT3_LOAD_LBU) ?
		      `MEM_ACCESS_BYTE :
		      ((wFunct3 == `RISCV_FUNCT3_LOAD_LH || // Also SH
		        wFunct3 == `RISCV_FUNCT3_LOAD_LHU) ?
			`MEM_ACCESS_HALF_WORD : `MEM_ACCESS_WORD);

initial begin
	orAluOp = 0;

	ornIllegal = 1;

	orWriteRegImmediate = 0;
end

always @(iwnRst or iwInstr or wRd or wImmediate20 or wImmediate12 or wImmediate12SClass or wImmediate12Extended or wImmediate12SClassExtended or wOpCode or wFunct3 or wFunct7 or iwPc or iwOldPc) begin
	if (!iwnRst) begin
		orAluOp = 0;

		ornIllegal = 1;

		orWriteRegImmediate = 0;
	end else if (wOpCode == `RISCV_OPCODE_LUI) begin
		orAluOp = 0;

		orWriteRegImmediate = {wImmediate20, 12'h0};
	end else if (wOpCode == `RISCV_OPCODE_AUIPC) begin
		orAluOp = 0;

		orWriteRegImmediate = {wImmediate20, 12'h0} + iwOldPc;
	end else if (wOpCode == `RISCV_OPCODE_JAL) begin
		orAluOp = 0;

		orWriteRegImmediate = iwOldPc + 4;
	end else if (wOpCode == `RISCV_OPCODE_JALR &&
		     wFunct3 == `RISCV_FUNCT3_JALR) begin
		orAluOp = 0;

		orWriteRegImmediate = iwOldPc + 4;
	end else if (wOpCode == `RISCV_OPCODE_BRANCH) begin
		orWriteRegImmediate = 0;
		
		ornIllegal = 1;

		if (wFunct3 == `RISCV_FUNCT3_BRANCH_BEQ) begin
			orAluOp = `ALU_OP_EQ;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BNE) begin
			orAluOp = `ALU_OP_EQ;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BLT) begin
			orAluOp = `ALU_OP_SLT;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BGE) begin
			orAluOp = `ALU_OP_SLT;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BLTU) begin
			orAluOp = `ALU_OP_SLTU;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BGEU) begin
			orAluOp = `ALU_OP_SLTU;
		end else begin
			ornIllegal = 0;

			orAluOp = `ALU_OP_ADD;
		end
	end else if (wOpCode == `RISCV_OPCODE_LOAD) begin
		orWriteRegImmediate = 0;

		orAluOp = `ALU_OP_ADD;

		ornIllegal = 1;

		if (!(wFunct3 == `RISCV_FUNCT3_LOAD_LB ||
		      wFunct3 == `RISCV_FUNCT3_LOAD_LH ||
		      wFunct3 == `RISCV_FUNCT3_LOAD_LW ||
		      wFunct3 == `RISCV_FUNCT3_LOAD_LBU ||
		      wFunct3 == `RISCV_FUNCT3_LOAD_LHU))
			ornIllegal = 0;
	end else if (wOpCode == `RISCV_OPCODE_STORE) begin
		orWriteRegImmediate = 0;

		orAluOp = `ALU_OP_ADD;

		ornIllegal = 1;

		if (!(wFunct3 == `RISCV_FUNCT3_STORE_SB ||
		      wFunct3 == `RISCV_FUNCT3_STORE_SH ||
		      wFunct3 == `RISCV_FUNCT3_STORE_SW))
			ornIllegal = 0;
	end else if (wOpCode == `RISCV_OPCODE_OP_IMM) begin
		orWriteRegImmediate = 0;

		ornIllegal = 1;

		if (wFunct3 == `RISCV_FUNCT3_OP_IMM_ADDI) begin
			orAluOp = `ALU_OP_ADD;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_IMM_SLTI) begin
			orAluOp = `ALU_OP_SLT;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_IMM_SLTIU) begin
			orAluOp = `ALU_OP_SLTU;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_IMM_XORI) begin
			orAluOp = `ALU_OP_XOR;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_IMM_ORI) begin
			orAluOp = `ALU_OP_OR;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_IMM_ANDI) begin
			orAluOp = `ALU_OP_AND;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_IMM_SLLI &&
			     wFunct7 == `RISCV_FUNCT7_OP_IMM_SLLI) begin
			orAluOp = `ALU_OP_SLL;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_IMM_SRLI_SRAI &&
			     wFunct7 == `RISCV_FUNCT7_OP_IMM_SRLI) begin
			orAluOp = `ALU_OP_SRL;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_IMM_SRLI_SRAI &&
			     wFunct7 == `RISCV_FUNCT7_OP_IMM_SRAI) begin
			orAluOp = `ALU_OP_SRA;
		end else begin
			orAluOp = `ALU_OP_ADD;

			ornIllegal = 0;
		end
	end else if (wOpCode == `RISCV_OPCODE_OP) begin
		orWriteRegImmediate = 0;
		
		ornIllegal = 1;

		if (wFunct3 == `RISCV_FUNCT3_OP_ADD_SUB &&
		    wFunct7 == `RISCV_FUNCT7_OP_ADD) begin
			orAluOp = `ALU_OP_ADD;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_ADD_SUB &&
			     wFunct7 == `RISCV_FUNCT7_OP_SUB) begin
			orAluOp = `ALU_OP_SUB;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_SLL &&
			     wFunct7 == `RISCV_FUNCT7_OP_SLL) begin
			orAluOp = `ALU_OP_SLL;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_SLT &&
			     wFunct7 == `RISCV_FUNCT7_OP_SLT) begin
			orAluOp = `ALU_OP_SLT;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_SLTU &&
			     wFunct7 == `RISCV_FUNCT7_OP_SLTU) begin
			orAluOp = `ALU_OP_SLTU;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_XOR &&
			     wFunct7 == `RISCV_FUNCT7_OP_XOR) begin
			orAluOp = `ALU_OP_XOR;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_SRL_SRA &&
			     wFunct7 == `RISCV_FUNCT7_OP_SRL) begin
			orAluOp = `ALU_OP_SRL;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_SRL_SRA &&
			     wFunct7 == `RISCV_FUNCT7_OP_SRA) begin
			orAluOp = `ALU_OP_SRA;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_OR &&
			     wFunct7 == `RISCV_FUNCT7_OP_OR) begin
			orAluOp = `ALU_OP_OR;
		end else if (wFunct3 == `RISCV_FUNCT3_OP_AND &&
			     wFunct7 == `RISCV_FUNCT7_OP_AND) begin
			orAluOp = `ALU_OP_AND;
		end else begin
			orAluOp = `ALU_OP_ADD;

			ornIllegal = 0;
		end
	end else begin
		orAluOp = 0;

		orWriteRegImmediate = 0;

		ornIllegal = 0;
	end
end
endmodule
