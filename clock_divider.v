`timescale 1ns / 1ps

module clock_divider#(
	parameter [ 31:0] pFactor = 1024
	)(
    input iwClk,
    input iwnRst,
    output reg orNewClk
);
    
reg [31:0]rCounter;

initial begin
    rCounter <= 0;
    orNewClk <= 0;
end

always @(posedge iwClk or negedge iwnRst) begin
    if (!iwnRst) begin
        rCounter <= 0;
        orNewClk <= 0;
    end else begin
        rCounter <= rCounter + 1;
        if (rCounter == pFactor / 2) begin
            rCounter <= 0;
            orNewClk = ~orNewClk; 
        end
    end
end
endmodule
