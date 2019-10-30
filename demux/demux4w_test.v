// DEMUX4W testbench
// iverilog -g 2012 -s demux4w_test *.v && ./a.out
module demux4w_test;
    logic in;
    logic [1:0] sel;
    logic out1, out2, out3, out4;

    DEMUX4W dut(in, sel, out1, out2, out3, out4);

    initial begin
        sel = 2'b00; in = 1'b0; #10;
        assert(out1 == 1'b0 && out2 == 1'b0 && out3 == 1'b0 && out4 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b, %b, %b)", out1, out2, out3, out4);

        sel = 2'b00; in = 1'b1; #10;
        assert(out1 == 1'b1 && out2 == 1'b0 && out3 == 1'b0 && out4 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b, %b, %b)", out1, out2, out3, out4);

        sel = 2'b01; in = 1'b0; #10;
        assert(out1 == 1'b0 && out2 == 1'b0 && out3 == 1'b0 && out4 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b, %b, %b)", out1, out2, out3, out4);

        sel = 2'b01; in = 1'b1; #10;
        assert(out1 == 1'b0 && out2 == 1'b1 && out3 == 1'b0 && out4 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b, %b, %b)", out1, out2, out3, out4);

        sel = 2'b10; in = 1'b0; #10;
        assert(out1 == 1'b0 && out2 == 1'b0 && out3 == 1'b0 && out4 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b, %b, %b)", out1, out2, out3, out4);

        sel = 2'b10; in = 1'b1; #10;
        assert(out1 == 1'b0 && out2 == 1'b0 && out3 == 1'b1 && out4 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b, %b, %b)", out1, out2, out3, out4);

        sel = 2'b11; in = 1'b0; #10;
        assert(out1 == 1'b0 && out2 == 1'b0 && out3 == 1'b0 && out4 == 1'b0) $display("PASSED"); else $display("FAILED (%b, %b, %b, %b)", out1, out2, out3, out4);

        sel = 2'b11; in = 1'b1; #10;
        assert(out1 == 1'b0 && out2 == 1'b0 && out3 == 1'b0 && out4 == 1'b1) $display("PASSED"); else $display("FAILED (%b, %b, %b, %b)", out1, out2, out3, out4);
    end
endmodule
