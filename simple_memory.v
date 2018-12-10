module simple_memory#(
	parameter [ 31:0] pWords = 32'd44
)(
	input wire iwClk,
	input wire iwnRst,

	input wire [31:0]iwReadAddr,
	input wire [31:0]iwWriteAddr,
	input wire [31:0]iwWriteData,
	input wire [3:0]iwWstrb,

	output reg [31:0]orReadData
);
reg [7:0]rMemory[0:pWords * 4 - 1];

initial begin
	`include "simple_memory_rom.v"
end

always @(posedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		orReadData <= 0;
		`include "simple_memory_rom.v"
	end else begin
		orReadData[7:0] <= rMemory[iwReadAddr];
		orReadData[15:8] <= rMemory[iwReadAddr + 1];
		orReadData[23:16] <= rMemory[iwReadAddr + 2];
		orReadData[31:24] <= rMemory[iwReadAddr + 3];
		if (iwWstrb & 4'b1)
			rMemory[iwWriteAddr] <= iwWriteData[7:0];
		if (iwWstrb & 4'b10)
			rMemory[iwWriteAddr + 1] <= iwWriteData[15:8];
		if (iwWstrb & 4'b10)
			rMemory[iwWriteAddr + 2] <= iwWriteData[23:16];
		if (iwWstrb & 4'b1000)
			rMemory[iwWriteAddr + 3] <= iwWriteData[31:24];
	end
end

endmodule
