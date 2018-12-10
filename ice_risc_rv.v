module ice_risc_rv#(
	parameter pMemReadWait = 1'b1
)(
	input wire iwClk,
	input wire iwnRst,

	output wire [31:0]owReadAddr,
	output wire [31:0]owWriteAddr,
	output wire [31:0]owWriteData,
	output wire [3:0]owWstrb,

	input wire [31:0]iwReadData
);

wire wHalt;

control_rv #(
	.pMemReadWait(pMemReadWait)
)mMainControlUnit(iwClk, iwnRst, owReadAddr,
			    owWriteAddr, owWriteData, owWstrb,
			    iwReadData, wHalt);

endmodule
