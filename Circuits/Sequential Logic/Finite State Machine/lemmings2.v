module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT=0, RIGHT=1, GROUND=3;
    reg [1:0] prev_state, state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT: next_state = ground ? ((bump_left) ? RIGHT : LEFT) : GROUND;
            RIGHT: next_state = ground ?  ((bump_right) ? LEFT : RIGHT) : GROUND;
            GROUND: next_state = ground ? prev_state : GROUND;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end
    
    always @(negedge ground) prev_state = state;

    assign walk_left = (state == LEFT) ? 1'b1 : 1'b0;
    assign walk_right = (state == RIGHT) ? 1'b1 : 1'b0;
    assign aaah = ~walk_left & ~walk_right;

endmodule
