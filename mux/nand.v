module NAND(
  input in1, in2,
  output out
);

  assign out = ~(in1 & in2);
endmodule
