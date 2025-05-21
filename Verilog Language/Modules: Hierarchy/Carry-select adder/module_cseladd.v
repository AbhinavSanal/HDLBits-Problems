module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire cc;
    reg [31:0] temp_sum;
    add16 add1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(cc));
    add16 add2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(temp_sum[15:0]), .cout());
    add16 add3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(temp_sum[31:16]), .cout());
    
    always @(*) begin
        case(cc)
            1'b0: sum[31:16] = temp_sum[15:0];
            1'b1: sum[31:16] = temp_sum[31:16];
        endcase
    end
    
endmodule
