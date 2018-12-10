module bram_memory(
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

assign wWriteData = iwnRst ? iwWriteData : 0;

assign wWriteAddr = iwnRst ? (iwWriteAddr >> 2) : 43;

reg [31:0]rLastWord;

assign owLastData = rLastWord;

bram mBram(wWriteData, wWriteAddr[5:0], iwClk, ~iwnRst, iwWstrb, owReadData, iwReadAddr[7:2], iwClk, ~iwnRst);

always @(negedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		rLastWord <= 0;
	end else begin
		if (iwWstrb & 4'b1 && (iwWriteAddr >> 2) == 43) begin
			rLastWord[7:0] <= iwWriteData[7:0];
		end
		if (iwWstrb & 4'b10 && (iwWriteAddr >> 2) == 43) begin
			rLastWord[15:8] <= iwWriteData[15:8];
		end
		if (iwWstrb & 4'b100 && (iwWriteAddr >> 2) == 43) begin
			rLastWord[23:16] <= iwWriteData[23:16];
		end
		if (iwWstrb & 4'b1000 && (iwWriteAddr >> 2) == 43) begin
			rLastWord[31:24] <= iwWriteData[31:24];
		end
	end
end

endmodule
