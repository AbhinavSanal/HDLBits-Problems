module top_module (
    input clk,
    input reset,
    output [3:0] q);

    always @(posedge clk)
        q = (reset | (q == 10)) ? 4'd1 : q + 1;
    
endmodule
