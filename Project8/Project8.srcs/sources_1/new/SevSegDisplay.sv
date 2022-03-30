`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 04:26:40 PM
// Design Name: 
// Module Name: SevSegDisplay
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


module SevSegDisplay(
    input   [1:0] floorSel,
    input         door, 

    output logic [6:0] segments,  
    output logic [3:0] select  
);

    logic [6:0] closed = 7'b0100011;
    logic [6:0] open = 7'b1000011;
    always_comb begin
        select = 4'b0000;
        segments = open;
        case(floorSel)
            2'b00: select = 4'b1110;
            2'b01: select = 4'b1101;
            2'b10: select = 4'b1011;
            2'b11: select = 4'b0111;
        endcase
        if (door) 
            segments = open;
        else
            segments = closed;
    end

endmodule
