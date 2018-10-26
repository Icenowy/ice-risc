module sign_extend_13_32(input wire [12:0]iwOrig, output wire [31:0]owExtended);

assign owExtended[12:0] = iwOrig;
assign owExtended[31:13] = iwOrig[11] ? 20'hfffff : 20'h00000;

endmodule
