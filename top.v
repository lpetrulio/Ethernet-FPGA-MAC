module ethernet_top(
    input wire clk_in,         // Input clock from board (e.g., 12 MHz or 100 MHz raw clock)
    input wire rst_in,         // Reset input (active high)
    input wire uart_rx,        // UART RX for debug
    output wire uart_tx,       // UART TX for debug
    // MII Ethernet PHY Signals
    input wire rx_clk,
    input wire [3:0] rxd,
    input wire rx_dv,
    input wire tx_clk,
    output wire [3:0] txd,
    output wire tx_en,
    output wire mdc,
    inout wire mdio
);

    // Clock Wizard Outputs
    wire clk_100MHz;
    wire locked;
    wire rst_sync;

    // Instantiate Clock Wizard Module
    clk_wiz_0 clk_wiz_inst (
        .clk_out1(clk_100MHz), // 100MHz output clock
        .reset(rst_in),        // External reset input
        .locked(locked),       // Indicates when clock is stable
        .clk_in1(clk_in)       // Input clock from board
    );

    // Synchronized Reset (Active High Reset Only After Clock is Stable)
    assign rst_sync = ~locked; // Assert reset until clock is locked

    wire [7:0] rx_data;
    wire rx_valid;
    wire [7:0] tx_data;
    wire tx_valid;
    wire tx_ready;

    // Ethernet Frame Receiver
    ethernet_rx eth_rx (
        .clk(rx_clk),
        .rst(rst_sync),
        .rxd(rxd),
        .rx_dv(rx_dv),
        .data_out(rx_data),
        .valid_out(rx_valid)
    );

    // Ethernet Frame Transmitter
    ethernet_tx eth_tx (
        .clk(tx_clk),
        .rst(rst_sync),
        .data_in(tx_data),
        .valid_in(tx_valid),
        .ready_out(tx_ready),
        .txd(txd),
        .tx_en(tx_en)
    );

    // FIFO Buffer for RX/TX Data
    fifo_buffer fifo (
        .clk_write(rx_clk),
        .clk_read(tx_clk),
        .din(rx_data),
        .wr_en(rx_valid),
        .rd_en(tx_ready),
        .dout(tx_data),
        .full(),
        .empty()
    );

    // UART Debug Module
    uart_debug uart (
        .clk(clk_100MHz),  // Now sourced from Clock Wizard
        .rst(rst_sync),
        .rx(uart_rx),
        .tx(uart_tx),
        .data_in(rx_data),
        .valid_in(rx_valid)
    );

endmodule

