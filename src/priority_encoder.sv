module priority_encoder (
    input  logic [3:0] req,
    output logic [1:0] index,
    output logic       valid
);

    always_comb begin
        index = 2'b00;
        valid = 1'b1;

        if (req[3])
            index = 2'd3;
        else if (req[2])
            index = 2'd2;
        else if (req[1])
            index = 2'd1;
        else if (req[0])
            index = 2'd0;
        else begin
            index = 2'd0;
            valid = 1'b0;
        end
    end

endmodule
