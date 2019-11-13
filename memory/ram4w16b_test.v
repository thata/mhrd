// RAM4W16B testbench
// iverilog -g 2012 -s ram4w16b_test *.v && ./a.out
module ram4w16b_test;
    logic [15:0] in, out;
    logic [1:0] addr;
    logic load, clk;

    RAM4W16B dut(in, addr, load, clk, out);

    initial begin
        clk = 0;

        // init ram to 0
        in = 16'h0000; addr = 2'b00; load = 1; clk = 0; clk = 1; #10
        in = 16'h0000; addr = 2'b01; load = 1; clk = 0; clk = 1; #10
        in = 16'h0000; addr = 2'b10; load = 1; clk = 0; clk = 1; #10
        in = 16'h0000; addr = 2'b11; load = 1; clk = 0; clk = 1; #10

        // 1. 0x5555 | 00 | 1 || 0x0000
        in = 16'h5555; addr = 2'b00; load = 1;
        assert(out == 16'h0000) $display("1 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 2. 0x0000 | 00 | 0 || 0x5555 
        in = 16'h0000; addr = 2'b00; load = 0;
        assert(out == 16'h5555) $display("2 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 3. 0x0000 | 01 | 0 || 0x0000
        in = 16'h0000; addr = 2'b01; load = 0;
        assert(out == 16'h0000) $display("3 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 4. 0xFFFF | 01 | 1 || 0x0000 
        in = 16'hffff; addr = 2'b01; load = 1;
        assert(out == 16'h0000) $display("4 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 5. 0x0000 | 01 | 0 || 0xFFFF 
        in = 16'h0000; addr = 2'b01; load = 0;
        assert(out == 16'hffff) $display("5 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 6. 0xAAAA | 10 | 1 || 0x0000 
        in = 16'haaaa; addr = 2'b10; load = 1;
        assert(out == 16'h0000) $display("6 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 7. 0x0FF0 | 11 | 1 || 0x0000 
        in = 16'h0ff0; addr = 2'b11; load = 1;
        assert(out == 16'h0000) $display("7 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 8. 0x0000 | 00 | 0 || 0x5555 
        in = 16'h0000; addr = 2'b00; load = 0;
        assert(out == 16'h5555) $display("8 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 9. 0x0000 | 01 | 0 || 0xFFFF 
        in = 16'h0000; addr = 2'b01; load = 0;
        assert(out == 16'hffff) $display("9 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 10. 0x0000 | 10 | 0 || 0xAAAA 
        in = 16'h0000; addr = 2'b10; load = 0;
        assert(out == 16'haaaa) $display("10 PASSED"); else $display("FAILED %h", out);

        clk = 0; clk = 1; #10

        // 11. 0x0000 | 11 | 0 || 0x0FF0
        in = 16'h0000; addr = 2'b11; load = 0;
        assert(out == 16'h0ff0) $display("11 PASSED"); else $display("FAILED %h", out);
    end
endmodule
