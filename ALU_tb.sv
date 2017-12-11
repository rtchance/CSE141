module ALU_tb;

  // DUT Input Drivers
  bit CLK;
  bit [2:0] ALUop;
  bit [7:0] srcRS;
  bit [7:0] srcRT;

  // DUT Output Drivers
  wire equalFlag;
  wire lessThanFlag;
  wire [7:0] destRD;

  // Instantiate the ALU module (DUT)
  ALU ALU_DUT(
    .CLK(CLK),
    .ALUop(ALUop),
    .srcRS(srcRS),
    .srcRT(srcRT),
    .equalFlag(equalFlag),
    .lessThanFlag(lessThanFlag),
    .destRD(destRD)
  );

  initial begin
  // wait 100ns
  #100ns;
  
  // test lsl operation
  ALUop = 3'd0;
  srcRS = 8'd1;
  srcRT = 8'd3;
  #20ns;
  // destRD should have the value of 8

  // test lsr operation
  ALUop = 3'd1;
  srcRS = 8'd128;
  srcRT = 8'd7;
  #20ns;
  // destRD should have the value of 1

  // test bit AND operation
  ALUop = 3'd2;
  srcRS = 8'd153;
  srcRT = 8'h7f;
  #20ns;
  // destRD should have the decimal value 25

  // test bit OR operation
  ALUop = 3'd3;
  srcRS = 8'd16;
  srcRT = 8'd9;
  #20ns;
  // destRD should have the decimal value 25

  // test sub operation
  ALUop = 3'd4;
  srcRS = 8'd0;
  srcRT = 8'd1;
  #20ns;
  // destRD should have the value 0xff or -1

  // test set equal flag operation
  ALUop = 3'd5;
  srcRS = 8'd1;
  srcRT = 8'd1;
  #20ns;
  // equal flag should be true

  // test set less than flag operation
  ALUop = 3'd6;
  srcRS = 8'd1;
  srcRT = 8'd1;
  #20ns;
  // less than flag should be false
  srcRS = 8'd1;
  srcRT = 8'd2;
  #20ns;
  // less than flag should be true
  
  // test bitNOT operation
  ALUop = 3'd7;
  srcRS = 8'd0;
  #20ns;
  // destRD should be equal to -1

  $stop;

  end

  always begin
    // Clock period of 20ns
    #10ns CLK = 1;
    #10ns CLK = 0;
  end
endmodule
