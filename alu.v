module alu(
	input wire [31:0]iwA,
	input wire [31:0]iwB,
	input wire [3:0]iwAluOp,
	output wire owZero,
	output wire owSign,
	output reg [31:0] owResult
);

`include "macros/aluops.v"

always @(iwAluOp or iwA or iwB) begin
	if (iwAluOp == `ALU_OP_ADD)
		owResult = iwA + iwB;
	else if (iwAluOp == `ALU_OP_SLTU)
		owResult = iwA < iwB;
	else if (iwAluOp == `ALU_OP_SLT)
		if (iwA[31] && iwB[31])
			owResult = iwA > iwB;
		else if (iwA[31])
			owResult = 1;
		else if (iwB[31])
			owResult = 0;
		else
			owResult = iwA < iwB;
	else if (iwAluOp == `ALU_OP_AND)
		owResult = iwA & iwB;
	else if (iwAluOp == `ALU_OP_OR)
		owResult = iwA | iwB;
	else if (iwAluOp == `ALU_OP_XOR)
		owResult = iwA ^ iwB;
	else if (iwAluOp == `ALU_OP_SLL)
		owResult = iwA << iwB[4:0];
	else if (iwAluOp == `ALU_OP_SRL)
		owResult = iwA >> iwB[4:0];
	else if (iwAluOp == `ALU_OP_SRA)
		owResult = iwA >>> iwB[4:0];
	else if (iwAluOp == `ALU_OP_SUB)
		owResult = iwA - iwB;
	else if (iwAluOp == `ALU_OP_EQ)
		owResult = iwA == iwB;
	else
		owResult = 0;
end

assign owZero = owResult == 0;
assign owSign = owResult[31];

endmodule
