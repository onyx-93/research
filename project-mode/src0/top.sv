//============================================================
// top.sv -- Simple inverter using one pushbutton and one LED
// Board: Arty A7-100T
//============================================================

module top (
    input  logic clk100mhz,
    input  logic btn,   // Push button input
    output logic led    // LED output
);

    (* mark_debug="true" *) logic CLK;
    assign CLK = clk100mhz;
    // LED is ON when button is NOT pressed
    // instantiate dut
    inverter dut (btn, led);

endmodule


