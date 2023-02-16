//Full Adder Module
module full_adder #(parameter N=16)
  (
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] O
);
  
  
  assign  O = A+B;
  
endmodule

//Multiplier Module
module mul1#(parameter N=16)( 
  input [N-1:0] rs1_reg,
  input [N-1:0] rs2_reg,
  output [2*N-1:0] mul_rd
);
 
//Temporary arrays to store intermediate values 
  wire [N][  N-1:0] temp1;// [N]
  wire [N][2*N-1:0] temp2;// [N]  
  wire [N][2*N-1:0] temp3;// [N]

//Initialize the first bit of the intermediate values  
  //always_comb begin
  assign	temp1[0] = rs2_reg[0] ? rs1_reg : 0;//& {N{B[0]}};
  assign	temp2[0] = temp1[0] << 0;
  assign	temp3[0] = temp2[0];
  //end
  
  genvar i;
  
  generate
    for(i=1; i<=N-1; i++)begin
//Calculate intermediate values based on the current bit of rs2_reg
      assign temp1[i] = rs2_reg[i] ? rs1_reg : 0;
      assign temp2[i] = temp1[i] << i;
//Using full adder to add intermediate values
      full_adder#(2*N) fa(
        .A(temp3[i-1]),
        .B(temp2[i]),
        .O(temp3[i])
      );
    end
  endgenerate

  assign mul_rd = temp3[N-1];
  
endmodule
 


//16bit Multiplier using HA and FA
/*module HA(s,c,a,b);
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
endmodule

module mul(rs1_reg,rs2_reg,mul_rd);
  parameter N=4;
  parameter M=8;
  input [N-1:0]rs1_reg,rs2_reg;
  output reg [M-1:0]mul_rd;

  wire [15:0]w;
  wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17;
  

  assign mul_rd[0]=(rs1_reg[0]&rs2_reg[0]);
  and a1(w[1],rs1_reg[1],rs2_reg[0]);
  and a2(w[2],rs1_reg[0],rs2_reg[1]);
  and a3(w[3],rs1_reg[1],rs2_reg[1]);
  and a4(w[4],rs1_reg[0],rs2_reg[2]);
  and a5(w[5],rs1_reg[1],rs2_reg[2]);
  and a6(w[6],rs1_reg[0],rs2_reg[3]);
  and a7(w[7],rs1_reg[1],rs2_reg[3]);
  and a8(w[8],rs1_reg[2],rs2_reg[0]);
  and a9(w[9],rs1_reg[2],rs2_reg[1]);
  and a10(w[10],rs1_reg[2],rs2_reg[2]);
  and a11(w[11],rs1_reg[2],rs2_reg[3]);
  and a12(w[12],rs1_reg[3],rs2_reg[0]);
  and a13(w[13],rs1_reg[3],rs2_reg[1]);
  and a14(w[14],rs1_reg[3],rs2_reg[2]);
  and a15(w[15],rs1_reg[3],rs2_reg[3]);
  
  HA HA1(mul_rd[1],x1,w[1],w[2]);
  FA FA1(x2,x3,w[3],w[4],x1);
  FA FA2(x4,x5,w[5],w[6],x3);
  HA HA2(x6,x7,w[7],x5);
  
  HA HA3(mul_rd[2],x15,x2,w[8]);
  FA FA5(x14,x16,x4,w[9],x15);
  FA FA4(x13,x17,x6,w[10],x16);
  FA FA3(x9,x8,x7,w[11],x17);
  
  HA HA4(mul_rd[3],x12,x14,w[12]);
  FA FA8(mul_rd[4],x11,x13,w[13],x12);
  FA FA7(mul_rd[5],x10,x9,w[14],x11);
  FA FA6(mul_rd[6],mul_rd[7],x8,w[15],x10);
    
endmodule*/

 /* HA HA1(mul_rd[1],x1,(rs1_reg[1]&rs2_reg[0]),(rs1_reg[0]&rs2_reg[1]));
 
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
  FA FA6(mul_rd[6],mul_rd[7],x8,(rs1_reg[3]&rs2_reg[3]),x10);*/



  

  
  
