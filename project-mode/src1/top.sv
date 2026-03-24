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
    input  logic       clk100mhz,   // 100 MHz from board
    input  logic [3:0] btn,         // btn[3] = reset
    input  logic [1:0] sw,          // sw[1]=left (a), sw[0]=right (b)
    output logic [3:0] led
);

    logic clk_en;
    logic reset;

    assign reset = btn[3];

    // Clock divider - slow enable for FSM
    clk_div u_div (
        .clk   (clk100mhz),
        .rst   (reset),
        .clk_en(clk_en)
    );

    // FSM - only advances when clk_en is high
    FSM u_fsm (
        .clk   (clk100mhz),   // still use fast clock for flip-flops
        .reset (reset),
        .a     (sw[1]),
        .b     (sw[0]),
        .clk_en (clk_en),     // ← must be connected
        .y     (led)
    );

endmodule