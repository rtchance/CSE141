package definitions;

  typedef enum logic [2:0] {
    lslOP = 3'd0,
    lsrOP = 3'd1,
    andOP = 3'd2,
    orOP  = 3'd3,
    subOP = 3'd4,
    seqOP = 3'd5,
    sltOP = 3'd6,
    notOP = 3'd7
  } ALU_op_name;

endpackage
