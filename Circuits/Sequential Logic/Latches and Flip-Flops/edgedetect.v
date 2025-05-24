module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    integer i;
    reg [7:0] temp;
    always @(posedge clk) begin
        for(i = 0; i < 8; i++) begin
            if(temp[i] != in[i] && in[i] == 1)
                pedge[i] = 1'd1;
            else
                pedge[i] = 1'd0;
            temp[i] = in[i];
        end
    end
    
endmodule
