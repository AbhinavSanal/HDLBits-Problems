module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    assign ena[1] = (q[3:0] == 16'h9);
    assign ena[2] = (q[7:0] == 16'h99);
    assign ena[3] = (q[11:0] == 16'h999);
    
    always @(posedge clk) begin
        q[3:0] = reset ? 4'd0 : (q[3:0] == 4'd9 ? 4'd0 : q[3:0] + 1);
        q[7:4] = reset ? 4'd0 : (ena[1] ? (q[7:4] == 4'd9 ? 4'd0 : q[7:4] + 1) : q[7:4]);
        q[11:8] = reset ? 4'd0 : (ena[2] ? (q[11:8] == 4'd9 ? 4'd0 : q[11:8] + 1) : q[11:8]);
        q[15:12] = reset ? 4'd0 : (ena[3] ? (q[15:12] == 4'd9 ? 4'd0 : q[15:12] + 1) :  q[15:12]);
    end
    
endmodule
