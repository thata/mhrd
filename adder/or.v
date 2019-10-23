module OR(
  input in1, in2,
  output out
);
  wire not1_out, not2_out;

  NOT not1(in1, not1_out);
  NOT not2(in2, not2_out);
  NAND nand1(not1_out, not2_out, out);
endmodule
