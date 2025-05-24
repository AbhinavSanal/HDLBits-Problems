module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    mod_60_BCD ss_(.clk(clk), .reset(reset), .ena(ena), .q(ss));
    mod_60_BCD mm_(.clk(clk), .reset(reset), .ena(ena & (ss == 8'h59)), .q(mm));
    
    always @(posedge clk) begin
        if (reset) begin
            hh = 8'h12;
            pm = 0;
        end
        else if(ena & (ss == 8'h59) & (mm == 8'h59)) begin
            if (hh == 8'h11) pm = ~pm;
            if (hh [3:0] == 4'h9) begin
                hh [7:4] = 4'd1;
                hh [3:0] = 4'd0;
            end
            else if (hh == 8'h12) begin
                hh = 8'h01;
            end else hh[3:0] = hh[3:0] + 1;
        end
    end

endmodule

module mod_60_BCD (
    input clk,
    input reset,
    input ena,
    output [7:0] q
);
    
    always @(posedge clk) begin
        if(reset) q <= 8'h0;
        else begin
            if(ena) begin 
                if(q[3:0] == 4'h9) begin
                    if(q[7:4] == 4'h5) q <= 8'h0;
                    else begin
                        q[7:4] <= q[7:4] + 1'h1;
                        q[3:0] <= 4'h0;
                    end 
                end
                else q[3:0] <= q[3:0] + 1'h1; 
            end
            else q <= q;
        end
    end
    
endmodule
