// the code is not complete

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT=0, RIGHT=1, FALL=2, DIG=3, SPLAT=4;
    reg [2:0] prev_state, state, next_state;
    reg [4:0] fall_count;
    
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= LEFT;
            prev_state <= LEFT;
        end else begin
            // Store previous walking state before DIG or FALL
            if(state == FALL & (next_state == FALL | next_state == SPLAT)) fall_count = fall_count + 1'd1;
 	        else fall_count = 5'd0;
            if ((state == LEFT | state == RIGHT) & dig)
                prev_state <= state;
            state <= next_state;
        end
    end
    
    always @(*) begin
        case(state)
            LEFT: next_state = ground ? (dig ? DIG : (bump_left ? RIGHT : LEFT)) : FALL;
            RIGHT: next_state = ground ? (dig ? DIG : (bump_right ? LEFT : RIGHT)) : FALL;
            FALL: next_state = ground ? (fall_count < 5'd20 ? prev_state : SPLAT) : FALL;
            DIG: next_state = ground ? DIG : FALL;
            SPLAT: next_state = SPLAT;
        endcase
    end
   
    assign walk_left = (state == LEFT) ? 1'b1 : 1'b0;
    assign walk_right = (state == RIGHT) ? 1'b1 : 1'b0;
    assign aaah = ~walk_left & ~walk_right & ~digging;
    assign digging = (state == DIG) ? 1'b1 : 1'b0;

endmodule

