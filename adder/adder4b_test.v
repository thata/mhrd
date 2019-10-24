// ADDER4B testbench
// iverilog -g 2012 -s adder4b_test *.v && ./a.out 
module adder4b_test();

    reg [3:0] in1, in2;
    reg carryIn;
    wire [3:0] out;
    wire carryOut;

    ADDER4B dut(carryIn, in1, in2, out, carryOut);

    initial begin
        // carryIn: 0, in1: 0000, in2: 0000 => out: 0000, carryOut: 0
        carryIn = 0; in1 = 4'b0000; in2 = 4'b0000; #10;
        assert(out == 4'b0000 && carryOut == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 0, in1: 0101, in2: 0101 => out: 1010, carryOut: 0
        carryIn = 0; in1 = 4'b0101; in2 = 4'b0101; #10;
        assert(out == 4'b1010 && carryOut == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 0, in1: 1010, in2: 1010 => out: 0100, carryOut: 1
        carryIn = 0; in1 = 4'b1010; in2 = 4'b1010; #10;
        assert(out == 4'b0100 && carryOut == 1'b1) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 0, in1: 1111, in2: 1111 => out: 1110, carryOut: 1
        carryIn = 0; in1 = 4'b1111; in2 = 4'b1111; #10;
        assert(out == 4'b1110 && carryOut == 1'b1) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 1, in1: 0000, in2: 0000 => out: 0001, carryOut: 0
        carryIn = 1; in1 = 4'b0000; in2 = 4'b0000; #10;
        assert(out == 4'b0001 && carryOut == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 1, in1: 0101, in2: 0101 => out: 1011, carryOut: 0
        carryIn = 1; in1 = 4'b0101; in2 = 4'b0101; #10;
        assert(out == 4'b1011 && carryOut == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 1, in1: 1010, in2: 1010 => out: 0101, carryOut: 1
        carryIn = 1; in1 = 4'b1010; in2 = 4'b1010; #10;
        assert(out == 4'b0101 && carryOut == 1'b1) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);

        // carryIn: 1, in1: 1111, in2: 1111 => out: 1111, carryOut: 1
        carryIn = 1; in1 = 4'b1111; in2 = 4'b1111; #10;
        assert(out == 4'b1111 && carryOut == 1'b1) $display("PASSED"); else $display("FAILED (%b, %b)", out, carryOut);
    end
endmodule
