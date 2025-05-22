module uart_debug #(
    parameter BAUD_RATE = 115200,
    parameter CLK_FREQ = 100000000 // FPGA clock = 100 MHz
)(
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire valid_in,
    output reg tx
);

    localparam integer CLK_DIV = CLK_FREQ / BAUD_RATE;
    reg [15:0] clk_count = 0;
    reg [9:0] shift_reg;
    reg [3:0] bit_index;
    reg sending;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1; // Idle state is HIGH
            sending <= 0;
            bit_index <= 0;
            clk_count <= 0;
        end else if (valid_in && !sending) begin
            // Start transmission
            shift_reg <= {1'b1, data_in, 1'b0}; // Stop bit (1) + Data (8) + Start bit (0)
            sending <= 1;
            bit_index <= 0;
            clk_count <= 0;
        end else if (sending) begin
            if (clk_count == CLK_DIV) begin
                clk_count <= 0;
                tx <= shift_reg[bit_index]; // Send each bit
                bit_index <= bit_index + 1;

                if (bit_index == 9) begin
                    sending <= 0; // Transmission complete
                end
            end else begin
                clk_count <= clk_count + 1;
            end
        end
    end

endmodule
