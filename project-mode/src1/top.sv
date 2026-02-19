//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 06:40:11 PM
// Design Name: 
// Module Name: top_demo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Top-Level Demonstration Module
//////////////////////////////////////////////////////////////////////////////////
// This module integrates the FSM, clock divider, LEDs, switches,
// pushbuttons. It serves as the
// top-level design for FPGA demonstration and testing.
//
//////////////////////////////////////////////////////////////////////////////////

module top (
    input  logic       clk100mhz,
    input  logic [3:0] btn,
    input  logic [1:0] sw,
    output logic [3:0] led
);

    // Already have this for clock — good
    (* keep = "true" *) logic clk_internal;
    assign clk_internal = clk100mhz;

    // Add these to make button & switch signals visible internally
    (* keep = "true" *) logic reset;
    (* keep = "true" *) logic left;
    (* keep = "true" *) logic right;
    (* keep = "true" *) logic [3:0] led_internal;

    assign reset = btn[3];
    assign left  = sw[1];
    assign right = sw[0];
    assign led_internal   = led;           // output register copy

    // Use the internal versions in the instances
    clk_div u_div (
        .clk(clk100mhz),
        .rst(reset),     // ← changed
        .clk_en(clk_en)
    );

    FSM u_fsm (
        .clk(clk100mhz),
        .reset(reset),   // ← changed
        .a(left),        // ← changed
        .b(right),       // ← changed
        .clk_en(clk_en),
        .y(led)
    );

    // Optional: if you want FSM state visible too
    // (you'll need to expose it from FSM module or use mark_debug later)
endmodule