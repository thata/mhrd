module ADDER4B(
    input carryIn,
    input [3:0] in1, in2,
    output [3:0] out,
    output carryOut
);
    wire carry1, carry2, carry3;

    FULLADDER adder1(carryIn, in1[0], in2[0], out[0], carry1);
    FULLADDER adder2(carry1, in1[1], in2[1], out[1], carry2);
    FULLADDER adder3(carry2, in1[2], in2[2], out[2], carry3);
    FULLADDER adder4(carry3, in1[3], in2[3], out[3], carryOut);
endmodule
