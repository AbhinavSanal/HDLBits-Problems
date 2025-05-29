module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    parameter IDLE=0,START=1,B0=2,B1=3,B2=4,B3=5,B4=6,B5=7,B6=8,B7=9,PARITY=10,STOP_ND=11,STOP_D=12,NULL=13;
    reg [3:0] state, next_state;
    
    wire p_reset;
    reg p_out, out;
    
    assign p_reset = (state == IDLE)|(state == STOP_ND)|(state == STOP_D);
    parity p0(clk, p_reset, in, p_out);
    
    always @(*) begin
        case(state)
            IDLE: next_state = in ? IDLE : START;
            START: next_state = B0;
            B0: next_state = B1;
            B1: next_state = B2;
            B2: next_state = B3;
            B3: next_state = B4;
            B4: next_state = B5;
            B5: next_state = B6;
            B6: next_state = B7;
            B7: next_state = PARITY;
            PARITY: next_state = in ? (p_out ? STOP_D : STOP_ND) : NULL;
            STOP_ND: next_state = in ? IDLE : START;
            STOP_D: next_state = in ? IDLE : START;
            NULL: next_state = in ? IDLE : NULL;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state <= IDLE;
        else state <= next_state;
        
        case(next_state)
            B0: out_byte[0] <= in;
            B1: out_byte[1] <= in;
            B2: out_byte[2] <= in;
            B3: out_byte[3] <= in;
            B4: out_byte[4] <= in;
            B5: out_byte[5] <= in;
            B6: out_byte[6] <= in;
            B7: out_byte[7] <= in;
        endcase
    end
                
    assign done = (state == STOP_D);
    
endmodule
