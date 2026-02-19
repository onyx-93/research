`timescale 1ns / 1ps
//======================================================
// Testbench / Stimulus Module for FSM
//======================================================
// This module generates input stimuli for the FSM,
// produces a clock and reset, and logs outputs to a file.
//======================================================

module stimulus ();

   //===================================================
   // Testbench Signals
   //===================================================
   logic        clk;     // Clock signal
   logic        a;       // Input stimulus a
   logic        b;       // Input stimulus b
   logic        reset;   // Reset signal
   logic [5:0]  y;       // FSM output

   //===================================================
   // File Handling Variables
   //===================================================
   integer handle3;      // File handle for output file
   integer desc3;        // Descriptor used for writing data

   //===================================================
   // Instantiate the Device Under Test (DUT)
   //===================================================
   FSM dut (
      clk,
      reset,
      a,
      b,
      y
   );

   //===================================================
   // Clock Generator
   //===================================================
   // Creates a free-running clock that toggles every
   // 5 ns, resulting in a 10 ns clock period
   initial begin
      clk = 1'b1;
      forever #5 clk = ~clk;
   end

   //===================================================
   // Simulation Control and File Setup
   //===================================================
   initial begin
      // Open output file to store FSM behavior
      handle3 = $fopen("fsm.out");

      // End simulation after 6000 ns
      #6000 $finish;
   end

   //===================================================
   // Output Logging
   //===================================================
   // Periodically write FSM inputs and outputs to file
   // Format:
   // reset || a b || y
   always begin
      desc3 = handle3;
      #10 $fdisplay(desc3, "%b || %b  %b || %b",
                    reset, a, b, y);
   end

   //===================================================
   // Input Stimulus Generation
   //===================================================
   // Applies a sequence of reset, a, and b values
   // to exercise different FSM paths
   initial begin

      // Apply reset at start of simulation
      #0   reset = 1'b1;
      #40  reset = 1'b0;

      // Test b = 1, a = 0 path
      #40  b = 1'b1;
      #0   a = 1'b0;

      // Test b = 0, a = 0 path
      #20  b = 1'b0;
      #0   a = 1'b0;

      // Test a = 1, b = 1 path
      #20  b = 1'b1;
      #0   a = 1'b1;

   end

endmodule
