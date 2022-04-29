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
    
    logic [2:0] _rx_counter;
    logic [2:0] _tx_counter;
    
    logic rst_; //local reset
    logic next_miso;
    logic prev_sck;
    
    logic rising;
    logic falling;
    
    assign rising = ~prev_sck && sck;
    assign falling = prev_sck && ~sck;


    //combine the chip and SPI resets 
    assign rst_ = rst | ss;

    //tri-state miso when not in use.  
    // keep this line
    assign miso = ( rst_ ? 'hz : next_miso );

    always_ff @(posedge clk) begin
        if (rst_) begin
            done <= 1'h0;
         end 
//        else begin
            
//            if (_rx_counter == 0) next_done <= 1;
//            else next_done <= 0;
//        end
    end
        
    assign next_miso = dout[_tx_counter];
    
    always_comb begin
        if (rst_) begin 
            prev_sck = 0;
            _rx_counter = 'h7;
            _tx_counter = 'h7;
        end
        else prev_sck = ~sck;
        
        din[_rx_counter] = mosi;
        
        // Rising edge
        if (rising) begin
            _rx_counter = _rx_counter - 1;
        end
        
        // Falling edge
        else if (falling) begin
            _tx_counter = _tx_counter - 1;
        end
    end
endmodule
