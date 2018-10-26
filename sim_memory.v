module sim_memory(
	input wire iwClk,
	input wire iwnRst,

	input wire [31:0]iwRead1Addr,
	input wire [31:0]iwRead2Addr,
	input wire [31:0]iwWriteAddr,
	input wire [31:0]iwWriteData,
	input wire [3:0]iwWstrb,

	output wire [31:0]owRead1Data,
	output wire [31:0]owRead2Data,
	output wire [31:0]owLastData
);
reg [7:0]rMemory[0:511];

assign owRead1Data[7:0] = rMemory[iwRead1Addr];
assign owRead1Data[15:8] = rMemory[iwRead1Addr + 1];
assign owRead1Data[23:16] = rMemory[iwRead1Addr + 2];
assign owRead1Data[31:24] = rMemory[iwRead1Addr + 3];
assign owRead2Data[7:0] = rMemory[iwRead2Addr];
assign owRead2Data[15:8] = rMemory[iwRead2Addr + 1];
assign owRead2Data[23:16] = rMemory[iwRead2Addr + 2];
assign owRead2Data[31:24] = rMemory[iwRead2Addr + 3];

assign owLastData[7:0] = rMemory[508];
assign owLastData[15:8] = rMemory[509];
assign owLastData[23:16] = rMemory[510];
assign owLastData[31:24] = rMemory[511];

initial begin
	$readmemh("test.txt", rMemory);
end

always @(negedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		rMemory[511] = 0;
		rMemory[510] = 0;
		rMemory[509] = 0;
		rMemory[508] = 0;
	end else begin
		if (iwWstrb & 4'b1)
			rMemory[iwWriteAddr] = iwWriteData[7:0];
		if (iwWstrb & 4'b10)
			rMemory[iwWriteAddr + 1] = iwWriteData[15:8];
		if (iwWstrb & 4'b10)
			rMemory[iwWriteAddr + 2] = iwWriteData[23:16];
		if (iwWstrb & 4'b1000)
			rMemory[iwWriteAddr + 3] = iwWriteData[31:24];
	end
end

endmodule
