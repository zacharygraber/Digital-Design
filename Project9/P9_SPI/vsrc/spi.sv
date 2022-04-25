`timescale 1ns/1ps

module spi(
    input               clk, 
    input               rst, 
    
    //SPI signals
    input               sck, 
    input               ss,  //acts like reset
    input               mosi, 
    output              miso, 

    //hw interface
    input        [7:0]  dout, //output to SPI
    output logic [7:0]  din,  //input from SPI
    output logic        done //logical 1 for 1 cycle indicating new data 
);
    
    enum {RX_BYTE_1, RX_BYTE_2, TX_BYTE, DONE} state, next_state, prev_state;
    enum {READ, WRITE} op, next_op;
    logic [3:0] _counter;
    
    logic rst_; //local reset
    logic next_miso;


    //combine the chip and SPI resets 
    assign rst_ = rst | ss;

    //tri-state miso when not in use.  
    // keep this line
    assign miso = ( rst_ ? 'hz : next_miso );

    always_ff @(posedge clk) begin
        if (rst_) begin
            state <= RX_BYTE_1;
            _counter <= 'h7;
            op <= READ;
            done <= 1'h0;
            next_miso <= 1'b0;    
       end 
       else begin
            prev_state <= state;
            state <= next_state;
            op <= next_op;
            case (state)
                RX_BYTE_1: begin
                    done <= 1'b0;
                    din[_counter] <= mosi;
                    if (_counter == 'h7) begin
                        if (mosi == 1) next_op <= READ;
                        else next_op <= WRITE;
                    end
                    if (_counter == 'h0) next_state <= DONE;
                    else _counter <= (_counter - 1);
                end
                
                DONE: begin
                    done <= 1'b1;
                    _counter <= 'h7;
                    case (prev_state)
                        RX_BYTE_1: begin
                            next_state <= RX_BYTE_2;
                        end
                        
                        RX_BYTE_2: begin
                            if (op == READ) begin
                                next_state <= TX_BYTE;
                            end
                            else begin // op is WRITE
                                next_state <= RX_BYTE_1;
                            end
                        end
                    endcase
                end
                
                RX_BYTE_2: begin
                    done <= 1'b0;
                    din[_counter] <= mosi;
                    if (_counter == 'h0) next_state <= DONE;
                    else _counter <= (_counter - 1);
                end
            endcase
       end
    end
endmodule
