`timescale 1ns/1ps

module tb_inverter;

    // Testbench signals
    logic a;
    logic y;

    // Instantiate the inverter (Device Under Test)
    inverter dut (
        .a(a),
        .y(y)
    );

    // Generate stimulus
    initial begin
        $display("Time(ns) | a | y");
        $display("-----------------");

        a = 0; #10;
        $display("%4t     | %0b | %0b", $time, a, y);

        a = 1; #10;
        $display("%4t     | %0b | %0b", $time, a, y);

        a = 0; #10;
        $display("%4t     | %0b | %0b", $time, a, y);

        a = 1; #10;
        $display("%4t     | %0b | %0b", $time, a, y);

        $finish;
    end

endmodule
