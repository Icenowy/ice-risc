module sign_extend_16_32(input wire [15:0]iwOrig, output wire [31:0]owExtended);

assign owExtended[15:0] = iwOrig;
assign owExtended[31:16] = iwOrig[15] ? 16'hffff : 16'h0000;

endmodule
