`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire [1:0] and_in, or_out;
    
    assign and_in = {c & d, a & b};
    assign or_out = and_in[0] | and_in[1];
    assign out = or_out;
    assign out_n = ~or_out;

endmodule
