module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [23:0] to;
    my_dff8 dff1(.clk(clk), .d(d[7:0]), .q(to[7:0]));
    my_dff8 dff2(.clk(clk), .d(to[7:0]), .q(to[15:8]));
    my_dff8 dff3(.clk(clk), .d(to[15:8]), .q(to[23:16]));
    
    always @(*) begin
        case(sel)
            2'd0: q[7:0] = d[7:0];
            2'd1: q[7:0] = to[7:0];
            2'd2: q[7:0] = to[15:8];
            2'd3: q[7:0] = to[23:16];
        endcase
    end
endmodule
