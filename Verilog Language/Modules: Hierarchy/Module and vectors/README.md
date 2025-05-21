# Module shift8
You are given a module `my_dff8` with two inputs and one output (that implements a set of 8 D flip-flops). Instantiate three of them, then chain them together to make an 8-bit wide shift register of length 3. In addition, create a 4-to-1 multiplexer (not provided) that chooses what to output depending on `sel[1:0]`. The value at the input `d`, after the first, after the second, or after the third D flip-flop. (Essentially, `sel` selects how many cycles to delay the input, from zero to three clock cycles.)

The module provided to you is: `module my_dff8 ( input clk, input [7:0] d, output [7:0] q );`

The multiplexer is not provided. One possible way to write one is inside an `always` block with a `case` statement inside. (See also: [mux9to1v](https://hdlbits.01xz.net/wiki/Mux9to1v))

![Shift Register with Mux](https://hdlbits.01xz.net/mw/images/7/76/Module_shift8.png)
