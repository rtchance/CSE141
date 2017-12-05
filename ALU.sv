
import definitions::*;

module ALU (
  // Clock input
  input CLK,
  // input signals
  input [2:0] ALUop, // 4 bit ALU opcode
  input [7:0] srcRS, // 8 bit input for source RS
  input [7:0] srcRT, // 8 bit input for source RT
  
  output logic equalFlag, // flag for equal RS and RT
  output logic lessThanFlag, // flag for RS < RT
  output logic [7:0] destRD // 8 bit ALU output
);

  ALU_op_name op_name; // name for opcode
  
  always_comb begin
    case(ALUop)
    
      // Logical shift left operation
      lslOP: begin
        destRD = srcRS << srcRT;
      end

      // logical shift right operation
      lsrOP: begin
         destRD = srcRS >> srcRT;
      end

      // bit AND operation
      andOP: begin
        destRD = srcRS & srcRT;
      end

      // bit OR operation
      orOP: begin
        destRD = srcRS | srcRT;
      end

      // sub operation
      subOP: begin
        destRD = srcRS - srcRT;
      end
  
      // set equal flag operation
      seqOP: begin
        if(srcRS - srcRT == 0)
          equalFlag = 1;
        else
          equalFlag = 0;
        destRD = 0;
      end
  
      // set Less than flag operation
      sltOP: begin
        if(srcRS < srcRT)
          lessThanFlag = 1;
        else 
          lessThanFlag = 0;
        destRD = 0;
      end

      // bit NOT operation
      notOP: begin
        destRD = ~srcRS;
      end
    endcase
  end
endmodule

    
      