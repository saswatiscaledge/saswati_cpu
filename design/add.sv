module add(rs1_reg, rs2_reg, add_rd,co);
  parameter N=16;
  input [N-1:0] rs1_reg, rs2_reg;
  //input ci;
  output reg [N-1:0] add_rd;
  output reg [N-1:0] co;
  
  //always @(*) begin
    //{co,add_rd} = rs1_reg + rs2_reg ;
  genvar i;
   generate
   for(i=0;i<N;i++) begin
      xor x1(add_rd[i],rs1_reg[i],rs2_reg[i]);
      and a1(co[i],rs1_reg[i],rs2_reg[i]);
       
  end
 endgenerate
endmodule

