module const_f2i_lut(
  input [2:0] input_value,
  output reg [7:0] output_value
);

  always @(input_value) begin
    case(input_value)
      0: output_value = 8'h1f;
      1: output_value = 8'd8;
      2: output_value = 8'd25;
      3: output_value = 8'hff;
      4: output_value = 8'd64;
      5: output_value = 8'd65;
      6: output_value = 8'd66;
      7: output_value = 8'd67;
    endcase
  end
endmodule
