`timescale 1ns / 1ps

module tb_inverter;

    logic a;
    logic y;
    logic clk;

    // Instantiate DUT (device under test)
    inverter dut (
        .a(a),
        .y(y)
    );

    // 20 ns clock -> toggles every 10 ns
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end

    // Stimulus process
    initial begin
        // Initialize inputs
        a = 1'b0;

        // Display header
        $display("Time | clk | a | y");
        $display("------------------");

        // Apply test cases
        #20 a = 1'b1;
        #20 a = 1'b0;
        #20 a = 1'b1;
        #20 a = 1'b0;

        #20 $finish;
    end

    // Monitor signals
    always @(a or y or clk) begin
        $display("%4t |  %0b  | %0b | %0b", $time, clk, a, y);
    end

endmodule
