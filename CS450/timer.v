module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    
    reg [9:0] counter;
    
    always @(posedge clk) begin
        if (load) counter = data;
        else counter = (counter == 9'd0) ? 9'd0 : counter - 1'b1;
        
        tc = (counter == 9'd0);
    end

endmodule
