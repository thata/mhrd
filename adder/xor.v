module XOR(
    input in1, in2,
    output out
);

    wire nand1_out, nand2_out, nand3_out;

    NAND nand1(in1, in2, nand1_out);
    NAND nand2(nand1_out, in1, nand2_out);
    NAND nand3(nand1_out, in2, nand3_out);
    NAND nand4(nand2_out, nand3_out, out);
endmodule
