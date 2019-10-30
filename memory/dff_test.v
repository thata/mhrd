module dff_test;
    logic in, clk, out;

    DFF dut(in, clk, out);

    initial begin
        clk = 0; in = 0; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED (%b)", out);

        clk = 0; in = 1; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED (%b)", out);

        // 1 をセット
        clk = 1; in = 1; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED (%b)", out);

        clk = 1; in = 0; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED (%b)", out);

        clk = 0; in = 0; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED (%b)", out);

        // 0 をセット
        clk = 1; in = 0; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED (%b)", out);

        clk = 1; in = 1; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED (%b)", out);

        clk = 0; in = 1; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED (%b)", out);

        // 1 をセット
        clk = 1; in = 1; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED (%b)", out);
    end
endmodule
