// MUX4B testbench
// iverilog -g 2012 -s mux_test *.v && ./a.out 
module mux4b_test;
    reg sel, in1, in2;
    wire out;

    MUX dut(sel, in1, in2, out);

    initial begin
        // sel: 0, in1: 0, in2: 0 => out: 0
        sel = 0; in1 = 0; in2 = 0; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 0, in1: 1, in2: 0 => out: 1
        sel = 0; in1 = 1; in2 = 0; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED (%b)", out);


        // sel: 0, in1: 1, in2: 1 => out: 1
        sel = 0; in1 = 1; in2 = 1; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 1, in1: 0, in2: 0 => out: 0
        sel = 1; in1 = 0; in2 = 0; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 1, in1: 1, in2: 0 => out: 0
        sel = 1; in1 = 1; in2 = 0; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 1, in1: 0, in2: 1 => out: 1
        sel = 1; in1 = 0; in2 = 1; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 1, in1: 1, in2: 1 => out: 1
        sel = 1; in1 = 1; in2 = 1; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED (%b)", out);
    end
endmodule
