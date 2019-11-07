// ALU4B testbench
// iverilog -g 2012 -s alu4b_test *.v && ./a.out
module alu4b_test;
    logic [3:0] opCode, in1, in2, out;
    logic zero, negative;

    logic [3:0] aaa;

    ALU4B dut(in1, in2, opCode, out, negative,zero);

    initial begin

/*
ALU4B 素子には入力データバスが 2 つ、オペコード入力バスが 1 つあります。素子はデータ入力に対して 16 種類の演算を実行可能で、結果を出力データバスに書き出します。実行する演算はオペコードバスの値で決定されます。加えて、ALU には最終結果がゼロか負かを示すフラグがあります。
オペコードバスの各ビットにはそれぞれ機能が割り当てられています:
opCode[4] -> 1 の場合、in1 をビット単位で否定
opCode[3] -> 1 の場合、in2 をビット単位で否定
opCode[2] -> 0 の場合、out = (in1 ADD in2); 1 の場合、out = (in1 NAND in2);
opCode[1] -> 1 の場合、出力をビット単位で否定
add 機能および nand 機能の適用と合わせて入出力を否定することで、例に見られるように様々な結果を得ることができます。
*/    
/*
opCode | in1 | in2 || out | zero | negative 
---------------------------------------------- 
0000 | 0011 | 0101 || 1000 | 0 | 1 // in1 + in2 
0000 | 0001 | 1111 || 0000 | 1 | 0 // オーバーフロー 
0101 | 0011 | 0101 || 0010 | 0 | 0 // in2 + in1 
1001 | 0011 | 0101 || 1110 | 0 | 1 // in1 - in2 
0010 | 0011 | 0101 || 1110 | 0 | 1 // in1 nand in2 
0011 | 0011 | 0101 || 0001 | 0 | 0 // in1 and in2 
1110 | 0011 | 0101 || 0111 | 0 | 0 // in1 or in2 
0101 | 0011 | 0000 || 1101 | 0 | 1 // -in1 
0001 | 1100 | 0000 || 0011 | 0 | 0 // not in1
*/

        // in1 + in2
        opCode = 4'b0000;
        in1 = 4'b0011;
        in2 = 4'b0101;
        #10;
        assert(
            out == 4'b1000
            && zero == 1'b0 
            && negative == 1'b1) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);

        // overflow
        opCode = 4'b0000;
        in1 = 4'b0001;
        in2 = 4'b1111;
        #10;
        assert(
            out == 4'b0000 
            && zero == 1'b1 
            && negative == 1'b0) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);

        // overflow
        opCode = 4'b0000;
        in1 = 4'b0001;
        in2 = 4'b1111;
        #10;
        assert(
            out == 4'b0000 
            && zero == 1'b1 
            && negative == 1'b0) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);

        // in2 - in1
        opCode = 4'b0101;
        in1 = 4'b0011;
        in2 = 4'b0101;
        #10;
        assert(
            out == 4'b0010 
            && zero == 1'b0 
            && negative == 1'b0) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);

        // in1 - in2
        opCode = 4'b1001;
        in1 = 4'b0011;
        in2 = 4'b0101;
        #10;
        assert(
            out == 4'b1110 
            && zero == 1'b0 
            && negative == 1'b1) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);

    end
endmodule
