//`include "add.sv"
//`include "sub.sv"
//`include "mul.sv"
`include "comp.sv"
module top;
 parameter N=16;
 //parameter N=4;
 //parameter M=8; 

  reg [N-1:0]rs1_reg,rs2_reg;
  //wire [N-1:0]add_rd,co;
  //wire [N-1:0]sub_rd;
  //wire [2*N-1:0]mul_rd;
  wire eq,gt,lt;
  //add add_dut(rs1_reg,rs2_reg,add_rd,co);
  //sub sub_dut(rs1_reg,rs2_reg,sub_rd);
  //mul mul_dut(rs1_reg,rs2_reg,mul_rd);
  comp comp_dut(rs1_reg,rs2_reg,eq,gt,lt);
  initial begin
    repeat(3)begin
      rs1_reg=$random;
      rs2_reg=$random;
      #5;
      //$display("output of add:%0t,rs1_reg= %0b, rs2_reg=%0b, add_rd= %0b, co=%b",$time, rs1_reg,rs2_reg,add_rd,co);
      //$display("output of sub: rs1_reg=%0b,rs2_reg=%0b,sub_rd=%0b",rs1_reg,rs2_reg,sub_rd);
      //$display("rs1_reg=%0b,rs2_reg=%0b,mul_rd=%0b",rs1_reg,rs2_reg,mul_rd);
      $display("output of comparator: rs1_reg=%0d,rs2_reg=%0d,eq=%0d,gt=%0d,lt=%0d",rs1_reg,rs2_reg,eq,gt,lt);
    end
    #200;
  end
  endmodule
