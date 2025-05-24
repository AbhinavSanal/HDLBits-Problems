module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [2:0] q;
    
    always @(posedge clk) begin
        if (~resetn) begin
            q <= 3'd0;
            out <= 1'd0;
        end
        else begin
            q <= {in, q[2], q[1]};
            out <= q[0];
        end
    end

endmodule
