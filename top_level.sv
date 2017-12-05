
module top_level(
  input CLK,
  input reset,
  output logic done
);

  logic branch,
        branchEq,
        branchLT;

  logic signed [15:0] offset