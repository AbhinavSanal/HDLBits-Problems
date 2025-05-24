module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    genvar i;
    generate
        for(i = 0; i < 8; i++) begin : loop
            dff dff0(.clk(clk), .d(d[i]), .q(q[i]));
        end
    endgenerate

endmodule
