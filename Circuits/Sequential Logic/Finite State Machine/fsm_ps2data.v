module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter S0=0, S1=1, S2=2, S3=3;
    reg [1:0] state, next_state;
    reg [23:0] data;
    
    always @(*) begin
        case (state)
            S0: next_state <= in[3] ? S1 : S0;
            S1: next_state <= S2;
            S2: next_state <= S3;
            S3: next_state <= in[3] ? S1 : S0;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state <= S0;
        else begin
            state <= next_state;
            if (next_state == S1) data[23:16] <= in;
            else if (next_state == S2) data[15:8] <= in;
            else if (next_state == S3) data[7:0] <= in;
        end
    end  
 
    assign done = (state == S3) ? 1'd1 : 1'd0;
    assign out_bytes = (state == S3) ? data : 0;

endmodule
