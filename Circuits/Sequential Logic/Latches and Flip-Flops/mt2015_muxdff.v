module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

    wire m2d;
    
    always @(posedge clk)
        Q <= m2d;
    
    assign m2d = L ? r_in : q_in;
    
endmodule
