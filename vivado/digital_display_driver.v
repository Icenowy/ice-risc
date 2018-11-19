module digital_display_driver#(
    parameter [31:0]pClockDividerFactor = 1024
)(
    input wire iwClk,
    input wire iwnRst,
    input wire [3:0] iwData0,
    input wire [3:0] iwData1,
    input wire [3:0] iwData2,
    input wire [3:0] iwData3,
    output reg [6:0] ornSeg,
    output reg [3:0] ornAn
);

reg [1:0]rSelect;

wire wNewClk;

reg [3:0]rData;

clock_divider #(
    .pFactor (pClockDividerFactor)
)mClockDivider(iwClk, iwnRst, wNewClk);

initial begin
    rSelect <= 0;
end

always @(rSelect or iwData0 or iwData1 or iwData2 or iwData3) begin
    if (rSelect == 0) begin
        ornAn = 4'b1110;
        rData = iwData0;
    end else if (rSelect == 1) begin
        ornAn = 4'b1101;
        rData = iwData1;
    end else if (rSelect == 2) begin
        ornAn = 4'b1011;
        rData = iwData2;
    end else begin
        ornAn = 4'b0111;
        rData = iwData3;
    end
end

always @(rData) begin
    case (rData)
        4'h0: ornSeg = 7'b1000000; // 0
        4'h1: ornSeg = 7'b1111001; // 1
        4'h2: ornSeg = 7'b0100100; // 2
        4'h3: ornSeg = 7'b0110000; // 3
        4'h4: ornSeg = 7'b0011001; // 4
        4'h5: ornSeg = 7'b0010010; // 5
        4'h6: ornSeg = 7'b0000010; // 6
        4'h7: ornSeg = 7'b1011000; // 7
        4'h8: ornSeg = 7'b0000000; // 8
        4'h9: ornSeg = 7'b0011000; // 9
        4'ha: ornSeg = 7'b0001000; // A
        4'hb: ornSeg = 7'b0000011; // b
        4'hc: ornSeg = 7'b1000110; // c
        4'hd: ornSeg = 7'b0100001; // d
        4'he: ornSeg = 7'b0000110; // E
        default: ornSeg = 7'b0001110; // F
    endcase
end

always @(posedge wNewClk or negedge iwnRst) begin
    if (!iwnRst) begin
        rSelect <= 0;
    end else begin
        rSelect <= rSelect + 1; 
    end
end
    
endmodule
