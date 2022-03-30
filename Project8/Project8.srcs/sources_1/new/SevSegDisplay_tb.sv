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


module SevSegDisplay_tb;
    logic door;
    logic [1:0] floorSel;
    logic [6:0] segments;
    logic [3:0] select;
    
    SevSegDisplay ssd(
        .floorSel,
        .door,
        .segments,
        .select
    );
    
    task test_logic( 
        input logic [6:0] segmentsT,
        input logic [3:0] selectT
    );
        #1 //let input changes settle
        assert(segments == segmentsT) else $fatal(1,"Bad segments: expected %b, got %b", segmentsT, segments);
        assert(select == selectT) else $fatal(1,"Bad select: expected %b, got %b", selectT, select);
    endtask
    
    initial begin
        door = 1'b1; // Start with door open
        floorSel = 2'b00; // Start with floor 1 (index 0)
        
        $monitor ("floorSel:%b door:%b segments:%b select:%b",
                floorSel, door, segments, select);
        // Door open: 7'b1000011
        // Door closed: 7'b0100011
        $display("door open, floor one");
        test_logic(7'b1000011, 4'b1110);
        
        $display("door closed, floor one");
        door = 1'b0;
        test_logic(7'b0100011, 4'b1110);
        
        $display("door open, floor two");
        door = 1'b1;
        floorSel = 2'b01;
        test_logic(7'b1000011, 4'b1101);
        
        $display("door closed, floor two");
        door = 1'b0;
        test_logic(7'b0100011, 4'b1101);
        
        $display("door open, floor three");
        door = 1'b1;
        floorSel = 2'b10;
        test_logic(7'b1000011, 4'b1011);
        
        $display("door closed, floor three");
        door = 1'b0;
        test_logic(7'b0100011, 4'b1011);
        
        $display("door open, floor four");
        door = 1'b1;
        floorSel = 2'b11;
        test_logic(7'b1000011, 4'b0111);
        
        $display("door closed, floor four");
        door = 1'b0;
        test_logic(7'b0100011, 4'b0111);
        
        $display("@@@Passed\n");
        $finish;
    end
endmodule
