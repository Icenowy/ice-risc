module dram_memory(
	input wire iwClk,
	input wire iwnRst,

	input wire [31:0]iwReadAddr,
	input wire [31:0]iwWriteAddr,
	input wire [31:0]iwWriteData,
	input wire [3:0]iwWstrb,

	output wire [31:0]owReadData,
	output wire [31:0]owLastData
);

wire wWriteEnable;

wire [31:0]wWriteData;

wire [31:0]wWriteAddr;

assign wWriteEnable = iwnRst ? (iwWstrb == 4'b1111) : 1;

assign wWriteData = iwnRst ? iwWriteData : 0;

assign wWriteAddr = iwnRst ? (iwWriteAddr >> 2) : 43;

reg [31:0]rLastWord;

assign owLastData = rLastWord;

dram mDram(wWriteData, wWriteAddr[5:0], wWriteEnable, ~iwClk, owReadData, iwReadAddr[7:2]);

always @(negedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		rLastWord <= 0;
	end else begin
		if (iwWstrb == 4'b1111 && (iwWriteAddr >> 2) == 43) begin
			rLastWord <= iwWriteData;
		end
	end
end

endmodule
