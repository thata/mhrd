module REGISTER(
    input logic in, load, clk,
    output logic out
);

    always_ff @(posedge clk) begin
        if (load) out <= in;
    end
endmodule
