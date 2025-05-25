module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
); 

    wire [255:0] next;
    genvar i;
    generate
        for(i = 0; i < 256; i = i + 1) begin : loop
            wire [3:0] row = i[7:4];
            wire [3:0] col = i[3:0];

            wire [3:0] row_up    = (row == 0)    ? 15 : row - 1;
            wire [3:0] row_down  = (row == 15)   ? 0  : row + 1;
            wire [3:0] col_left  = (col == 0)    ? 15 : col - 1;
            wire [3:0] col_right = (col == 15)   ? 0  : col + 1;

            wire [3:0] live_neighbors;

            assign live_neighbors = 
                q[{row_up, col_left}]   + q[{row_up, col}]   + q[{row_up, col_right}] +
                q[{row, col_left}]                            + q[{row, col_right}] +
                q[{row_down, col_left}] + q[{row_down, col}] + q[{row_down, col_right}];

            assign next[i] = (live_neighbors == 2) ? q[i] :
                             (live_neighbors == 3) ? 1'b1 : 1'b0;
        end
    endgenerate

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= next;
    end
endmodule
