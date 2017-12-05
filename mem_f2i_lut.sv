module mem_f2i_lut(
  input [5:0] input_value,
  output reg [7:0] output_value
);
 
  always @(input_value) begin
    case(input_value)
      0:  output_value = 8'd3;
      1:  output_value = 8'd71;
      2:  output_value = 8'd18;
      3:  output_value = 8'd115;
      4:  output_value = 8'd35;
      5:  output_value = 8'd31;
      6:  output_value = 8'd89;
      7:  output_value = 8'd31;
      8:  output_value = 8'd17;
      9:  output_value = 8'd5;
      10: output_value = 8'd8;
      11: output_value = 8'd14;
      12: output_value = 8'd2;
      13: output_value = 8'd5;
    endcase
  end
endmodule
