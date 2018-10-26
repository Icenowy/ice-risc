module sign_extend_8_32(input wire [7:0]iwOrig, output wire [31:0]owExtended);

assign owExtended[7:0] = iwOrig;
assign owExtended[31:8] = iwOrig[7] ? 24'hffffff : 24'h000000;

endmodule
