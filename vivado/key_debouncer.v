`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/13 20:35:03
// Design Name: 
// Module Name: key_debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module key_debouncer#(
    parameter [31:0]pClockDividerFactor = 1000000,
    parameter [31:0]pSampleTime = 15
)(
    input wire iwClk,
    input wire iwnRst,
    input wire iwKeyIn,
    output reg orKeyOut
);

initial begin
    rCountLow <= 0;
    rCountHigh <= 0;
end

reg [31:0]rCountLow;
reg [31:0]rCountHigh;

always @(posedge iwClk or negedge iwnRst)
begin
    if (!iwnRst) begin
        orKeyOut <= iwKeyIn;
        rCountLow <= 0;
        rCountHigh <= 0;
    end else begin
        if (iwKeyIn == 1'b0)
            rCountLow <= rCountLow + 1;
        else
            rCountLow <= 0;
        
        if (iwKeyIn == 1'b1)
            rCountHigh <= rCountHigh + 1;
        else
            rCountHigh <= 0;
            
        if (rCountHigh == pSampleTime)
            orKeyOut <= 1;
        else if (rCountLow == pSampleTime)
            orKeyOut <= 0;
    end
end

endmodule
