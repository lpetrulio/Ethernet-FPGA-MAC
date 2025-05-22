module ethernet_tx(
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire valid_in,
    output reg ready_out,
    output reg [3:0] txd,
    output reg tx_en
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            txd <= 0;
            tx_en <= 0;
            ready_out <= 1;
        end else if (valid_in) begin
            txd <= data_in[3:0];
            tx_en <= 1;
            ready_out <= 0;
        end else begin
            tx_en <= 0;
            ready_out <= 1;
        end
    end

endmodule
