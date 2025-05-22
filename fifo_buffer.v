module fifo_buffer #(
    parameter DEPTH = 32,
    parameter WIDTH = 8
)(
    input wire clk_write,
    input wire clk_read,
    input wire wr_en,
    input wire rd_en,
    input wire [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout,
    output reg full,
    output reg empty
);

    reg [WIDTH-1:0] buffer [DEPTH-1:0];
    reg [4:0] write_ptr, read_ptr, count;

    always @(posedge clk_write) begin
        if (wr_en && !full) begin
            buffer[write_ptr] <= din;
            write_ptr <= write_ptr + 1;
            count <= count + 1;
        end
    end

    always @(posedge clk_read) begin
        if (rd_en && !empty) begin
            dout <= buffer[read_ptr];
            read_ptr <= read_ptr + 1;
            count <= count - 1;
        end
    end

    assign full = (count == DEPTH);
    assign empty = (count == 0);

endmodule
