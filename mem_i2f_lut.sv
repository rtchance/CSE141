module mem_i2f_lut (
  input [5:0] input_value,
  output reg signed [8:0] output_value
);

  always @(input_value) begin
    case(input_value)
      0:  output_value = 8'd32;
      1:  output_value = 8'd6;
      2:  output_value = 8'd19;
      3:  output_value = 8'd8;
      4:  output_value = 8'd8;
      5:  output_value = 8'd69;
      6:  output_value = 8'd34;
      7:  output_value = 8'd16;
      8:  output_value = 8'd97;
      9:  output_value = -8'd32;
      10: output_value = 8'd34;
      11: output_value = 8'd13;
      12: output_value = 8'd61;
      13: output_value = 8'd59;
      14: output_value = -8'd28;
      15: output_value = 8'd41;
      16: output_value = 8'd59;
      17: output_value = 8'd52;
      18: output_value = 8'd55;
      19: output_value = 8'd56;
    endcase
  end
endmodule
