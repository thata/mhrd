// XOR testbench
// iverilog -g 2012 xor_test.v xor.v nand.v && ./a.out 
module xor_test;
    reg in1, in2;
    wire out;

    XOR dut(in1, in2, out);

    initial begin
        // 0, 0 => 0
        in1 = 0; in2 = 0; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED");

        // 0, 1 => 1
        in1 = 1; in2 = 0; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED");

        // 1, 0 => 1
        in1 = 0; in2 = 1; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED");

        // 1, 1 => 0
        in1 = 1; in2 = 1; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED");
    end
endmodule
