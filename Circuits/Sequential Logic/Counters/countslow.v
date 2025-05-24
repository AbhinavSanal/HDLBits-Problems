module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @(posedge clk)
        q = reset ? 4'd0 : (slowena ? (q == 4'd9 ? 4'd0 : q + 1) : q);
    
endmodule
