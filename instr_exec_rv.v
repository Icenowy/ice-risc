module instr_exec_rv(
	input wire iwnRst,

	input wire [31:0]iwInstr,
	input wire [31:0]iwPc,
	input wire [31:0]iwOldPc,

	output reg [5:0]orAluOp,
	output reg orAluBSrc,
	output reg [31:0]orAluBImmediate,
	output reg orBranchInverted,

	output reg [4:0]orReadReg1,
	output reg [4:0]orReadReg2,
	output reg [4:0]orWriteReg,
	output reg [1:0]orWriteRegSource,
	output reg [31:0]orWriteRegImmediate,

	output reg orDMemWrite,
	output reg orDMemSignExtend,
	output reg [1:0]orDMemAccess,

	output reg [1:0]orNextPcSrc,
	output reg [19:0]orNextPcImmediate20,
	output reg [11:0]orNextPcImmediate12,

	output reg [3:0]orException
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

instr_decode_rv mDecoder(iwInstr, wRs1, wRs2, wRd, wImmediate20,
			 wImmediate12, wImmediate12SClass,
			 wOpCode, wFunct3, wFunct7);

sign_extend_12_32 mImmediate20SignExtend(wImmediate12, wImmediate12Extended);
sign_extend_12_32 mImmediate20SClassSignExtend(wImmediate12SClass,
					       wImmediate12SClassExtended);

initial begin
	orAluOp = 0;
	orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
	orAluBImmediate = 0;
	orBranchInverted = 0;

	orNextPcSrc = `NEXT_PC_SRC_SEQ;
	orNextPcImmediate20 = 0;
	orNextPcImmediate12 = 0;
	orException = `EXCEPTION_SUCCESS;

	orWriteRegSource = `REG_SOURCE_IMMEDIATE;
	orWriteReg = 0;
	orWriteRegImmediate = 0;
end

always @(iwnRst or iwInstr or wRs1 or wRs2 or wRd or wImmediate20 or wImmediate12 or wImmediate12SClass or wImmediate12Extended or wImmediate12SClassExtended or wOpCode or wFunct3 or wFunct7 or iwPc or iwOldPc) begin
	if (!iwnRst) begin
		orAluOp = 0;
		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = 0;
		orBranchInverted = 0;

		orNextPcSrc = `NEXT_PC_SRC_SEQ;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = 0;
		orException = `EXCEPTION_SUCCESS;

		orWriteRegSource = `REG_SOURCE_IMMEDIATE;
		orWriteReg = 0;
		orWriteRegImmediate = 0;

	end else if (wOpCode == `RISCV_OPCODE_LUI) begin
		orAluOp = 0;
		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = 0;
		orBranchInverted = 0;

		orWriteRegSource = `REG_SOURCE_IMMEDIATE;
		orWriteReg = wRd;
		orWriteRegImmediate = {wImmediate20, 12'h0};

		orNextPcSrc = `NEXT_PC_SRC_SEQ;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = 0;

		orDMemWrite = 0;
	end else if (wOpCode == `RISCV_OPCODE_AUIPC) begin
		orAluOp = 0;
		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = 0;
		orBranchInverted = 0;

		orWriteRegSource = `REG_SOURCE_IMMEDIATE;
		orWriteReg = wRd;
		orWriteRegImmediate = {wImmediate20, 12'h0} + iwPc;

		orNextPcSrc = `NEXT_PC_SRC_SEQ;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = 0;

		orDMemWrite = 0;
	end else if (wOpCode == `RISCV_OPCODE_JAL) begin
		orAluOp = 0;
		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = 0;
		orBranchInverted = 0;

		orWriteRegSource = `REG_SOURCE_IMMEDIATE;
		orWriteReg = wRd;
		orWriteRegImmediate = iwOldPc + 4;

		orNextPcSrc = `NEXT_PC_SRC_JAL;
		orNextPcImmediate20 = wImmediate20;
		orNextPcImmediate12 = 0;

		orDMemWrite = 0;
	end else if (wOpCode == `RISCV_OPCODE_JALR &&
		     wFunct3 == `RISCV_FUNCT3_JALR) begin
		orAluOp = 0;
		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = 0;
		orBranchInverted = 0;

		orWriteRegSource = `REG_SOURCE_IMMEDIATE;
		orWriteReg = wRd;
		orWriteRegImmediate = iwOldPc + 4;
		orReadReg1 = wRs1;

		orNextPcSrc = `NEXT_PC_SRC_JALR;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = wImmediate12;

		orDMemWrite = 0;
	end else if (wOpCode == `RISCV_OPCODE_BRANCH) begin
		orAluBImmediate = 0;

		orWriteRegSource = `REG_SOURCE_IMMEDIATE;
		orWriteReg = 0;
		orWriteRegImmediate = 0;
		orReadReg1 = wRs1;
		orReadReg2 = wRs2;
		
		orNextPcSrc = `NEXT_PC_SRC_B;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = wImmediate12SClass;
		
		orAluBSrc = `ALU_B_SOURCE_REG;

		orDMemWrite = 0;

		orException = `EXCEPTION_SUCCESS;

		if (wFunct3 == `RISCV_FUNCT3_BRANCH_BEQ) begin
			orAluOp = `ALU_OP_EQ;
			orBranchInverted = 0;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BNE) begin
			orAluOp = `ALU_OP_EQ;
			orBranchInverted = 1;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BLT) begin
			orAluOp = `ALU_OP_SLT;
			orBranchInverted = 0;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BGE) begin
			orAluOp = `ALU_OP_SLT;
			orBranchInverted = 1;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BLTU) begin
			orAluOp = `ALU_OP_SLTU;
			orBranchInverted = 0;
		end else if (wFunct3 == `RISCV_FUNCT3_BRANCH_BGEU) begin
			orAluOp = `ALU_OP_SLTU;
			orBranchInverted = 1;
		end else begin
			orException = `EXCEPTION_ILLEGAL_INSTR;

			orAluOp = `ALU_OP_ADD;
			orBranchInverted = 1;
		end
	end else if (wOpCode == `RISCV_OPCODE_LOAD) begin
		orBranchInverted = 0;

		orWriteRegSource = `REG_SOURCE_MEMORY;
		orWriteReg = wRd;
		orWriteRegImmediate = 0;
		orReadReg1 = wRs1;

		orNextPcSrc = `NEXT_PC_SRC_SEQ;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = 0;

		orAluOp = `ALU_OP_ADD;
		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = wImmediate12Extended;

		orDMemWrite = 0;

		orException = `EXCEPTION_SUCCESS;

		if (wFunct3 == `RISCV_FUNCT3_LOAD_LB) begin
			orDMemSignExtend = 1;
			orDMemAccess = `MEM_ACCESS_BYTE;
		end else if (wFunct3 == `RISCV_FUNCT3_LOAD_LH) begin
			orDMemSignExtend = 1;
			orDMemAccess = `MEM_ACCESS_HALF_WORD;
		end else if (wFunct3 == `RISCV_FUNCT3_LOAD_LW) begin
			orDMemSignExtend = 0;
			orDMemAccess = `MEM_ACCESS_WORD;
		end else if (wFunct3 == `RISCV_FUNCT3_LOAD_LBU) begin
			orDMemSignExtend = 0;
			orDMemAccess = `MEM_ACCESS_BYTE;
		end else if (wFunct3 == `RISCV_FUNCT3_LOAD_LHU) begin
			orDMemSignExtend = 0;
			orDMemAccess = `MEM_ACCESS_HALF_WORD;
		end else begin
			orWriteRegSource = `REG_SOURCE_IMMEDIATE;
			orWriteReg = 0;

			orException = `EXCEPTION_ILLEGAL_INSTR;
		end
	end else if (wOpCode == `RISCV_OPCODE_STORE) begin
		orBranchInverted = 0;

		orWriteRegSource = `REG_SOURCE_IMMEDIATE;
		orWriteReg = 0;
		orWriteRegImmediate = 0;
		orReadReg1 = wRs1;
		orReadReg2 = wRs2;

		orNextPcSrc = `NEXT_PC_SRC_SEQ;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = 0;

		orAluOp = `ALU_OP_ADD;
		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = wImmediate12SClassExtended;

		orDMemWrite = 1;

		orException = `EXCEPTION_SUCCESS;

		if (wFunct3 == `RISCV_FUNCT3_STORE_SB) begin
			orDMemAccess = `MEM_ACCESS_BYTE;
		end else if (wFunct3 == `RISCV_FUNCT3_STORE_SH) begin
			orDMemAccess = `MEM_ACCESS_HALF_WORD;
		end else if (wFunct3 == `RISCV_FUNCT3_STORE_SW) begin
			orDMemAccess = `MEM_ACCESS_WORD;
		end else begin
			orException = `EXCEPTION_ILLEGAL_INSTR;

			orDMemWrite = 0;
		end
	end else if (wOpCode == `RISCV_OPCODE_OP_IMM) begin
		orBranchInverted = 0;

		orWriteRegSource = `REG_SOURCE_ALU;
		orWriteReg = wRd;
		orWriteRegImmediate = 0;
		orReadReg1 = wRs1;

		orNextPcSrc = `NEXT_PC_SRC_SEQ;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = 0;

		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = wImmediate12Extended;

		orDMemWrite = 0;

		orException = `EXCEPTION_SUCCESS;

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

			orWriteRegSource = `REG_SOURCE_IMMEDIATE;
			orWriteReg = 0;

			orException = `EXCEPTION_ILLEGAL_INSTR;
		end
	end else if (wOpCode == `RISCV_OPCODE_OP) begin
		orBranchInverted = 0;
		orAluBImmediate = 0;

		orWriteRegSource = `REG_SOURCE_ALU;
		orWriteReg = wRd;
		orWriteRegImmediate = 0;
		orReadReg1 = wRs1;
		orReadReg2 = wRs2;

		orNextPcSrc = `NEXT_PC_SRC_SEQ;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = 0;
		
		orAluBSrc = `ALU_B_SOURCE_REG;

		orDMemWrite = 0;

		orException = `EXCEPTION_SUCCESS;

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

			orWriteRegSource = `REG_SOURCE_IMMEDIATE;
			orWriteReg = 0;

			orException = `EXCEPTION_ILLEGAL_INSTR;
		end
	end else begin
		orAluOp = 0;
		orAluBSrc = `ALU_B_SOURCE_IMMEDIATE;
		orAluBImmediate = 0;
		orBranchInverted = 0;

		orWriteRegSource = `REG_SOURCE_IMMEDIATE;
		orWriteReg = 0;
		orWriteRegImmediate = 0;

		orException = `EXCEPTION_ILLEGAL_INSTR;

		orDMemWrite = 0;

		orNextPcSrc = `NEXT_PC_SRC_SEQ;
		orNextPcImmediate20 = 0;
		orNextPcImmediate12 = 0;
	end
end

endmodule
