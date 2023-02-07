module mux_16x1_get_rd(add_rd,sub_rd,mul_rd,div_rd,and_rd,or_rd,xor_rd,op_opcode,rd_val);
  parameter N = 16;
  parameter SEL_LINE = 4;
  input[N-1:0] add_rd,sub_rd,mul_rd,div_rdand_rd,or_rd,xor_rd;
  input [SEL_LINE-1:0]op_opcode;
  output reg [N-1:0]rd_val;
  //assign rd_val=op_opcode? add_rd : sub_rd;
  always@(*)begin
    if(op_opcode==00)
      rd_val=add_rd;
    else if(op_opcode==1)
      rd_val=sub_rd;
    else if(op_opcode==2)
      rd_val=mul_rd;
    else if(op_opcode==3)
      rd_val=div_rd;
    else if(op_opcode==4)
      rd_val=and_rd;
    else if(op_opcode==5)
      rd_val=or_rd;
    else if(op_opcode==6)
      rd_val=xor_rd;
  end
endmodule
