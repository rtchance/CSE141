
module top_level(
  input CLK,
  input reset,
  output logic done
);

  parameter IW = 16;
  logic branch,
        branchCond;
  logic signed [15:0] Offset;
  logic Halt;
  wire [15:0] PC;
  wire [8:0] instruction;
  wire [7:0] reg_rs;
  wire [7:0] reg_rt;
  wire [7:0] ALU_output;
  wire [15:0] Start_Address = 16'd0;
  logic start;

  logic SETSRC,
        SETDEST,
        REGWRITE,
        MOV,
        MemWrite,
        MemRead;

  wire [7:0] reg_rs;
  wire [7:0] reg_rt;
  wire [2:0] rt_index;
  wire [7:0] write_value;
  wire [5:0] LUT_MEM_INDEX;
  wire [7:0] LUT_MEM_VALUE;

  wire [2:0] LUT_CONST_INDEX;
  wire [7:0] LUT_CONST_VALUE;

  wire [2:0] ALUop;
  logic equalFlag;
  logic lessThanFlag;

  instr_fetch (
    .CLK(CLK),
    .PC(PC),
    .Halt(Halt),
    .Start(start),
    .Start_Address(Start_Address),
    .Branch(branch),
    .BranchCond(branchCond),
    .Offset(Offset),
  );

  instr_rom #(.IW(16)) IR(
    .PC(PC),
    .instruction(instruction)
  );
  

  reg_file #(.raw(3)) RF (
    .CLK(CLK),
    .REGWRITE(REGWRITE),
    .SETSRC(SETSRC),
    .SETDEST(SETDEST),
    .MOV(MOV),
    .rt_index(rt_index),
    .write_value(write_value),
    .rs(reg_rs),
    .rt(reg_rt)
  );

  data_ram DM(
    .CLK(CLK),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .mem_index(LUT_MEM_VALUE),
    .write_value(reg_rs),
    .read_value(reg_rs),
  );

  ALU alu(
    .CLK(CLK),
    .ALUop(ALUop),
    .srcRS(reg_rs),
    .srcRT(reg_rt),
    .equalFlag(equalFlag),
    .lessThanFlag(lessThanFlag),
    .destRD(reg_rs)
  );
endmodule
