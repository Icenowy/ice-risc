module sign_extend_20_32(input wire [19:0]iwOrig, output wire [31:0]owExtended);

assign owExtended[19:0] = iwOrig;
assign owExtended[31:20] = iwOrig[19] ? 12'hfff : 12'h000;

endmodule
