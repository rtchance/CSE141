module reg_file_tb;

  // DUT Input Drivers
  bit CLK;
  bit REGWRITE;
  bit SETSRC;
  bit SETDEST;
  bit [2:0] rt_index;
  bit [7:0] write_value;

  // DUT Output Drivers
  wire [7:0] rs;
  wire [7:0] rt;

  // Instantiate the reg_file module (DUT)
  reg_file reg_file_DUT (
    .CLK(CLK),
    .REGWRITE(REGWRITE),
    .SETSRC(SETSRC),
    .SETDEST(SETDEST),
    .rt_index(rt_index),
    .write_value(write_value),
    .rs(rs),
    .rt(rt)
  );

  initial begin
  // Wait 100ns for global reset
  #100ns;

  // Lets test SETSRC
  SETSRC = 1'd1;
  SETDEST = 1'd0;
  REGWRITE = 1'd0;
  rt_index = 3'd6;
  #20ns;

  // Lets test SETDEST
  SETSRC = 1'd0;
  SETDEST = 1'd1;
  REGWRITE = 1'd0;
  rt_index = 3'd5;
  #20ns;

  // Lets test writing to register
  SETSRC = 1'd0;
  SETDEST = 1'd0;
  REGWRITE = 1'd1;
  write_value = 8'd26;
  #20ns;
  // we should see registers[5] = 26

  // Lets test reading from register
  SETSRC = 1'd0;
  SETDEST = 1'd0;
  REGWRITE = 1'd0;
  rt_index = 3'd5;
  #20ns $stop;
  // we should see the wire rt = 26

  end

  always begin
    // Alternate clock for period of 20ns
    #10ns CLK = 1;
    #10ns CLK = 0;
  end


endmodule
