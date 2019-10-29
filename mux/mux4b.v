module MUX4B(
    input sel, 
    input [3:0] in1, in2,
    output logic[3:0] out
);

    always_comb begin
        case (sel)
            0: out = in1;
            1: out = in2;
        endcase
    end
endmodule
