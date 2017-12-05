module instr_fetch (
  input CLK,
  input Start,
  input [15:0] Start_Address,
  input Halt,
  input Branch,
  input BranchCond,
  input signed [7:0] Offset,
  output logic [15:0] PC
);

  always_ff @(posedge CLK) begin
    if (Start)
      PC <= Start_Address;
    else if (Halt)
      PC <= PC;
    else if (Branch || BranchCond)
      PC <= PC + Offset;
    else
      PC <= PC + 1;
  end

endmodule
