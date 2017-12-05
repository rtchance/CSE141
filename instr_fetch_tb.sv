module instr_fetch_tb;

  // DUT Input Drivers
  bit CLK;
  bit Start;
  bit [15:0] Start_Address;
  bit Halt;
  bit Branch;
  bit BranchCond;
  bit [7:0] Offset;

  // DUT Output Drivers
  wire [15:0] PC;
  wire [8:0] instruction;

  instr_fetch instr_fetch_DUT(
    .CLK(CLK),
    .Start(Start),
    .Start_Address(Start_Address),
    .Halt(Halt),
    .Branch(Branch),
    .BranchCond(BranchCond),
    .Offset(Offset),
    .PC(PC)
  );

  instr_rom instr_rom_DUT(
    .PC(PC),
    .instruction(instruction)
  );

  initial begin
  #100ns;

  // This tests starting a program
  Start = 1;
  Start_Address = 16'd0;
  Halt = 0;
  Branch = 0;
  BranchCond = 0;
  Offset = 8'd0;
  #20ns;

  // Add tests forcing Branch or BranchCond, and also test for Halt
  #20ns; $stop;
  Start = 0;
  Halt = 0;
  Branch = 0;
  BranchCond = 0;
  Offset = 8'd000;
  

  end




  always begin
    // Alternate clock for 20ns period
    #10ns CLK = 1;
    #10ns CLK = 0;
  end

endmodule
