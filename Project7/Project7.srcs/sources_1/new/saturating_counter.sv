`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2022 04:48:22 PM
// Design Name: 
// Module Name: saturating_counter
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


module saturating_counter(
    input   clk,
    input   rst,
    input   enable,
    input   up_down,  //1 for up, 0 for down
    output logic [1:0] count
    );
   
//    //sequential block, uses Flip-Flops
//    // This always uses Non-Blocking (<=) assignments
//    always_ff @(posedge clk) begin
//        //reset is the only if() case we suggest in always_ff
//        if (rst)
//                count <= 2'b00;  //add a reset case
//    end
    
    //combinational logic block
    //This always uses blocking (=) assignments
    //You need a default value for everything assigned
    //   to avoid inferring a latch
    always_comb begin
    
        //defaults
        // Don't forget these!
        // Otherwise you will end up with a latch
        count = 2'b00; // Default
    
        if (clk & enable)
            case(count)
                2'b00: begin
                    //only transition to STATE_ONE if x is true
                    if (up_down)
                        count = count + 1; //blocking
                    else
                        count = 0; //blocking
                end
                2'b11: begin
                    if (up_down)
                        count = 2'b11;
                    else
                        count = count - 1;
                end
                default: begin
                    if (up_down)
                        count = count + 1;
                    else
                        count = count - 1;
                end
            endcase
    end
endmodule
