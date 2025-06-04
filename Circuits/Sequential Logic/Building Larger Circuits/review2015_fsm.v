module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    parameter A=0,B=1,C=2,D=3,E=4,F=5,G=6;
    reg [2:0] state, next_state;
    
    always @(*) begin
        case(state)
            A: next_state = data ? B : A;
            B: next_state = data ? C : A;
            C: next_state = data ? C : D;
            D: next_state = data ? E : A;
            E: next_state = (counter == 3'd3) ? F : E;
            F: next_state = done_counting ? G : F;
            G: next_state = ack ? A : G;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state = A;
        else state = next_state;
    end
    
    reg [3:0] counter;
    
    always @(posedge clk) begin
        if (reset | (state == A)) counter = 3'd0;
        else if (counter < 3'd4 && state == E) counter = counter + 1'd1;
    end
    
    assign shift_ena = (counter < 3'd4) & (state == E);
    assign counting = (state == F);
    assign done = (state == G);
    
endmodule
