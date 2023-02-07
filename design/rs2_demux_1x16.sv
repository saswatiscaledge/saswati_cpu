module rs2_demux_1x16(opcode,rs2_reg_val,add_rs2,sub_rs2,mul_rs2,div_rs2,and_rs2,or_rs2,xor_rs2);
  parameter N = 16;
  parameter SEL_LINE = 4;
  input [SEL_LINE-1:0]opcode;
  input [N-1:0]rs2_reg_val;
  output reg [N-1:0]add_rs2,sub_rs2,mul_rs2,div_rs2,and_rs2,or_rs2,xor_rs2;
  
  always@(*)begin
    case(opcode)
    4'b0000 : add_rs2 = rs2_reg_val;
    4'b0001 : sub_rs2 = rs2_reg_val;
    4'b0010 : mul_rs2 = rs2_reg_val;
    4'b0011 : div_rs2 = rs2_reg_val;
    4'b0100 : and_rs2 = rs2_reg_val;
    4'b0101 : or_rs2  = rs2_reg_val;
    4'b0110 : xor_rs2 = rs2_reg_val;
    endcase       
    
    
  end
  
  
endmodule

