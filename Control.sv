import definitions::*;

module Control (

  input [2:0] Opcode, // 3 bit opcode input
  input [2:0] Func,   // 3 bit func code input

  output logic [2:0] ALUOp, // 4 bit ALU code output
  output logic RegWrite, // control signal for reg write
  output logic MemRead,  // control signal for mem read
  output logic MemWrite, // control signal for mem write
  output logic [2:0] DesReg,   // 3 bit control for des register
  output logic [2:0] SrcReg,   // 3 bit control for src register
  output logic SetSrcReg,      // control signal for setting src
  output logic SetDesReg,      // control signal for setting dest
  output logic branch,   // control signal for uncon. branch
  output logic branchEq, // control signal for branch on equal
  output logic branchLT, // control signal for branch on less than
  output logic done      // control signal for done
);

  always_comb begin
    // parse opcodes
    case(Opcode)
      
      // R-type instructions
      0: begin
        // parse func codes
        case(Func)
          // lsl operation
          1: begin
            ALUOp = lslOP;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // lsr operation
          2: begin
            ALUOp = lsrOP;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // bit AND operation
          3: begin
            ALUOp = andOP;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // bit OR operation
          4: begin
            ALUOp = orOP;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // sub operation
          5: begin
            ALUOp = subOP;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // set equal flag operation
          6: begin
            ALUOp = seqOP;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // set less than flag operation
          7: begin
            ALUOp = sltOP;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end
        endcase
      end // end R-types

      // M-Type
      1: begin
        // parse func codes
        case(Func)

          // setdes operation
          0: begin
            //ALUOp = setdesOp;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 1;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // setsrc operation
          1: begin
            //ALUOp = setsrcOp;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 1;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // bit NOT operation
          2: begin
            ALUOp = notOP;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // load word operation
          3: begin
            //ALUOp = ldwOp;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          // store word operation
          4: begin
            //ALUOp = stwOp;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 0;
          end

          //done operation
          5: begin
            //ALUOp = done;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            SetSrcReg = 0;
            SetDesReg = 0;
            branch = 0;
            branchEq = 0;
            branchLT = 0;
            done = 1;
          end
        endcase
      end // end m-types

      // I-types

      // mov operation (immediate to r7)
      2: begin
        //ALUOp = movOp;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        SetSrcReg = 0;
        SetDesReg = 0;
        branch = 0;
        branchEq = 0;
        branchLT = 0;
        done = 0;
      end
 
      // movl operation (LUT value to r7)
      3: begin
        //ALUOp = movlOp;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        SetSrcReg = 0;
        SetDesReg = 0;
        branch = 0;
        branchEq = 0;
        branchLT = 0;
        done = 0;
      end

      // beq operation
      4: begin
        //ALUOp = beqOp;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        SetSrcReg = 0;
        SetDesReg = 0;
        branch = 0;
        branchEq = 1;
        branchLT = 0;
        done = 0;   
      end

      // blt operation
      5: begin
        //ALUOp = bltOp;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        SetSrcReg = 0;
        SetDesReg = 0;
        branch = 0;
        branchEq = 0;
        branchLT = 1;
        done = 0;
      end

      // unconditional branch
      6: begin
        //ALUOp = bOp;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        SetSrcReg = 0;
        SetDesReg = 0;
        branch = 1;
        branchEq = 0;
        branchLT = 0;
        done = 0;
      end
    endcase
  end
endmodule
