module pc#(
	parameter [31:0] pResetPc = 32'h0
)(
	input wire iwClk,
	input wire iwnRst,
	input wire iwPcUpdate,
	input wire [31:0]iwNextPc,
	
	output reg [31:0]orPc = pResetPc - 4,
	output reg [31:0]orOldPc = pResetPc - 4
);

initial begin
	orOldPc <= pResetPc - 4;
	orPc <= pResetPc - 4;
end

always @(posedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		orOldPc <= orPc;
		orPc <= pResetPc - 4;
	end else if (iwPcUpdate) begin
		orOldPc <= orPc;
		orPc <= iwNextPc;
	end
end

endmodule
