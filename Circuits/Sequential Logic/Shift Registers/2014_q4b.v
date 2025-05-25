module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF MD3 (KEY[0], KEY[1], SW[3], KEY[2], KEY[3], LEDR[3]);
    MUXDFF MD2 (KEY[0], KEY[1], SW[2], KEY[2], LEDR[3], LEDR[2]);
    MUXDFF MD1 (KEY[0], KEY[1], SW[1], KEY[2], LEDR[2], LEDR[1]);
    MUXDFF MD0 (KEY[0], KEY[1], SW[0], KEY[2], LEDR[1], LEDR[0]);

endmodule

module MUXDFF (
    input clk,
    input E,
    input R,
    input L,
    input w,
    output Q
);
    
    always @(posedge clk)
        Q <= L ? R : (E ? w : Q);

endmodule
