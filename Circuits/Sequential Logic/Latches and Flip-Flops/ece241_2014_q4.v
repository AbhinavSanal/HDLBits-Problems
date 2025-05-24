module top_module (
    input clk,
    input x,
    output z
); 

    wire [2:0] d2x;
    
    always @(posedge clk) begin
        d2x[0] = d2x[0] ^ x;
        d2x[1] = x & ~d2x[1];
        d2x[2] = x | ~d2x[2];
    end
    
    assign z = ~(d2x[0] | d2x[1] | d2x[2]);
    
endmodule
