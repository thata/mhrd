module not_test();
    reg in;
    wire out;

    NOT dut(in, out);

    initial begin
        in = 0; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED");

        in = 1; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED");
    end
endmodule
