// MUX4B testbench
// iverilog -g 2012 -s mux4b_test *.v && ./a.out
module mux4b_test;
    logic sel;
    logic [3:0] in1, in2, out;

    MUX4B dut(sel, in1, in2, out);

    initial begin
        // sel: 0, in1: 0000, in2: 0000 => out: 0000
        sel = 0; in1 = 4'b0000; in2 = 4'b0000; #10;
        assert(out == 4'b0000) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 0, in1: 0001, in2: 0010 => out: 0001
        sel = 0; in1 = 4'b0001; in2 = 4'b0010; #10;
        assert(out == 4'b0001) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 0, in1: 1111, in2: 0010 => out: 1111
        sel = 0; in1 = 4'b1111; in2 = 4'b0010; #10;
        assert(out == 4'b1111) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 1, in1: 0000, in2: 0000 => out: 0000
        sel = 1; in1 = 4'b0000; in2 = 4'b0000; #10;
        assert(out == 4'b0000) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 1, in1: 0000, in2: 0001 => out: 0001
        sel = 1; in1 = 4'b0000; in2 = 4'b0001; #10;
        assert(out == 4'b0001) $display("PASSED"); else $display("FAILED (%b)", out);

        // sel: 1, in1: 0000, in2: 1111 => out: 1111
        sel = 1; in1 = 4'b0010; in2 = 4'b1111; #10;
        assert(out == 4'b1111) $display("PASSED"); else $display("FAILED (%b)", out);
    end
endmodule
