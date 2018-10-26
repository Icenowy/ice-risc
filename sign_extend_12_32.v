module sign_extend_12_32(input wire [11:0]iwOrig, output wire [31:0]owExtended);

assign owExtended[11:0] = iwOrig;
assign owExtended[31:12] = iwOrig[11] ? 20'hfffff : 20'h00000;

endmodule
