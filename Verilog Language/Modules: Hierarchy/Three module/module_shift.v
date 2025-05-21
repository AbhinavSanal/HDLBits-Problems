module top_module ( input clk, input d, output q );
    wire [1:0] to;
    my_dff dff1(.clk(clk), .d(d), .q(to[0]));
    my_dff dff2(.clk(clk), .d(to[0]), .q(to[1]));
    my_dff dff3(.clk(clk), .d(to[1]), .q(q));
endmodule
