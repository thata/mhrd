// COUNTER4B testbench
// iverilog -g 2012 -s counter4b_test *.v && ./a.out
module counter4b_test;
    logic [3:0] in, out;
    logic load, reset, clk;

    COUNTER4B dut(in, load, reset, clk, out);

    initial begin
        clk = 0;

        // reset to 0
        reset = 1; clk = 0; clk = 1; #10
        assert(out == 4'b0000) $display("PASSED"); else $display("FAILED %b", out);

        // count up
        in = 4'b0000; load = 0; reset = 0; clk = 0; clk = 1; #10
        assert(out == 4'b0001) $display("PASSED"); else $display("FAILED %b", out);

        // count up
        clk = 0; clk = 1; #10
        assert(out == 4'b0010) $display("PASSED"); else $display("FAILED %b", out);

        // in をセットしても load が立たなければ count up
        in = 4'b0101; load = 0; reset = 0; clk = 0; clk = 1; #10
        assert(out == 4'b0011) $display("PASSED"); else $display("FAILED %b", out);

        // load が立っていれば in の値をセット
        in = 4'b0101; load = 1; reset = 0; clk = 0; clk = 1; #10
        assert(out == 4'b0101) $display("PASSED"); else $display("FAILED %b", out);

        // reset と load の両方が立っていたら、reset を優先
        in = 4'b1010; load = 1; reset = 1; clk = 0; clk = 1; #10
        assert(out == 4'b0000) $display("PASSED"); else $display("FAILED %b", out);

        // 1111 -> 0000 -> 0001  
        in = 4'b1111; load = 1; reset = 0; clk = 0; clk = 1; #10
        assert(out == 4'b1111) $display("PASSED"); else $display("FAILED %b", out);
        load = 0; clk = 0; clk = 1; #10
        assert(out == 4'b0000) $display("PASSED"); else $display("FAILED %b", out);
        clk = 0; clk = 1; #10
        assert(out == 4'b0001) $display("PASSED"); else $display("FAILED %b", out);
    end
endmodule
