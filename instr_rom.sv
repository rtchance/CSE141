module instr_rom(
  input [15:0] PC,
  output logic [8:0] instruction
);

  logic [8:0] instructions [2**16];

  initial begin
    $readmemb("all_the_instructions.txt", instructions);
  end

  always_comb instruction = instructions[PC];


endmodule
