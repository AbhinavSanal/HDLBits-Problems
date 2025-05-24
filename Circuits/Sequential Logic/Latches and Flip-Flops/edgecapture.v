module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    integer i;
    reg [31:0] prev_in;
    
    always @(posedge clk) begin
        for(i = 0; i < 32; i++) begin
            if (prev_in[i] == 1 && in[i] == 0)
                out[i] = 1;
            if(reset)
                out[i] = 0;
            prev_in[i] = in[i];
        end
    end

endmodule
