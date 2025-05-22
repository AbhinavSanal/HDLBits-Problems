module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] prev_state;
    reg [1:0] state;
    reg [1:0] next_state;
    
    always @(posedge clk) begin
        prev_state <= state;
        if (reset) state <= A;
        else state <= next_state;
    end
    
    always @(*) begin 
        case(s)
            3'b000: next_state = A;
            3'b001: next_state = B;
            3'b011: next_state = C;
            3'b111: next_state = D;
        endcase
    end
    
    assign dfr = (state == A) ? 1'b1:
        (state == D) ? 1'b0:
        (prev_state > state) ? 1'b1 :
        (prev_state == state) ? dfr : 1'b0;
    
    
    always @(*) begin
        case(state)
            A:{fr1, fr2, fr3} = 3'b111;
            B:{fr1, fr2, fr3} = 3'b110;
            C:{fr1, fr2, fr3} = 3'b100;
            D:{fr1, fr2, fr3} = 3'b000;
        endcase
    end
    
    
endmodule
