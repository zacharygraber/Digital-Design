`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 04:47:18 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
    logic [7:0] a;
    logic [7:0] b;
    logic [7:0] r;
    logic [3:0] s;
    logic c;
    logic v;
    
    alu a0(
        .a,
        .b,
        .c,
        .s,
        .v,
        .r
    );
    task alutask;
        input logic [7:0] aT;
        input logic [7:0] bT;
        input logic [3:0] sT;
        input logic [7:0] rT;
        input cT, vT;
        #5
        a=aT; b=bT; s=sT;
        #5
        $display("%b %b %b", aT, bT, sT);
        assert((r==rT)&&(c==cT)&&(v==vT))
        else $fatal(1, "alu(%b %b %b) failed", a, b, s);
    endtask
    
    initial
    begin
    
        $monitor("%b %b %b", r, c, v);
        
        // Syntax for the test: (a, b, s,  expected r, expected c, expected v)
        alutask(8'b10010101,8'b00110101, 4'b1110, 8'b00010101, 1'b0,1'b0);
        
        $display("@@@Passed");
    end
        
    
endmodule
