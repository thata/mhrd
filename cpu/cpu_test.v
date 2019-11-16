module cpu_test;
    logic clk;
    logic [15:0] instr, data;
    logic reset;
    logic write;
    logic [15:0] dataAddr, instrAddr, result;

    CPU dut(
        instr,
        data,
        reset,
        clk,
        write,
        dataAddr,
        instrAddr,
        result
    );

    initial begin
        clk = 0;
        
        // instr | data | reset || instrAddr | dataAddr | result | write 
        // ----------------------------------------------------------------- 
        // // result = const + AR = ? (レジスター状態が不明): 
        // 0x0000 | 0x0000 | 0 || x | x | x | 0 
        instr = 16'h0000; data = 16'h0000; reset = 0; #10
        assert(
            instrAddr === 16'hxxxx &&
            dataAddr === 16'hxxxx &&
            result === 16'hxxxx &&
            write === 0
        ) $display("1 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;

        // // プログラムカウンターをリセットする 
        // 0x0000 | 0x0000 | 1 || x | x | x | 0 
        instr = 16'h0000; data = 16'h0000; reset = 1; #10
        assert(
            instrAddr === 16'hxxxx &&
            dataAddr === 16'hxxxx &&
            result === 16'hxxxx &&
            write === 0
        ) $display("2 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;

        // // 0x00FF を MR にロードする: 
        // 0x80FF | 0x0000 | 0 || 0x0000 | x | x | 0 
        instr = 16'h80FF; data = 16'h0000; reset = 0; #10
        assert(
            instrAddr === 16'h0000 &&
            dataAddr === 16'hxxxx &&
            result === 16'hxxxx &&
            write === 0
        ) $display("3 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;

        // // AR = const + data = 1 + 0 = 1: 
        // 0x3C01 | 0x0000 | 0 || 0x0001 | 0x00FF | 0x0001 | 0 
        instr = 16'h3C01; data = 16'h0000; reset = 0; #10
        assert(
            instrAddr === 16'h0001 &&
            dataAddr === 16'h00FF &&
            result === 16'h0001 &&
            write === 0
        ) $display("4 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;

        // // result = AR + const = 1: 
        // 0x0000 | 0x0000 | 0 || 0x0002 | 0x00FF | 0x0001 | 0 
        instr = 16'h0000; data = 16'h0000; reset = 0; #10
        assert(
            instrAddr === 16'h0002 &&
            dataAddr === 16'h00FF &&
            result === 16'h0001 &&
            write === 0
        ) $display("5 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;


        // // MR = AR + const = 1: 
        // 0x4000 | 0x0000 | 0 || 0x0003 | 0x00FF | 0x0001 | 0 
        instr = 16'h4000; data = 16'h0000; reset = 0; #10
        assert(
            instrAddr === 16'h0003 &&
            dataAddr === 16'h00FF &&
            result === 16'h0001 &&
            write === 0
        ) $display("6 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;

        // // data = const + MR = 1: 
        // 0x7800 | 0x0000 | 0 || 0x0004 | 0x0001 | 0x0001 | 1 
        instr = 16'h7800; data = 16'h0000; reset = 0; #10
        assert(
            instrAddr === 16'h0004 &&
            dataAddr === 16'h0001 &&
            result === 16'h0001 &&
            write === 1
        ) $display("7 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;

        // // MR を PC にロードする: 
        // 0x1020 | 0x0001 | 0 || 0x0005 | 0x0001 | 0x0000 | 0 
        instr = 16'h1020; data = 16'h0001; reset = 0; #10
        assert(
            instrAddr === 16'h0005 &&
            dataAddr === 16'h0001 &&
            result === 16'h0000 &&
            write === 0
        ) $display("8 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;

        // // ノーオペ: 
        // 0x1000 | 0x0001 | 0 || 0x0001 | 0x0001 | 0x0000 | 0 
        instr = 16'h1000; data = 16'h0001; reset = 0; #10
        assert(
            instrAddr === 16'h0001 &&
            dataAddr === 16'h0001 &&
            result === 16'h0000 &&
            write === 0
        ) $display("9 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);

        clk = 1'b0; clk = 1'b1; #10;

        // // ノーオペ: 
        // 0x1000 | 0x0001 | 0 || 0x0002 | 0x0001 | 0x0000 | 0
        instr = 16'h1000; data = 16'h0001; reset = 0; #10
        assert(
            instrAddr === 16'h0002 &&
            dataAddr === 16'h0001 &&
            result === 16'h0000 &&
            write === 0
        ) $display("10 PASSED"); else $display("FAILED %h %h %h %b", instrAddr, dataAddr, result, write);
    end
endmodule
