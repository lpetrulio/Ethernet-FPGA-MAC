module ethernet_rx(
    input wire clk,
    input wire rst,
    input wire [3:0] rxd,
    input wire rx_dv,
    output reg [7:0] data_out,
    output reg valid_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 0;
            valid_out <= 0;
        end else if (rx_dv) begin
            data_out <= {4'b0000, rxd}; // Expand 4-bit to 8-bit
            valid_out <= 1;
        end else begin
            valid_out <= 0;
        end
    end

endmodule
