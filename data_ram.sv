module data_ram (
  input CLK,
  input MemRead,
  input MemWrite,
  input [7:0] mem_index,
  input [7:0] write_value,
  output logic [7:0] read_value
);

logic [7:0] my_memory [0:255];

always_comb begin
  if (MemRead && !MemWrite) begin
    read_value = my_memory[mem_index];
  end
end

always_ff @(posedge CLK) begin
  if (MemWrite && !MemRead) begin
    my_memory[mem_index] <= write_value;
  end
end

endmodule
