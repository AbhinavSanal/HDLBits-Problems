module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] m2m0, m2m1;
    mux2 mux0 ( sel[0],    a,    b, m2m0 );
    mux2 mux1 ( sel[0],    c,    d, m2m1 );
    mux2 mux2 ( sel[1], m2m0, m2m1,  out );

endmodule
