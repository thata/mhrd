module register_test;
    logic in, load, clk, out;

    REGISTER dut(in, load, clk, out);

    initial begin
        clk = 0;

        // reset to 0
        in = 0; load = 1; clk = 0; clk = 1; #10
        assert(out == 1'b0) $display("PASSED"); else $display("FAILED %b", out);

        // load が立たなければ反映されない
        in = 1; load = 0; clk = 0; clk = 1; #10
        assert(out == 1'b0) $display("PASSED"); else $display("FAILED %b", out);

        // load が立ったら反映される
        in = 1; load = 1; clk = 0; clk = 1; #10
        assert(out == 1'b1) $display("PASSED"); else $display("FAILED %b", out);

        // クロックの立下りでは更新されない
        in = 0; load = 1; clk = 0; #10
        assert(out == 1'b1) $display("PASSED"); else $display("FAILED %b", out);

        // クロックの立上がりで更新される
        clk = 1; #10
        assert(out == 1'b0) $display("PASSED"); else $display("FAILED %b", out);
    end
endmodule
