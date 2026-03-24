// Generates a slow enable pulse approximately every 0.335 seconds
// at 100 MHz clock (good visible speed for LEDs)

module clk_div (
    input  logic clk,
    input  logic rst,
    output logic clk_en
);

    logic [24:0] count;

    always_ff @(posedge clk) begin
        if (rst)
            count <= 25'd0;
        else
            count <= count + 1;
    end

    assign clk_en = (count == 25'h1FFFFFF); // 33,554,431 → ~0.335 sec at 100 MHz

endmodule