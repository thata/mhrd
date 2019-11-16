module CPU(
    input logic [15:0] instr, data,
    input logic reset, clk,
    output logic write,
    output logic [15:0] dataAddr, instrAddr, result
);
    // parts
    ALU16B alu(
        .in1(aluIn1Sel),
        .in2(aluIn2Sel),
        .opCode(opCode),
        .out(result),
        .zero(aluZero)
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
    logic [15:0] aluIn1Sel, aluIn2Sel;
    logic aluZero;

    assign dataAddr = mr;
    assign instrAddr = pc;
    assign write = loadD;
    assign aluIn1Sel = (op1 == 1) 
                       ? {{11{constant[4]}}, constant[4:0]}
                       : ar;
    assign aluIn2Sel = (op2 == 2'b00)
                       ? {{11{constant[4]}}, constant[4:0]}
                       : (op2 == 2'b01)
                         ? ar
                         : (op2 == 2'b10)
                           ? mr
                           : data;

    always_ff @(posedge clk) begin
        if (reset)
            pc <= 16'h0000;
        else if (jmpIfZ && aluZero)
            pc <= mr;
        else
            pc <= pc + 1;

        if (loadM) begin
            if (cToM)
                mr <= constant;
            else
                mr <= result;
        end

        if (loadA) ar <= result;
    end
endmodule
