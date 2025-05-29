module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter START=0,B0=1,B1=2,B2=3,B3=4,B4=5,B5=6,DISC=7,FLAG=8,ERROR=9;
    reg [3:0] state, next_state;
    
    always @(*) begin
        case(state)
            START: next_state = in ? B0 : START;
            B0: next_state = in ? B1 : START;
            B1: next_state = in ? B2 : START;
            B2: next_state = in ? B3 : START;
            B3: next_state = in ? B4 : START;
            B4: next_state = in ? B5 : DISC;
            B5: next_state = in ? ERROR : FLAG;
            DISC: next_state = 	in ? B0 : START;
            FLAG: next_state = 	in ? B0 : START;
            ERROR: next_state = in ? ERROR : START;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state = START;
        else state = next_state;
    end
    
    assign disc = (state == DISC);
    assign flag = (state == FLAG);
    assign err = (state == ERROR);

endmodule
