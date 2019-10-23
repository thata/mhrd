module HALFADDER(
    input in1, in2,
    output out, carry
);
    XOR xor1(in1, in2, out);
    AND and1(in1, in2, carry);
endmodule
