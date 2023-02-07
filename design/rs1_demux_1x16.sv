module rs1_demux_1x16(opcode,rs1_reg_val,add_rs1,sub_rs1,mul_rs1,div_rs1,and_rs1,or_rs1,xor_rs1);
  parameter N = 16;
  parameter SEL_LINE = 4;
  input [SEL_LINE-1:0]opcode;
  input [N-1:0]rs1_reg_val;
  output reg [N-1:0]add_rs1,sub_rs1,mul_rs1,div_rs1,and_rs1,or_rs1,xor_rs1;
  
  always@(*)begin
    case(opcode)
    4'b0000 : add_rs1 = rs1_reg_val;
    4'b0001 : sub_rs1 = rs1_reg_val;
    4'b0010 : or_rs1 = rs1_reg_val;
    4'b0011 : div_rs1 = rs1_reg_val;
    4'b0100 : and_rs1 = rs1_reg_val;
    4'b0101 : or_rs1 = rs1_reg_val;
    4'b0110 : xor_rs1 = rs1_reg_val;
    endcase       
  end  
endmodule
