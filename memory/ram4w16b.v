module RAM4W16B(
    input logic [15:0] in,
    input logic [1:0] addr,
    input logic load, clk,
    output logic [15:0] out 
);

    logic [15:0] ram [0:3];

    always_ff @(posedge clk) begin
        if (load) ram[addr] <= in;
    end

    assign out = ram[addr];
endmodule
