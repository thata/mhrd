/*
ALU4B 素子には入力データバスが 2 つ、オペコード入力バスが 1 つあります。素子はデータ入力に対して 16 種類の演算を実行可能で、結果を出力データバスに書き出します。実行する演算はオペコードバスの値で決定されます。加えて、ALU には最終結果がゼロか負かを示すフラグがあります。
オペコードバスの各ビットにはそれぞれ機能が割り当てられています:
opCode[4] -> 1 の場合、in1 をビット単位で否定
opCode[3] -> 1 の場合、in2 をビット単位で否定
opCode[2] -> 0 の場合、out = (in1 ADD in2); 1 の場合、out = (in1 NAND in2);
opCode[1] -> 1 の場合、出力をビット単位で否定
add 機能および nand 機能の適用と合わせて入出力を否定することで、例に見られるように様々な結果を得ることができます。
*/
module ALU4B(
    input logic [3:0] in1, in2, opCode,
    output logic [3:0] out,
    output negative, zero
);

    logic [3:0] in1Selector, in2Selector, outSelector;

    assign in1Selector = opCode[3] ? ~in1 : in1;
    assign in2Selector = opCode[2] ? ~in2 : in2;
    assign outSelector = (opCode[1]) ?
                            ~(in1Selector & in2Selector) :
                            in1Selector + in2Selector;
    assign out = opCode[0] ? ~outSelector : outSelector;
    assign negative = out[3];
    assign zero = ~|out;
endmodule
