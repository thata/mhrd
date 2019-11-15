module DECODER(
    input logic [15:0] instr,
    output logic cToM, jmpIfZ, loadA, loadD, loadM,
    output logic op1,
    output logic [1:0] op2,
    output logic [3:0] opCode,
    output logic [14:0] constant
);

    assign cToM = instr[15];
    assign loadM = 
        (instr[15] == 1)
        ? 1
        : (instr[14:13] == 2'b10)
            ? 1
            : 0;
    assign loadA =
        (instr[15] == 1)
        ? 0 
        : (instr[14:13] == 2'b01)
            ? 1
            : 0;
    assign loadD =
        (instr[15] == 1) 
        ? 0 
        : (instr[14:13] == 2'b11)
            ? 1
            : 0;
    assign jmpIfZ =
        instr[15] == 1
        ? 0 
        : instr[5];
    assign constant = instr[14:0];
    assign op1 = instr[12];
    assign op2 = instr[11:10];
    assign opCode = instr[9:6];
endmodule
