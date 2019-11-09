module COUNTER4B(
    input logic [3:0] in,
    input logic load, reset, clk,
    output logic [3:0] out
);

    always_ff @(posedge clk) begin
        if (reset)
            out <= 0;
        else if (load)
            out <= in;
        else
            out <= out + 1;
    end
endmodule
