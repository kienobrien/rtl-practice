`timescale 1ns/1ps

module tb_counter;

    localparam int WIDTH = 4;

    logic clk = 0;
    logic rst;
    logic enable;
    logic [WIDTH-1:0] count;

    counter #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        enable = 0;
        repeat (2) @(posedge clk);

        @(negedge clk);
        rst = 0;
        enable = 1;
        repeat (5) @(posedge clk);

        @(negedge clk);
        enable = 0;
        repeat (2) @(posedge clk);

        if (count !== 4'd5) begin
            $fatal(1, "Expected count=5, got %0d", count);
        end

        $display("PASS: counter test");
        $finish;
    end

endmodule
