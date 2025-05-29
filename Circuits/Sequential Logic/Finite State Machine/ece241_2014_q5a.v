module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter START=0,S0=1,S1=2,S2=3,S3=4,S4=5;
    reg [2:0] state, next_state;
    
    always @(*) begin 
        case (state)
            START: next_state = ~x ? S1 : S0;
            S0: next_state = ~x ? S3 : S2;
            S1: next_state = ~x ? S1 : S0;
            S2: next_state = ~x ? S3 : S2;
            S3: next_state = ~x ? S3 : S2;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset) state = START;
        else state = next_state;
    end
    
    assign z = (state == S0) | (state == S3);

endmodule
