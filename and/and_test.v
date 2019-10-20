module and_test;
    reg in1, in2;
    wire out;

    AND dut(in1, in2, out);

    initial begin
        in1 = 0; in2 = 0; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED");

        in1 = 1; in2 = 0; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED");

        in1 = 0; in2 = 1; #10;
        assert(out == 0) $display("PASSED"); else $display("FAILED");

        in1 = 1; in2 = 1; #10;
        assert(out == 1) $display("PASSED"); else $display("FAILED");
    end
endmodule
