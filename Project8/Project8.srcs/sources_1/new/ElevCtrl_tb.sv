`timescale 1ns / 1ps

module ElevCtrl_tb;
    logic door;
    logic [1:0] floorSel;
    logic clk, rst;
    logic [3:0] floorBtn;
    
    
    ElevCtrl elev(
        .clk,
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
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        rst = 1;
        floorBtn = 4'b0000;
        
        $monitor ("clk:%b floorBtn:%b rst:%b door:%b floorSel:%b",
                clk, floorBtn, rst, door, floorSel);
                
//         wait a few clock cycles
//         and then clear reset
        for (int i = 0; i < 8; ++i) 
         @(negedge clk);
  
        rst = 0;
        
        $display("  floor one, door open");
        @(negedge clk);
        test_logic(2'b00, 1'b1);
        
        $display("  press floor 2 button");
        floorBtn = 4'b0010;
        @(negedge clk);
        test_logic(2'b00, 1'b0);
        @(negedge clk);
        floorBtn = 4'b0000;;
        test_logic(2'b01, 1'b0);
        @(negedge clk);
        test_logic(2'b01, 1'b1);
        @(negedge clk);
        
        $display("  floor 2 to floor 3");
        floorBtn = 4'b0100;
        test_logic(2'b01, 1'b1);
        @(negedge clk);
        floorBtn = 4'b0000;
        test_logic(2'b01, 1'b0);
        @(negedge clk);
        test_logic(2'b10, 1'b0);
        @(negedge clk);
        test_logic(2'b10, 1'b1);
        @(negedge clk);
        
        $display("  press floor 4 button");
        floorBtn = 4'b1000;
        @(negedge clk);
        floorBtn = 4'b0000;
        test_logic(2'b10, 1'b0);
        @(negedge clk);
        test_logic(2'b11, 1'b0);
        @(negedge clk);
        test_logic(2'b11, 1'b1);
        @(negedge clk);
        
        $display("  press floor 4 button (already at 4)");
        floorBtn = 4'b1000;
        @(negedge clk);
        test_logic(2'b11, 1'b1);
        @(negedge clk);
        test_logic(2'b11, 1'b1);
        @(negedge clk);
        test_logic(2'b11, 1'b1);
        floorBtn = 4'b0000;
        @(negedge clk);
        test_logic(2'b11, 1'b1);
        @(negedge clk);
        
        $display("  press floor 3 button");
        floorBtn = 4'b0100;
        @(negedge clk);
        floorBtn = 4'b0000;
        test_logic(2'b11, 1'b0);
        @(negedge clk);
        test_logic(2'b10, 1'b0);
        @(negedge clk);
        test_logic(2'b10, 1'b1);
        @(negedge clk);
        
        $display("  press floor 2 button");
        floorBtn = 4'b0010;
        @(negedge clk);
        floorBtn = 4'b0000;
        test_logic(2'b10, 1'b0);
        @(negedge clk);
        test_logic(2'b01, 1'b0);
        @(negedge clk);
        test_logic(2'b01, 1'b1);
        @(negedge clk);
        
        $display("  press floor 1 button");
        floorBtn = 4'b0001;
        @(negedge clk);
        floorBtn = 4'b0000;
        test_logic(2'b01, 1'b0);
        @(negedge clk);
        test_logic(2'b00, 1'b0);
        @(negedge clk);
        test_logic(2'b00, 1'b1);
        @(negedge clk);
        
        $display("  press floor 3 button");
        floorBtn = 4'b0100;
        @(negedge clk);
        test_logic(2'b00, 1'b0);
        @(negedge clk);
        floorBtn = 4'b0000;;
        test_logic(2'b01, 1'b0);
        @(negedge clk);
        test_logic(2'b10, 1'b0);
        @(negedge clk);
        test_logic(2'b10, 1'b1);
        @(negedge clk);
        test_logic(2'b10, 1'b1);
        @(negedge clk);
        
        $display("  press reset");
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        test_logic(2'b00, 1'b1);
        @(negedge clk);
        test_logic(2'b00, 1'b1);
        @(negedge clk);
        test_logic(2'b00, 1'b1);
        @(negedge clk);
        
        $display("@@@Passed\n");
        $finish;
    end
endmodule
