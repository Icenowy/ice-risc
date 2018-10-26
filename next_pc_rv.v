module next_pc_rv(
	input wire [1:0]iwPcSrc,
	input wire [31:0]iwCurrentPc,
	input wire [31:0]iwRegister,
	input wire [19:0]iwImmediate20,
	input wire [11:0]iwImmediate12,
	input wire iwBranchStatus,

	output wire [31:0]owNextPc
);

`include "macros/control_rv.v"

wire [31:0]wSortedExtendedImmediate20;
wire [31:0]wSortedExtendedImmediate12;
wire [31:0]wExtendedImmediate12;

wire [20:0]wSortedImmediate20;
wire [12:0]wSortedImmediate12;

assign wSortedImmediate20 = {iwImmediate20[19], iwImmediate20[7:0],
			     iwImmediate20[8], iwImmediate20[18:9], 1'b0};

assign wSortedImmediate12 = {iwImmediate12[11], iwImmediate12[0],
			     iwImmediate12[10:5], iwImmediate12[4:1], 1'b0};

sign_extend_21_32 mSortedImmediate20SignExtend(wSortedImmediate20,
					       wSortedExtendedImmediate20);
sign_extend_13_32 mSortedImmediate13SignExtend(wSortedImmediate12,
					       wSortedExtendedImmediate12);

sign_extend_12_32 mImmediate12SignExtend(iwImmediate12, wExtendedImmediate12);

assign owNextPc = (iwPcSrc == `NEXT_PC_SRC_SEQ ||
		   (iwPcSrc == `NEXT_PC_SRC_B && iwBranchStatus == 1'b0)) ?
		   (iwCurrentPc + 4) :
		   ((iwPcSrc == `NEXT_PC_SRC_JAL) ?
		    (iwCurrentPc + wSortedExtendedImmediate20) :
		    ((iwPcSrc == `NEXT_PC_SRC_JALR) ?
		     (iwRegister + wExtendedImmediate12) :
		      (iwCurrentPc + wSortedExtendedImmediate12)));

endmodule
