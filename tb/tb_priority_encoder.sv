`timescale 1ns/1ps

module tb_priority_encoder;

    logic [3:0] req;
    logic [1:0] index;
    logic valid;

    priority_encoder dut (
        .req(req),
        .index(index),
        .valid(valid)
    );

    task automatic check(
        input logic [3:0] test_req,
        input logic [1:0] expected_index,
        input logic expected_valid
    );
        req = test_req;
        #1;

        if (index !== expected_index || valid !== expected_valid) begin
            $error(
                "req=%b expected index=%0d valid=%0b, got index=%0d valid=%0b",
                req, expected_index, expected_valid, index, valid
            );
            $finish;
        end
    endtask

    initial begin
        check(4'b0000, 2'd0, 1'b0);
        check(4'b0001, 2'd0, 1'b1);
        check(4'b0010, 2'd1, 1'b1);
        check(4'b0101, 2'd2, 1'b1);
        check(4'b1111, 2'd3, 1'b1);

        $display("PASS: priority encoder test");
        $finish;
    end

endmodule
