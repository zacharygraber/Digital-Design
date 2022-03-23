`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 05:11:31 PM
// Design Name: 
// Module Name: saturating_counter_tb
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


`timescale 1ns / 1ps

module testbench;

    logic       clk, rst, enable, up_down;
    wire        [1:0] count;

    saturating_counter sc(
        .clk,
        .rst,
        .enable,
        .up_down,
        .count
    );


    task test_logic( input logic [1:0] countT);
        #1 //let input changes settle
        assert( count == countT) else $fatal(1,"Bad count: expected %b, got %b", countT, count);
    endtask

    //inverts the clock signal for 100MHz clock
    always #5 clk = ~clk;

    initial begin
        // set initial values for clk and reset
        // Always start with rst = 1 for at least 1 clock cycle
        clk = 0;
        rst = 1;
        enable = 0;
        up_down = 0;

        $monitor ("clk:%b rst:%b enable:%b up_down:%b count:%b",
                clk, rst, enable, up_down, count);

        // wait a few clock cycles
        // and then clear reset
        for (int i = 0; i < 8; ++i) 
         @(negedge clk);

        $display(" transition to ONE");
        rst = 0;
        enable = 1;
        up_down = 1;
        @(negedge clk);
        test_logic (2'b01);
        

        $display(" transition back to ZERO");
        up_down = 0;
        @(negedge clk);
        test_logic (2'b00);

        $display(" stay at ZERO");
        up_down = 0;
        @(negedge clk);
        test_logic (2'b00);

        $display(" transition to ONE");
        up_down = 1;
        @(negedge clk);
        test_logic (2'b01); //mealy-type test
        
        $display(" transition to TWO");
        up_down = 1;
        @(negedge clk);
        test_logic (2'b10); //mealy-type test

        $display(" transition to THREE");
        up_down = 1;
        @(negedge clk);
        test_logic (2'b11); //mealy-type test
        
        $display(" stay at THREE");
        up_down = 1;
        @(negedge clk);
        test_logic (2'b11); //mealy-type test
        
        $display(" transition to TWO");
        up_down = 0;
        @(negedge clk);
        test_logic (2'b10); //mealy-type test

        $display(" stay at TWO (disabled)");
        up_down = 1;
        enable = 0;
        @(negedge clk);
        test_logic (2'b10); //mealy-type test
        
        $display(" transition to THREE (re-enable)");
        enable = 1;
        @(negedge clk);
        test_logic (2'b11); //mealy-type test

        $display(" test RESET (transition to ZERO)");
        up_down = 0;
        rst = 1;
        @(negedge clk);
        test_logic (2'b00); //mealy-type test
        
        $display(" stay at ZERO (reset enabled)");
        up_down = 1;
        @(negedge clk);
        test_logic (2'b00); //mealy-type test
        
        $display(" transition to ONE");
        rst = 0;
        @(negedge clk);
        test_logic (2'b01); //mealy-type test

        $display("@@@Passed\n");
        $finish;

    end
endmodule    
