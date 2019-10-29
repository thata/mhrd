module MUX4B(
    input sel, 
    input [3:0] in1, in2,
    output out
);

    wire enable_in1;
    wire and1_out, and2_out;

    NOT not1(sel, enable_in1);
    AND and1(in1, enable_in1, and1_out);
    AND and2(in2, sel, and2_out);
    OR or1(and1_out, and2_out, out);
endmodule
