module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    reg [2:0] Y;
    
    always @(*) begin
        case (y)
            0: Y = x ? 3'b001 : 1'b000;
            1: Y = x ? 3'b100 : 3'b001;
            2: Y = x ? 3'b001 : 3'b010;
            3: Y = x ? 3'b010 : 3'b001;
            4: Y = x ? 3'b100 : 3'b011;
        endcase
    end
    
    assign z = (y == 3) | (y == 4);
    assign Y0 = Y[0];

endmodule
