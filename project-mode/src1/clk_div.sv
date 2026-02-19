//======================================================
// Clock Enable Generator (ILA-Friendly)
//======================================================

module clk_div (
    input  logic clk,
    input  logic rst,
    output logic clk_en
);

    logic [24:0] count;

    always_ff @(posedge clk) begin
        if (rst)
            count <= 0;
        else
            count <= count + 1;
    end

    // === Mark this signal ===
    (* mark_debug = "true" *) assign clk_en = (count == 25'h1FFFFFF);

endmodule