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
    
    always @(*) begin
        case(state)
            LEFT: next_state = ground ? (dig ? DIG : (bump_left ? RIGHT : LEFT)) : FALL;
            RIGHT: next_state = ground ? (dig ? DIG : (bump_right ? LEFT : RIGHT)) : FALL;
            FALL: next_state = ground ? ((fall_count > 20) ? SPLAT : prev_state) : FALL;
            DIG: next_state = ground ? DIG : FALL;
            SPLAT: next_state = SPLAT;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset) state = LEFT;
        else begin
                if((state == LEFT | state == RIGHT) & (dig | ~ground))
                    prev_state = state;
        end
        state = next_state;
    end
   
    always @(posedge clk) begin
        if(state == FALL & next_state == FALL) fall_count = fall_count + 1;
        else fall_count = 0;
    end
    
    assign walk_left = (state == LEFT) ? 1'b1 : 1'b0;
    assign walk_right = (state == RIGHT) ? 1'b1 : 1'b0;
    assign aaah = (state == FALL) ? 1'b1 : 1'b0;
    assign digging = (state == DIG) ? 1'b1 : 1'b0; 
    
endmodule
