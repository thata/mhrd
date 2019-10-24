module AND(
  input in1, in2,
  output out
);

  wire nand1_out;

  NAND nand1(in1, in2, nand1_out);

  assign out = ~nand1_out;
endmodule

