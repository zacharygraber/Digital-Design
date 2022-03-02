`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 04:42:48 PM
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
   wire [8:0] a9 = {1'h00, a};
   wire [8:0] b9 = {1'h00, b};
   always_comb
   begin
       case(s)
           4'b1110: begin //and case
                        r = a&b;
                        c=0;
                        v=0;
                        end 
           4'b1101: begin //or case
                        r = a|b;
                        c=0;
                        v=0;
                        end
           4'b1100: begin //not case
                        r = ~a;
                        c=0;
                        v=0;
                        end 
           4'b1011: begin //xor case
                        r = a^b;
                        c=0;
                        v=0; 
                        end
           4'b1010: begin //addition case
                        {c,r} = a9+b9;
                        v = ~a[7] & ~b[7] & r[7] | a[7] & b[7] & ~r[7];
                        end
           4'b1001: begin   //subtraction case
                        {c,r} = a9-b9;
                        v = (a[7]&~b[7]&~r[7])|(~a[7]&b[7]&r[7]);
                        end
           4'b1000: begin  //transfer case
                        r = a;
                        c=0;
                        v=0;
                        end
           4'b0111: begin //test case
                        r = (a==0);
                        c=0;
                        v=0;
                        end
        endcase
    end
endmodule
