module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);

    always @(posedge clk)
        q = r ? 1'd0 : d;
    
endmodule
