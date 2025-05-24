module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    genvar i;
    generate
        for(i = 0; i < 8; i++) begin : loop
            dffr dff0(.clk(clk), .reset(reset), .d(d[i]), .q(q[i]));
        end
    endgenerate

endmodule

module dffr (
    input clk,
    input reset,
    input d,
    output q
);
    
    always @(posedge clk) begin
        q <= reset ? 1'd0 : d;
    end

endmodule
