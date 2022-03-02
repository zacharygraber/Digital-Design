`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 05:20:46 PM
// Design Name: 
// Module Name: dmux
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


module demux(
    input a, b, c,
    input e,
    output d0, d1, d2, d3, d4, d5, d6, d7
    );
    wire wire0, wire1, wire2, wire3, wire4, wire5, wire6, wire7;
    decoder newdecode(.a, .b, .c, .d0(wire0), .d1(wire1), .d2(wire2), .d3(wire3), .d4(wire4), .d5(wire5), .d6(wire6), .d7(wire7)); 
    assign d0 = e & wire0;
    assign d1 = e & wire1;
    assign d2 = e & wire2;
    assign d3 = e & wire3;
    assign d4 = e & wire4;
    assign d5 = e & wire5;
    assign d6 = e & wire6;
    assign d7 = e & wire7;
endmodule
