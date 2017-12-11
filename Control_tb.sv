module control_tb;

  // clock for testing
  bit CLK;

  // DUT Input Drivers
  bit [2:0] Opcode;
  bit [2:0] Func;

  // DUT Output Drivers
  wire [2:0] ALUOp;
  wire RegWrite;
  wire MemRead;
  wire MemWrite;
  wire SetSrcReg;
  wire SetDesReg;
  wire branch;
  wire branchEq;
  wire branchLT;
  wire done;

  // Instantiate the control module (DUT)
  Control Control_DUT (
    .Opcode(Opcode),
    .Func(Func),
    .ALUOp(ALUOp),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .DesReg(DesReg),
    .SrcReg(SrcReg),
    .SetSrcReg(SetSrcReg),
    .SetDesReg(SetDesReg),
    .branch(branch),
    .branchEq(branchEq),
    .branchLT(branchLT),
    .done(done)
  );

  initial begin
  #100ns;

  // test control signals and ALU opcode for lsl
  Opcode = 3'b000;
  Func = 3'b001;
  #20ns;
 
  // test control signals and ALU opcode for lsr
  Opcode = 3'b000;
  Func = 3'b010;
  #20ns;

  // test control signals and ALU opcode for bit AND
  Opcode = 3'b000;
  Func = 3'b011;
  #20ns;

  // test control signals and ALU opcode for bit OR
  Opcode = 3'b000;
  Func = 3'b100;
  #20ns;
 
  // test control signals and ALU opcode for sub
  Opcode = 3'b000;
  Func = 3'b101;
  #20ns;

  // test control signals and ALU opcode for set equal flag
  Opcode = 3'b000;
  Func = 3'b110;
  #20ns;
  
  // test control signals and ALU opcode for set less than flag
  Opcode = 3'b000;
  Func = 3'b111;
  #20ns;

  // test control signals for setdes
  Opcode = 3'b001;
  Func = 3'b000;
  #20ns;
 
  // test control signals for setsrc
  Opcode = 3'b001;
  Func = 3'b001;
  #20ns;

  // test control signals and ALU opcode for bit NOT
  Opcode = 3'b001;
  Func = 3'b010;
  #20ns;

  // test control signals for load word
  Opcode = 3'b001;
  Func = 3'b011;
  #20ns;

  // test control signals for store word
  Opcode = 3'b001;
  Func = 3'b100;
  #20ns;
 
  // test control signals for done
  Opcode = 3'b001;
  Func = 3'b101;
  #20ns;


  $stop;
  end

  always begin
    #10ns CLK = 1;
    #10ns CLK = 0;
  end
endmodule

    