module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter START=0,B0=1,B1=2,B2=3;
    reg [1:0] state, next_state;
    
    always @(*) begin
        case (state)
            START: next_state = x ? B0 : START;
            B0: next_state = x ? B0 : B1;
            B1: next_state = x ? B2 : START;
            B2: next_state = x ? B0 : B1;
        endcase
    end
    
    always @(posedge clk, negedge aresetn) begin
        if (~aresetn) state = START;
        else state = next_state;
    end
    
    assign z = (next_state == B2);

endmodule
