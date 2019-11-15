module cpu_test;
    logic clk;
    logic [15:0] instr, data;
    logic reset;
    logic write;
    logic [15:0] dataAddr, instrAddr, result;

    CPU dut(
        instr,
        data,
        reset,
        clk,
        write,
        dataAddr,
        instrAddr,
        result
    );

    initial begin
        clk = 0; clk = 1; #10

        $display("hello");
        #10
        $display("hello");

    end
endmodule
