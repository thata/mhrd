module CPU(
    input logic [15:0] instr, data,
    input logic reset, clk,
    output logic write,
    output logic [15:0] dataAddr, instrAddr, result
);
    // parts
    ALU16B alu(
        .in1(ar),
        .in2(ar),
        .out(result)
    );

    DECODER decoder(
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

    // registers
    logic [15:0] ar, mr, pc;

    // wires
    logic cToM, jmpIfZ, loadA, loadD, loadM;
    logic op1;
    logic [1:0] op2;
    logic [3:0] opCode;
    logic [14:0] constant;

    assign dataAddr = mr;
    assign instrAddr = pc;
    assign write = 0;
    assign loadM_out = loadM;

    always_ff @(posedge clk) begin
        if (reset)
            pc <= 16'h0000;
        else
            pc <= pc + 1;

        if (loadM) mr <= 16'hFFFF;
    end
endmodule
