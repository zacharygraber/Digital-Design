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
   
    //STATE NAMES
    // States can be named whatever you want.
    enum { STATE_ZERO, STATE_ONE, STATE_TWO, STATE_THREE } state, nextState;

   
    //sequential block, uses Flip-Flops
    // This always uses Non-Blocking (<=) assignments
    always_ff @(posedge clk) begin
        //reset is the only if() case we suggest in always_ff
        if (rst)
            state <= STATE_ZERO;  //add a reset case
        else
            state <= nextState;
    end
    
    //combinational logic block
    //This always uses blocking (=) assignments
    //You need a default value for everything assigned
    //   to avoid inferring a latch
    always_comb begin
        //defaults
        // Don't forget these!
        // Otherwise you will end up with a latch
        nextState = state; //DO NOT FORGET DEFAULTS
        count = 2'b00; //DO NOT FORGET DEFAULTS
    
        case(state)
            STATE_ZERO: begin
                //only transition to STATE_ONE if x is true
                if (up_down && enable)
                    nextState = STATE_ONE; //blocking
                else //optional, handled by default
                    nextState = STATE_ZERO; //blocking
                count = 2'b00; //dependent on only state, not input
            end STATE_ONE:  begin
                if (enable) begin
                    if (up_down && enable)
                        nextState = STATE_TWO; //blocking
                    else
                        nextState = STATE_ZERO; //blocking
                end
                count = 2'b01; //dependent on only state, not input
            end STATE_TWO: begin
                if (enable) begin
                    if (up_down)
                        nextState = STATE_THREE; //blocking
                    else
                        nextState = STATE_ONE; //blocking
                end
                count = 2'b10; //dependent on only state, not input
            end STATE_THREE: begin
                if (!up_down && enable)
                    nextState = STATE_TWO;
                else
                    nextState = STATE_THREE;
                count = 2'b11; //dependent on only state, not input
            end
            default:  nextState = STATE_ZERO; //case-default
        endcase
    end
endmodule
