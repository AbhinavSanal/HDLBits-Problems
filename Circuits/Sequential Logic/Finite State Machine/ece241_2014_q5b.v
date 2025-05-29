module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0,B=1;
    reg state, next_state;
    
    always @(*) begin
        case(state)
            A: next_state = x ? B : A;
            B: next_state = B;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset) state = A;
        else state = next_state;
    end
    
    assign z = (state == A)&x | (state == B)&~x;

endmodule
