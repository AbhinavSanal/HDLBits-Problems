module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    always @(posedge clk) begin
        case({j,k})
            2'b00: Q = Q;
            2'b01: Q = 1'd0;
            2'd10: Q = 1'd1;
            2'd11: Q = ~Q;
        endcase
    end

endmodule
