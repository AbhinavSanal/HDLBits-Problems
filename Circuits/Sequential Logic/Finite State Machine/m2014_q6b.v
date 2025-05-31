module top_module (
    input [3:1] y,
    input w,
    output Y2);

    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    
    always @(*) begin
        case (y[3:1])
            A: Y2 = 1'b0;
            B: Y2 = 1'b1;
            C: Y2 = w ? 1'b1 : 1'b0;
            D: Y2 = 1'b0;
            E: Y2 = w ? 1'b1 : 1'b0;
            F: Y2 = 1'b1;
        endcase
    end
    
endmodule
