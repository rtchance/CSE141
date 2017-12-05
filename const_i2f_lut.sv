module const_i2f_lut(
  input [2:0] input_value,
  output reg [7:0] output_value
);

  always @(input_value) begin
    case(input_value)
      0: output_value = 8'd1;
      1: output_value = 8'd2;
      2: output_value = 8'd15;
      3: output_value = 8'hff;
      4: output_value = 8'h7f;
      5: output_value = 8'd10;
      6: output_value = 8'd6;
      7: output_value = 8'd5;
    endcase
  end
endmodule
