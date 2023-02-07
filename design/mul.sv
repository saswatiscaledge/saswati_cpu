/*module mul(rs1_reg,rs2_reg,mul_rd);
  parameter N=4;
  parameter M=8;
  input [N-1:0]rs1_reg,rs2_reg;
  output reg [M-1:0]mul_rd;

  //wire [16:0]x;
  wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17;
  

  /*and a0(mul_rd[0],rs1_reg[0],rs2_reg[0]);
  and a1(x[0],rs1_reg[1],rs2_reg[0]);
  and a2(x[1],rs1_reg[2],rs2_reg[0]);
  and a3(x[2],rs1_reg[3],rs2_reg[0]);
  and a4(x[3],rs1_reg[0],rs2_reg[1]);
  and a5(x[4],rs1_reg[1],rs2_reg[1]);
  and a6(x[5],rs1_reg[2],rs2_reg[1]);
  and a7(x[6],rs1_reg[1],rs2_reg[3]);*/
  assign mul_rd[0]=(rs1_reg[0]&rs2_reg[0]);

  HA HA1(mul_rd[1],x1,(rs1_reg[1]&rs2_reg[0]),(rs1_reg[0]&rs2_reg[1]));
 
  FA FA1(x2,x3,(rs1_reg[1]&rs2_reg[1]),(rs1_reg[0]&rs2_reg[2]),x1);
  FA FA2(x4,x5,(rs1_reg[1]&rs2_reg[2]),(rs1_reg[0]&rs2_reg[3]),x3);
  HA HA2(x6,x7,(rs1_reg[1]&rs2_reg[3]),x5);
  
  HA HA3(mul_rd[2],x15,x2,(rs1_reg[2]&rs2_reg[0]));
  FA FA5(x14,x16,x4,(rs1_reg[2]&rs2_reg[1]),x15);
  FA FA4(x13,x17,x6,(rs1_reg[2]&rs2_reg[2]),x16);
  FA FA3(x9,x8,x7,(rs1_reg[2]&rs2_reg[3]),x17);
  
  HA HA4(mul_rd[3],x12,x14,(rs1_reg[3]&rs2_reg[0]));
  FA FA8(mul_rd[4],x11,x13,(rs1_reg[3]&rs2_reg[1]),x12);
  FA FA7(mul_rd[5],x10,x9,(rs1_reg[3]&rs2_reg[2]),x11);
  FA FA6(mul_rd[6],mul_rd[7],x8,(rs1_reg[3]&rs2_reg[3]),x10);
endmodule


module HA(s,c,a,b);
  output s,c;
  input a,b;
  xor x1(s,a,b);
  and c1(c,a,b);
endmodule

module FA(s,c,a,b,cin);
  output s,c;
  input a,b,cin;
  xor x2(s,a,b,cin);
  and c2(y1,a,b);
  and c3(y2,a,cin);
  and c4(y3,b,cin);
  or o1(c,c2,c3,c4);
  //assign s=(a^b^cin);
 // assign c=((a&b)|(a&cin)|(b&cin));
endmodule*/
  

module full_adder #(parameter N=16)
  (
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] O
);
  
  
  assign  O = A+B;
  
endmodule

module mul#(parameter N=16)( 
  input [N-1:0] rs1_reg,
  input [N-1:0] rs2_reg,
  output [2*N-1:0] mul_rd
);
  
  wire [N][  N-1:0] temp1;// [N];
  wire [N][2*N-1:0] temp2;// [N];
  
  wire [N][2*N-1:0] temp3;// [N];
  
  //always_comb begin
  assign	temp1[0] = rs2_reg[0] ? rs1_reg : 0;//& {N{B[0]}};
  assign	temp2[0] = temp1[0] << 0;
  assign	temp3[0] = temp2[0];
  //end
  
  genvar i;
  
  generate
    for(i=1; i<=N-1; i++)begin
      assign temp1[i] = rs2_reg[i] ? rs1_reg : 0;
      assign temp2[i] = temp1[i] << i;
      full_adder#(2*N) fa(
        .rs1_reg(temp3[i-1]),
        .rs2_reg(temp2[i]),
        .mul_rd(temp3[i])
      );
    end
  endgenerate

  assign mul_rd = temp3[N-1];
  
endmodule
 
  
  
