module regfile_32(input wire iwClk, input wire iwnRst, input wire iwWriteEnable,
		  input wire [4:0]iwReadReg1, input wire [4:0]iwReadReg2,
		  input wire [4:0]iwWriteReg, output wire [31:0]owReadData1,
		  output wire [31:0]owReadData2, input wire [31:0]iwWriteData);

integer i;
reg [31:0]rRegFile[31:0];

assign owReadData1 = (iwReadReg1 == 0) ? 0 : rRegFile[iwReadReg1];
assign owReadData2 = (iwReadReg2 == 0) ? 0 : rRegFile[iwReadReg2];

always @(negedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		for (i = 0; i < 32; i = i + 1)
			rRegFile[i] <= 0;
	end else if (iwWriteEnable) begin
		rRegFile[iwWriteReg] <= iwWriteData;
	end
end

endmodule
