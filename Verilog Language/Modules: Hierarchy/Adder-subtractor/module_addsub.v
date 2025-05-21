module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    reg [31:0] c;
    wire cc;
    always @(*) begin
        case(sub)
            1'b0: c = b;
            1'b1: c = ~b;
        endcase
    end
    
    add16 add1(.a(a[15:0]),  .b(c[15:0]),  .cin(sub), .cout(cc), .sum(sum[15:0]));
    add16 add2(.a(a[31:16]), .b(c[31:16]), .cin(cc),   .cout(),   .sum(sum[31:16]));

    
endmodule
