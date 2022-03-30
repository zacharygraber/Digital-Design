`timescale 1ns / 1ps

module top(
    input                   CLK100MHZ,
    input                   btnC, // aka reset
    input                   btnL,
    input                   btnR,
    input                   btnU,
    input                   btnD,
    output logic  [15:0]    LED, //this is optional
    output logic  [6:0]     seg,
    output logic  [3:0]     an
);

wire        rst = btnC;
wire        slowClk;

wire [1:0]  floorSel;
wire        door;

SlowClk sc0 (
    .clk(CLK100MHZ),
    .slowClk(slowClk)
);

ElevCtrl ec0(
    .clk(slowClk),
    .rst(rst),
    .floorBtn( { btnD, btnR, btnL, btnU} ),

    .floorSel(floorSel),
    .door(door)
);

SevSegDisplay ssd0(
    .floorSel(floorSel),
    .door(door),

    .segments(seg),
    .select(an)
);

//Debugging LEDs
assign LED[0] = rst;
assign LED[1] = 1'h0;
assign LED[3:2] = floorSel;
assign LED[4]   = door;
assign LED[15:5] = 'h0;


endmodule
