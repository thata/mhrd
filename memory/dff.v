module DFF(
    input logic in, clk,
    output logic out
);

    initial begin
        out <= 1'b0;
    end

    always_ff @(posedge clk) begin
        out <= in;
    end
endmodule
