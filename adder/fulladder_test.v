// FULLADDER testbench
// iverilog -g 2012 fulladder_test.v fulladder.v halfadder.v xor.v nand.v and.v or.v not.v && ./a.out
module halfadder_test;
    reg carryIn, in1, in2;
    wire out, carryOut;

    FULLADDER dut(carryIn, in1, in2, out, carryOut);

    initial begin
        // carryIn: 0, in1: 0, in2: 0 => out: 0, carryOut: 0
        carryIn = 0; in1 = 0; in2 = 0; #10;
        assert(out == 0 && carryOut == 0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 0, in1: 1, in2: 0 => out: 1, carryOut: 0
        carryIn = 0; in1 = 1; in2 = 0; #10;
        assert(out == 1 && carryOut == 0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 0, in1: 0, in2: 1 => out: 1, carryOut: 0
        carryIn = 0; in1 = 0; in2 = 1; #10;
        assert(out == 1 && carryOut == 0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 0, in1: 1, in2: 1 => out: 0, carryOut: 1
        carryIn = 0; in1 = 1; in2 = 1; #10;
        assert(out == 0 && carryOut == 1) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 1, in1: 0, in2: 0 => out: 1, carryOut: 0
        carryIn = 1; in1 = 0; in2 = 0; #10;
        assert(out == 1 && carryOut == 0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 1, in1: 1, in2: 0 => out: 0, carryOut: 1
        carryIn = 1; in1 = 1; in2 = 0; #10;
        assert(out == 0 && carryOut == 1) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 1, in1: 0, in2: 1 => out: 0, carryOut: 1
        carryIn = 1; in1 = 0; in2 = 1; #10;
        assert(out == 0 && carryOut == 1) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 1, in1: 1, in2: 1 => out: 1, carryOut: 1
        carryIn = 1; in1 = 1; in2 = 1; #10;
        assert(out == 1 && carryOut == 1) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);
    end
endmodule
