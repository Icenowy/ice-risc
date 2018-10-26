module ice_risc_rv(
	input wire iwClk,
	input wire iwnRst,

	output wire [31:0]owRead1Addr,
	output wire [31:0]owRead2Addr,
	output wire [31:0]owWriteAddr,
	output wire [31:0]owWriteData,
	output wire [3:0]owWstrb,

	input wire [31:0]iwRead1Data,
	input wire [31:0]iwRead2Data
);

wire wHalt;

control_rv mMainControlUnit(iwClk, iwnRst, owRead1Addr, owRead2Addr,
			    owWriteAddr, owWriteData, owWstrb,
			    iwRead1Data, iwRead2Data, wHalt);

endmodule
