module mux_16x1_get_rd(add_rd,sub_rd,mul_rd,div_rd,and_rd,or_rd,xor_rd,opcode,rd_val);
  parameter N = 16;
  parameter SEL_LINE = 4;
  input[N-1:0] add_rd,sub_rd,mul_rd,div_rdand_rd,or_rd,xor_rd;
  input [SEL_LINE-1:0]opcode;
  output reg [N-1:0]rd_val;
  //assign rd_val=opcode? add_rd : sub_rd;
  always@(*)begin
    case(opcode)
      4'b0000 : rd_val=add_rd;
      4'b0001 : rd_val=sub_rd;
      4'b0010 : rd_val=mul_rd;
      4'b0011 : rd_val=div_rd;
      4'b0100 : rd_val=and_rd;
      4'b0101 : rd_val=or_rd;
      4'b0110 : rd_val=xor_rd;
    endcase
  end
endmodule
