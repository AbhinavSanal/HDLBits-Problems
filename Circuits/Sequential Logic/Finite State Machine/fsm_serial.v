module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter IDLE=0,START=1,B0=2,B1=3,B2=4,B3=5,B4=6,B5=7,B6=8,B7=9,STOP=10,NULL=11;
    reg [3:0] state, next_state;
    
    always @(*) begin
        case (state)
            IDLE: next_state = in ? IDLE : START;
            START: next_state = B0;
            B0: next_state <= B1;
            B1: next_state <= B2;
            B2: next_state <= B3;
            B3: next_state <= B4;
            B4: next_state <= B5;
            B5: next_state <= B6;
            B6: next_state <= B7;
            B7: next_state <= in ? STOP : NULL;
            NULL: next_state <= in ? IDLE : NULL;
            STOP: next_state <= in ? IDLE : START;
        endcase
    end
    
    always @ (posedge clk) begin
        if (reset) state <= IDLE;
        else state <= next_state;
    end
    
    assign done = (state == STOP);
    
endmodule
