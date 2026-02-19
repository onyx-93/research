//======================================================
// Moore FSM for Arty A7 (4-LED Output)
//======================================================

module FSM (
    input  logic       clk,
    input  logic       reset,
    input  logic       a,
    input  logic       b,
    input  logic       clk_en,
    output logic [3:0] y
);

    // State definition
    typedef enum logic [3:0] {
        S0, S1, S2, S3,
        S4, S5, S6, S7,
        S8, S9
    } statetype;

    // === Add mark_debug here ===
    (* mark_debug = "true" *) statetype state, nextstate;

    // Optional: also mark the inputs if you want to see them clearly inside ILA
    (* mark_debug = "true" *) logic a_int, b_int;
    assign a_int = a;
    assign b_int = b;

    // State register
    always_ff @(posedge clk) begin
        if (reset)
            state <= S0;
        else if (clk_en)
            state <= nextstate;
    end

    // Next-state + output logic
    always_comb begin
        nextstate = state;
        y = 4'b0000;

        case (state)
            // ... (your existing case statements remain unchanged)
        endcase
    end

    // Optional: mark the output register too
    (* mark_debug = "true" *) logic [3:0] y_reg;
    assign y_reg = y;

endmodule
