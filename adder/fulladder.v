module FULLADDER(
    input carryIn, in1, in2,
    output out, carryOut
);
    wire halfadder1_out;
    wire halfadder1_carry;
    wire halfadder2_carry;

    HALFADDER halfadder1(in1, in2, halfadder1_out, halfadder1_carry);
    HALFADDER halfadder2(carryIn, halfadder1_out, out, halfadder2_carry);
    OR or1(halfadder1_carry, halfadder2_carry, carryOut);
endmodule
