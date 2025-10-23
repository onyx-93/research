module inverter (
    input logic a,
    output logic y
);
assign y = ~a; // output is the inverse of input
endmodule