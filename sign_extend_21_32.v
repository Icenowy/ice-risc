module sign_extend_21_32(input wire [20:0]iwOrig, output wire [31:0]owExtended);

assign owExtended[20:0] = iwOrig;
assign owExtended[31:21] = iwOrig[20] ? 11'h7ff : 11'h000;

endmodule
