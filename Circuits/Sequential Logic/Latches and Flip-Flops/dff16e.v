module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        q[7:0] <= resetn ? (byteena[0] ? d[7:0] : q[7:0]) : 8'd0;
        q[15:8] <= resetn ? (byteena[1] ? d[15:8] : q[15:8]) : 8'd0;
    end

endmodule
