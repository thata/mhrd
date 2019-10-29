// DEMUX testbench
// iverilog -g 2012 -s demux_test *.v && ./a.out
module demux_test;
    logic in, sel;
    logic out1, out2;

    DEMUX dut(in, sel, out1, out2);

    initial begin
        in = 1'b0; sel = 1'b0; #10;
        assert(out1 == 1'b0 && out2 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b)", out1, out2);

        in = 1'b1; sel = 1'b0; #10;
        assert(out1 == 1'b1 && out2 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b)", out1, out2);

        in = 1'b0; sel = 1'b1; #10;
        assert(out1 == 1'b0 && out2 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b)", out1, out2);

        in = 1'b1; sel = 1'b1; #10;
        assert(out1 == 1'b0 && out2 == 1'b1) $display("PASSED"); else $display("FAILED (%b, %b)", out1, out2);

    end
endmodule
