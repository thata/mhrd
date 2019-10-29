module DEMUX(
    input in, sel,
    output logic out1, out2
);

    always_comb begin
        case (sel)
            0: begin
                out1 = in;
                out2 = 1'b0;
            end
            1: begin
                out2 = in;
                out1 = 1'b0;
            end
            default: begin
                out1 = 1'bx;
                out2 = 1'bx;
            end
        endcase
    end
endmodule
