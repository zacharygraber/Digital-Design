`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 05:09:37 PM
// Design Name: 
// Module Name: SevSegDisplay_tb
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


module ElevCtrl_tb;
    logic door;
    logic [1:0] floorSel;
    logic slowClk, clk, rst;
    logic [3:0] floorBtn;
    
    SlowClk slow_clk(
        .clk,
        .slowClk
    );
    
    ElevCtrl elev(
        .clk(slowClk),
        .rst,
        .floorBtn,
        .floorSel, // output
        .door // output
    );
    
    task test_logic( 
        input logic [1:0] floorSelT,
        input logic doorT
    );
        #1 //let input changes settle
        assert(floorSel == floorSelT) else $fatal(1,"Bad floorSel: expected %b, got %b", floorSelT, floorSel);
        assert(door == doorT) else $fatal(1,"Bad door: expected %b, got %b", doorT, door);
    endtask
    
    initial begin
        slowClk = 0;
        rst = 1;
        floorBtn =4'b0000;
        
        $monitor ("floorSel:%b door:%b segments:%b select:%b",
                floorSel, door, segments, select);
                
        // wait a few clock cycles
        // and then clear reset
        for (int i = 0; i < 8; ++i) 
         @(negedge slowClk);
         
        // Door open: 7'b1000011
        // Door closed: 7'b0100011
        
        $display("  floor one, door open");
        rst = 0;
        @(negedge clk);
        test_logic(2'b00, 1'b1);
        
        $display("  press floor 3 button");
        floorBtn = 4'b0100;
        @(negedge clk);
        floorBtn = 4'b0000;
        @(negedge clk);
        test_logic(2'b00, 1'b0);
        @(negedge clk);
        test_logic(2'b01, 1'b0);
        @(negedge clk);
        test_logic(2'b10, 1'b0);
        @(negedge clk);
        test_logic(2'b10, 1'b1);
        
        $display("@@@Passed\n");
        $finish;
    end
endmodule
