module pc(
	input wire iwClk,
	input wire iwnRst,
	input wire iwPcUpdate,
	input wire [31:0]iwNextPc,
	input wire [31:0]iwResetPc,
	
	output reg [31:0]orPc
);

initial begin
	orPc <= iwResetPc - 4;
end

always @(posedge iwClk or negedge iwnRst) begin
	if (!iwnRst) begin
		orPc <= iwResetPc - 4;
	end else if (iwPcUpdate) begin
		orPc <= iwNextPc;
	end
end

endmodule
