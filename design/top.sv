`include "add.sv"
 module top;
 parameter N=16;

  reg[N-1:0] rs1_reg,rs2_reg;
  wire[N-1:0] add_rd,co;
  add add_dut(rs1_reg,rs2_reg,add_rd,co);
  initial begin
    repeat(3)begin
      rs1_reg=$random;
      rs2_reg=$random;
      #5;
      $display("rs1_reg= %0b, rs2_reg=%0b, add_rd= %0b, co=%b", rs1_reg,rs2_reg,add_rd,co);
    end
    #200;
  end
  endmodule
