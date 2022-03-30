`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 05:08:34 PM
// Design Name: 
// Module Name: SlowClk
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


module SlowClk(
    input clk,  
    output slowClk
);
    logic [25:0] q;

    //positive-edge triggered flip flop
    always_ff @(posedge clk) 
        q <= q + 25'h1;

    assign slowClk = q[25]; //use q[4] for simulations, 25

endmodule

