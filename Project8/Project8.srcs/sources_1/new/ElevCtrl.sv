`timescale 1ns / 1ps

module ElevCtrl(
    input        clk, //clock
    input        rst, //reset
    input [3:0]  floorBtn,

    output logic [1:0] floorSel,
    output logic       door
);

    enum {ONE, TWO, THREE, FOUR, ONE_MOVE, TWO_MOVE, THREE_MOVE, FOUR_MOVE} state, nextState, target;
    
    always_latch begin
        if ((state == ONE) || (state == TWO) || (state == THREE) || (state == FOUR)) begin
            case(floorBtn)
                4'b1000: target = FOUR;
                4'b0100: target = THREE;
                4'b0010: target = TWO;
                4'b0001: target = ONE;
            endcase
        end
        if (rst == 1'b1) begin
            target = ONE;
        end
    end
    
    always_ff @(posedge clk) begin
        //reset is the only if() case we suggest in always_ff
        if (rst) begin
            state <= ONE;  //add a reset case
        end
        else begin
            state <= nextState;
        end
    end
    
    always_comb begin
        // Defaults
        floorSel = 2'b00;
        nextState = ONE;
        door = 1'b1;
        
        case(state)
            ONE: begin
                // Determine next state
                if (target != ONE) begin
                    nextState = ONE_MOVE;
                end
                else begin
                    nextState = ONE;
                end
                
                // Set outputs
                door = 1'b1;
                floorSel = 2'b00;
            end
            TWO: begin
                if (target != TWO) begin
                    nextState = TWO_MOVE;
                end
                else begin
                    nextState = TWO;
                end
                door = 1'b1;
                floorSel = 2'b01;
            end
            THREE: begin
                if (target != THREE) begin
                    nextState = THREE_MOVE;
                end
                else begin
                    nextState = THREE;
                end
                door = 1'b1;
                floorSel = 2'b10;
            end
            FOUR: begin
                if (target != FOUR) begin
                    nextState = FOUR_MOVE;
                end
                else nextState = FOUR;
                door = 1'b1;
                floorSel = 2'b11;
            end
            ONE_MOVE: begin
                if (target == ONE) nextState = ONE;
                else nextState = TWO_MOVE;
                door = 1'b0;
                floorSel = 2'b00;
            end
            TWO_MOVE: begin
                if (target == TWO) nextState = TWO;
                else if ((target == THREE) || (target == FOUR)) nextState = THREE_MOVE;
                else nextState = ONE_MOVE;
                door = 1'b0;
                floorSel = 2'b01;
            end
            THREE_MOVE: begin
                if (target == THREE) nextState = THREE;
                else if ((target == ONE) || (target == TWO)) nextState = TWO_MOVE;
                else nextState = FOUR_MOVE;
                door = 1'b0;
                floorSel = 2'b10;
            end
            FOUR_MOVE: begin
                if (target == FOUR) nextState = FOUR;
                else nextState = THREE_MOVE;
                door = 1'b0;
                floorSel = 2'b11;
            end
            default: begin
                nextState = ONE;
                floorSel = 2'b00;
                door = 1'b1;
            end
        endcase
    end
endmodule
