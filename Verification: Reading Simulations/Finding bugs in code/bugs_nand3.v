module top_module (input a, input b, input c, output out);//

    wire inv_out;
    andgate inst1 (inv_out, a, b, c, 1'b1, 1'b1);
    assign out = ~inv_out;

endmodule
