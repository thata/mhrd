// DECODER testbench
// iverilog -g 2012 -s decoder_test *.v && ./a.out
module decoder_test;
    logic [15:0] instr;
    logic cToM, jmpIfZ, loadA, loadD, loadM;
    logic op1;
    logic [1:0] op2;
    logic [3:0] opCode;
    logic [14:0] constant;
    
    DECODER dut(
        instr,
        cToM,
        jmpIfZ,
        loadA,
        loadD,
        loadM,
        op1,
        op2,
        opCode,
        constant
    );

    initial begin
        // instr || cToM | jmpIfZ | loadA | loadD | loadM | op1 | constant | op2 | opCode 
        // ------------------------------------------------------------------------------- 
        // 0x0000 || 0 | 0 | 0 | 0 | 0 | 0 | 0x0000 | 00 | 0000 
        instr = 16'h0000; #10
        assert(
            cToM == 0 &&
            jmpIfZ == 0 &&
            loadA == 0 &&
            loadD == 0 &&
            loadM == 0 &&
            op1 == 0 &&
            constant == 15'h0000 &&
            op2 == 2'b00 &&
            opCode == 4'b0000
        ) $display("PASSED"); else $display("FAILED %b %b %h %b %b", {cToM,jmpIfZ,loadA,loadD,loadM}, op1, constant, op2, opCode);

        // 0x8000 || 1 | 0 | 0 | 0 | 1 | 0 | 0x0000 | 00 | 0000 
        instr = 16'h8000; #10
        assert(
            cToM == 1 &&
            jmpIfZ == 0 &&
            loadA == 0 &&
            loadD == 0 &&
            loadM == 1 &&
            op1 == 0 &&
            constant == 15'h0000 &&
            op2 == 2'b00 &&
            opCode == 4'b0000
        ) $display("PASSED"); else $display("FAILED %b %b %h %b %b", {cToM,jmpIfZ,loadA,loadD,loadM}, op1, constant, op2, opCode);

        // 0xFFFF || 1 | 0 | 0 | 0 | 1 | 1 | 0x7FFF | 11 | 1111 
        instr = 16'hFFFF; #10
        assert(
            cToM == 1 &&
            jmpIfZ == 0 &&
            loadA == 0 &&
            loadD == 0 &&
            loadM == 1 &&
            op1 == 1 &&
            constant == 15'h7fff &&
            op2 == 2'b11 &&
            opCode == 4'b1111
        ) $display("PASSED"); else $display("FAILED %b %b %h %b %b", {cToM,jmpIfZ,loadA,loadD,loadM}, op1, constant, op2, opCode);

        // 0x7FFF || 0 | 1 | 0 | 1 | 0 | 1 | 0x7FFF | 11 | 1111 
        instr = 16'h7FFF; #10
        assert(
            cToM == 0 &&
            jmpIfZ == 1 &&
            loadA == 0 &&
            loadD == 1 &&
            loadM == 0 &&
            op1 == 1 &&
            constant == 15'h7fff &&
            op2 == 2'b11 &&
            opCode == 4'b1111
        ) $display("PASSED"); else $display("FAILED %b %b %h %b %b", {cToM,jmpIfZ,loadA,loadD,loadM}, op1, constant, op2, opCode);

        // 0x7C1F || 0 | 0 | 0 | 1 | 0 | 1 | 0x7C1F | 11 | 0000 
        instr = 16'h7C1F; #10
        assert(
            cToM == 0 &&
            jmpIfZ == 0 &&
            loadA == 0 &&
            loadD == 1 &&
            loadM == 0 &&
            op1 == 1 &&
            constant == 15'h7c1f &&
            op2 == 2'b11 &&
            opCode == 4'b0000
        ) $display("PASSED"); else $display("FAILED %b %b %h %b %b", {cToM,jmpIfZ,loadA,loadD,loadM}, op1, constant, op2, opCode);

        // 0x7C0F || 0 | 0 | 0 | 1 | 0 | 1 | 0x7C0F | 11 | 0000
        instr = 16'h7C0F; #10
        assert(
            cToM == 0 &&
            jmpIfZ == 0 &&
            loadA == 0 &&
            loadD == 1 &&
            loadM == 0 &&
            op1 == 1 &&
            constant == 15'h7c0f &&
            op2 == 2'b11 &&
            opCode == 4'b0000
        ) $display("PASSED"); else $display("FAILED %b %b %h %b %b", {cToM,jmpIfZ,loadA,loadD,loadM}, op1, constant, op2, opCode);
    end
endmodule
