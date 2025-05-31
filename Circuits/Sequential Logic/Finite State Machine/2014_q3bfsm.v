module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    reg [2:0] state, next_state;
    
    always @(*) begin
        case(state)
            0 : next_state = x ? 1 : 0;
            1 : next_state = x ? 4 : 1;
            2 : next_state = x ? 1 : 2;
            3 : next_state = x ? 2 : 1;
            4 : next_state = x ? 4 : 3;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state = 0;
        else state = next_state;
    end
    
    assign z = (state == 3) | (state == 4);

endmodule
