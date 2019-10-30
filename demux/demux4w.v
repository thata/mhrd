module DEMUX4W(
    input in,
    input [1:0] sel,
    output logic out1, out2, out3, out4
);

    always_comb begin
        case (sel)
            2'b00: begin
                out1 = in;
                out2 = 1'b0;
                out3 = 1'b0;
                out4 = 1'b0;
            end
            2'b01: begin
                out1 = 1'b0;
                out2 = in;
                out3 = 1'b0;
                out4 = 1'b0;
            end
            2'b10: begin
                out1 = 1'b0;
                out2 = 1'b0;
                out3 = in;
                out4 = 1'b0;
            end
            2'b11: begin
                out1 = 1'b0;
                out2 = 1'b0;
                out3 = 1'b0;
                out4 = in;
            end
            default: begin
                out1 = 1'bx;
                out2 = 1'bx;
                out3 = 1'bx;
                out4 = 1'bx;
            end
        endcase
    end
endmodule
