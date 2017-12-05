module reg_file (
  // Clock Input
  input CLK,
  // Control Signal Inputs
  input REGWRITE,
  input SETSRC,
  input SETDEST,
  input MOV,
  // Other Inputs
  input [2:0] rt_index,
  input [7:0] write_value,
  // Outputs of rs and rt register values
  output logic [7:0] rs,
  output logic [7:0] rt
);

  logic [7:0] registers [16];
  logic [2:0] src_register;
  logic [2:0] dest_register;

  always_comb rs = registers[src_register];
  always_comb rt = registers[rt_index];

  always_ff @ (posedge CLK) begin
    if (REGWRITE && !SETSRC && !SETDEST && !MOV) begin
      registers[dest_register] <= write_value;
    end
    else if (REGWRITE && !SETSRC && !SETDEST && MOV) begin
      registers[7] <= write_value;
    end
    else if (!REGWRITE && SETSRC && !SETDEST && !MOV) begin
      src_register <= rt_index;
    end
    else if (!REGWRITE && !SETSRC && SETDEST && !MOV) begin
      dest_register <= rt_index;
    end
  end


endmodule
