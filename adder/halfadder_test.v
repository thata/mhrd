// HALFADDER testbench
// iverilog -g 2012 halfadder_test.v halfadder.v xor.v nand.v and.v && ./a.out
module halfadder_test;
    reg in1, in2;
    wire out, carry;

    HALFADDER dut(in1, in2, out, carry);

    initial begin
        // in1: 0, in2: 0 => out: 0, carry: 0
        in1 = 0; in2 = 0; #10;
        assert(out == 0 && carry == 0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carry);

        // in1: 1, in2: 0 => out: 1, carry: 0
        in1 = 1; in2 = 0; #10;
        assert(out == 1 && carry == 0) $display("PASSED"); else $display("FAILED");

        // in1: 0, in2: 1 => out: 1, carry: 0
        in1 = 0; in2 = 1; #10;
        assert(out == 1 && carry == 0) $display("PASSED"); else $display("FAILED");

        // in1: 1, in2: 1 => out: 0, carry: 1
        in1 = 1; in2 = 1; #10;
        assert(out == 0 && carry == 1) $display("PASSED"); else $display("FAILED");
    end
endmodule
