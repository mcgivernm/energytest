module tt_um_vedm_industries (
    input wire [7:0] ui_in,
    output wire [7:0] uo_out,
    /* verilator lint_off UNUSEDSIGNAL /
    input wire [7:0] uio_in,
    / verilator lint_on UNUSEDSIGNAL /
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input wire ena,
    input wire clk,
    input wire rst_n
);

    wire [7:0] converted_voltage;  // Wire to store the output of the power converter

    // Instantiate power converter
    power_converter pc (
        .clk(clk),
        .rst_n(rst_n),
        .ui_in(ui_in),
        .uo_out(converted_voltage)  // Connect the output to converted_voltage wire
    );

    // Instantiate data collector
    data_collector dc (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(converted_voltage),  // Use converted_voltage as input
        .data_out(uo_out)              // Output to uo_out
    );

endmodule
