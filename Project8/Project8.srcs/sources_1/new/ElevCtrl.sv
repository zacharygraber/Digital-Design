`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 04:24:52 PM
// Design Name: 
// Module Name: ElevCtrl
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


module ElevCtrl(
    input        clk, //clock
    input        rst, //reset
    input [3:0]  floorBtn,

    output logic [1:0] floorSel,
    output logic       door
);

    enum {ONE_IDLE, ONE_MOVE, TWO_IDLE, TWO_MOVE, THREE_IDLE, THREE_MOVE, FOUR_IDLE, FOUR_MOVE } state, nextState;
    logic [1:0] target_floor = 2'b00;
    
    always_ff @(posedge clk) begin
        //reset is the only if() case we suggest in always_ff
        if (rst) begin
            state <= ONE_IDLE;  //add a reset case
            target_floor = 2'b00;
        end
        else
            state <= nextState;
        
        if ((floorBtn != 4'b0000) && (door == 1)) begin
            case(floorBtn)
                4'b0001: target_floor = 2'b00;
                4'b0010: target_floor = 2'b01;
                4'b0100: target_floor = 2'b10;
                4'b1000: target_floor = 2'b11;
            endcase
        end
    end
    
    always_comb begin
        // Defaults
        floorSel = 2'b00;
        door = 1'b1;
        
        case(state)
            ONE_IDLE: begin
                // Determine next state
                if (target_floor != 2'b00) begin
                    nextState = ONE_MOVE;
                end
                else
                    nextState = ONE_IDLE;
                
                // Set outputs
                floorSel = 2'b00;
                door = 1'b1;
            end
            TWO_IDLE: begin
                if (target_floor != 2'b01)
                    nextState = TWO_MOVE;
                else
                    nextState = TWO_IDLE;
                floorSel = 2'b01;
                door = 1'b1;
            end
            THREE_IDLE: begin
                if (target_floor != 2'b10)
                    nextState = THREE_MOVE;
                else
                    nextState = THREE_IDLE;
                floorSel = 2'b10;
                door = 1'b1;
            end
            FOUR_IDLE: begin
                if (target_floor != 2'b11)
                    nextState = FOUR_MOVE;
                else
                    nextState = FOUR_IDLE;
                floorSel = 2'b11;
                door = 1'b1;
            end
            ONE_MOVE: begin
                if (target_floor != 2'b00)
                    nextState = TWO_MOVE;
                else
                    nextState = ONE_IDLE;
                floorSel = 2'b00;
                door = 1'b0;
            end
            TWO_MOVE: begin
                if (target_floor == 2'b01)
                    nextState = TWO_IDLE;
                else if (target_floor < 2'b01)
                    nextState = ONE_MOVE;
                else
                    nextState = THREE_MOVE;
                floorSel = 2'b01;
                door = 1'b0;
            end
            THREE_MOVE: begin
                if (target_floor == 2'b10)
                    nextState = THREE_IDLE;
                else if (target_floor < 2'b10)
                    nextState = TWO_MOVE;
                else
                    nextState = FOUR_MOVE;
                floorSel = 2'b10;
                door = 1'b0;
            end
            FOUR_MOVE: begin
                if (target_floor == 2'b11)
                    nextState = FOUR_IDLE;
                else
                    nextState = THREE_MOVE;
                floorSel = 2'b11;
                door = 1'b0;
            end
            default: begin
                floorSel = 2'b00;
                door = 1'b1;
            end
        endcase
    end
endmodule
