module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    reg [7:0] Q;
    
    integer i;
    always @(posedge clk) begin
        if (enable) begin
            Q[0] <= S;
            for(i = 0; i < 7; i++)
                Q[i+1] <= Q[i];
        end
    end
    
    assign Z = Q[{A,B,C}];
    
endmodule
