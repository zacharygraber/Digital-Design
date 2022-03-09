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
    	a=0; b=0; s=1;
        $monitor("%b %b %b", r, c, v);
        
        // Syntax for the test: (operand1,operand2,4-bit op-code, expected result, exp carry, exp oVerflow)
        
        // AND tests
        alutask(8'b10010101,8'b00110101, 4'b1110, 8'b00010101, 1'b0,1'b0);
        alutask(8'b00000000,8'b01010101, 4'b1110, 8'b00000000, 1'b0,1'b0);
        alutask(8'b11111111,8'b10000001, 4'b1110, 8'b10000001, 1'b0,1'b0);
        
        // OR tests
        alutask(8'b00000000,8'b00000000, 4'b1101, 8'b00000000, 1'b0,1'b0);
        alutask(8'b11111111,8'b00000000, 4'b1101, 8'b11111111, 1'b0,1'b0);
        alutask(8'b10010101,8'b11001001, 4'b1101, 8'b11011101, 1'b0,1'b0);
        
        // NOT tests
        alutask(8'b00000000,8'b00000000, 4'b1100, 8'b11111111, 1'b0,1'b0);
        alutask(8'b00000000,8'b11111111, 4'b1100, 8'b11111111, 1'b0,1'b0);
        alutask(8'b11111111,8'b00000000, 4'b1100, 8'b00000000, 1'b0,1'b0);
        alutask(8'b11111111,8'b11111111, 4'b1100, 8'b00000000, 1'b0,1'b0);
        alutask(8'b10010101,8'b00000000, 4'b1100, 8'b01101010, 1'b0,1'b0);
        
        // XOR tests
        alutask(8'b00000000,8'b00000000, 4'b1011, 8'b00000000, 1'b0,1'b0);
        alutask(8'b11111111,8'b11111111, 4'b1011, 8'b00000000, 1'b0,1'b0);
        alutask(8'b11111111,8'b00000000, 4'b1011, 8'b11111111, 1'b0,1'b0);
        alutask(8'b01011010,8'b10010100, 4'b1011, 8'b11001110, 1'b0,1'b0);
        
        // Addition tests!
        alutask(8'b00000001,8'b00000001, 4'b1010, 8'b00000010, 1'b0,1'b0); // 1+1 = 2 -> no carry or overflow
        alutask(8'b00001111,8'b00000011, 4'b1010, 8'b00010010, 1'b0,1'b0); // 15+3 = 18 -> no carry or overflow
        
        //Subtraction tests
        alutask(8'b10000001,8'b10000001, 4'b1001, 8'b00000000, 1'b0,1'b0);
        
        //Transfer tests
        alutask(8'b00000111,8'b00000000, 4'b1000, 8'b00000111, 1'b0, 1'b0);
        
        //Test tests!
        alutask(8'b00000000,8'b00000000, 4'b0111, 8'b00000001, 1'b0, 1'b0);
        alutask(8'b11111111,8'b00000000, 4'b0111, 8'b00000000, 1'b0, 1'b0);
        
        $display("@@@Passed");
    end
        
    
endmodule
