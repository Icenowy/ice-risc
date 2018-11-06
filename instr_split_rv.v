module instr_split_rv(
	input wire [31:0]iwInstr,

	output wire [4:0]owRs1,
	output wire [4:0]owRs2,
	output wire [4:0]owRd,

	output wire [19:0]owImmediate20,
	output wire [11:0]owImmediate12,
	output wire [11:0]owImmediate12SClass,

	output wire [6:0]owOpCode,
	output wire [2:0]owFunct3,
	output wire [6:0]owFunct7
);

assign owRs1 = iwInstr[19:15];
assign owRs2 = iwInstr[24:20];
assign owRd = iwInstr[11:7];
assign owImmediate20 = iwInstr[31:12];
assign owImmediate12 = iwInstr[31:20];
assign owImmediate12SClass = {iwInstr[31:25], iwInstr[11:7]};
assign owOpCode = iwInstr[6:0];
assign owFunct3 = iwInstr[14:12];
assign owFunct7 = iwInstr[31:25];

endmodule
