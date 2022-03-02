`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 04:42:39 PM
// Design Name: 
// Module Name: alu
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


module alu(
   input        [7:0] a, //operand
   input        [7:0] b, //operand

   input        [3:0] s, //operation Select

   output logic [7:0] r, //the Result value
   output logic       c,  //for unsigned Carry
   output logic       v  //for signed oVerflow
);



endmodule