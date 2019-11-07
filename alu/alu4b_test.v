// ALU4B testbench
// iverilog -g 2012 -s alu4b_test *.v && ./a.out
module alu4b_test;
    logic [3:0] opCode, in1, in2, out;
    logic zero, negative;

    logic [3:0] aaa;

    ALU4B dut(in1, in2, opCode, out, negative,zero);

    initial begin
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

        // in1 nand in2
        opCode = 4'b0010;
        in1 = 4'b0011;
        in2 = 4'b0101;
        #10;
        assert(
            out == 4'b1110 
            && zero == 1'b0 
            && negative == 1'b1) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);

        // in1 and in2
        opCode = 4'b0011;
        in1 = 4'b0011;
        in2 = 4'b0101;
        #10;
        assert(
            out == 4'b0001 
            && zero == 1'b0 
            && negative == 1'b0) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);

        // in1 or in2
        opCode = 4'b1110;
        in1 = 4'b0011;
        in2 = 4'b0101;
        #10;
        assert(
            out == 4'b0111 
            && zero == 1'b0 
            && negative == 1'b0) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);
        
        // - in1
        opCode = 4'b0101;
        in1 = 4'b0011;
        in2 = 4'b0000;
        #10;
        assert(
            out == 4'b1101 
            && zero == 1'b0 
            && negative == 1'b1) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);
        
        // not in1
        opCode = 4'b0001;
        in1 = 4'b1100;
        in2 = 4'b0000;
        #10;
        assert(
            out == 4'b0011 
            && zero == 1'b0 
            && negative == 1'b0) $display("."); else $display("FAILED (%b, %b, %b)", out, zero, negative);
    end
endmodule
