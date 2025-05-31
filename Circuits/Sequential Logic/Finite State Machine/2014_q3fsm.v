module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A=0,B=1,C=2,D=3,E=4;
    reg [2:0] state, next_state;
    reg [1:0] seq;
    
    
    always @(*) begin
        case (state)
            A: next_state = s ? B : A;
            B: next_state = C;
            C: next_state = D;
            D: next_state = ((~seq[1]&seq[0]&w) | (seq[1]&~seq[0]&w) | (seq[1]&seq[0]&~w)) ? E : B;
            E: next_state = C;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            seq <= 3'd0;
        end
        else begin
            state <= next_state;
            seq <= {seq , w};
        end
    end
    
    assign z = (state == E);
            
endmodule
