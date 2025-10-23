//============================================================
// top.sv -- Simple inverter using one pushbutton and one LED
// Board: Arty A7-100T
//============================================================

module top (
    input  logic btn,   // Push button input
    output logic led    // LED output
);

    // LED is ON when button is NOT pressed
    assign led = ~btn;

endmodule
