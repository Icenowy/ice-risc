module sub_word_d_mem_read_rv (
	input wire [31:0] iwValue,
	input wire [31:0] iwAddress,
	input wire [1:0] iwDMemAccess,
	input wire iwDMemSignExtend,

	output wire [31:0] owOutput);

`include "macros/control.v"

wire [31:0]wValueShifted;

wire [31:0]wByteExtended;
wire [31:0]wHalfWordExtended;

wire [31:0]wValueByte;
wire [31:0]wValueHalfWord;

assign wValueShifted = (iwAddress[1:0] == 2'b11) ? iwValue >> 24 :
		       ((iwAddress[1:0] == 2'b10) ? iwValue >> 16 :
			((iwAddress[1:0] == 2'b01) ? iwValue >> 8 :
			 iwValue));

sign_extend_8_32 mByteSignExtend(wValueShifted[7:0], wByteExtended);
sign_extend_16_32 mHalfWordSignExtend(wValueShifted[15:0],
				      wHalfWordExtended);

assign wValueByte = iwDMemSignExtend ? wByteExtended :
		    {24'h0, wValueShifted[7:0]};
assign wValueHalfWord = iwDMemSignExtend ? wHalfWordExtended :
			{16'h0, wValueShifted[15:0]};

assign owOutput = (iwDMemAccess == `MEM_ACCESS_BYTE) ? wValueByte :
		  ((iwDMemAccess == `MEM_ACCESS_HALF_WORD) ? wValueHalfWord :
		   iwValue);

endmodule
