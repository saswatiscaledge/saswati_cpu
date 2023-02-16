module comp_1(rs1_reg,rs2_reg,eq,gt,lt);//for 1 bit
input rs1_reg,rs2_reg;
output reg eq,gt,lt;

xnor x0(eq,rs1_reg,rs2_reg);//if rs1 and rs2 both 0 and 1 in T.T
and a1(gt,rs1_reg,~rs2_reg);//rs1=1 and rs2=0 in T.T
and a2(lt,~rs1_reg,rs2_reg);

endmodule


module comp_4(rs1_reg,rs2_reg,eq,gt,lt);//for 4 bit
input [3:0]rs1_reg,rs2_reg;
output reg eq,gt,lt;
wire n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,gt1,gt2,gt3,lt1,lt2,lt3,eq1;

comp_1 cmp0(.rs1_reg(rs1_reg[0]),.rs2_reg(rs2_reg[0]),.eq(n1),.gt(n5),.lt(n9));
comp_1 cmp1(.rs1_reg(rs1_reg[1]),.rs2_reg(rs2_reg[1]),.eq(n2),.gt(n6),.lt(n10));
comp_1 cmp2(.rs1_reg(rs1_reg[2]),.rs2_reg(rs2_reg[2]),.eq(n3),.gt(n7),.lt(n11));
comp_1 cmp3(.rs1_reg(rs1_reg[3]),.rs2_reg(rs2_reg[3]),.eq(n4),.gt(n8),.lt(n12));

//for greater than combination
and g1(gt1,n5,n2,n3,n4);
and g2(gt2,n6,n3,n4);
and g3(gt3,n7,n4);
or great(gt,gt1,gt2,gt3,n8);

//for lesser than combination
and l1(lt1,n9,n2,n3,n4);
and l2(lt2,n10,n3,n4);
and l3(lt3,n11,n4);
or lesser(lt,lt1,lt2,lt3,n12);

//for equal
and equal(eq,n1,n2,n3,n4);
endmodule

module comp(rs1_reg,rs2_reg,eq,gt,lt);//16bit
input [15:0]rs1_reg,rs2_reg;
output reg eq,gt,lt;
wire n14,n15,n16,n17,n18,n19,n20,n21,n22,n23,n24,gt4,gt5,gt6,lt4,lt5,lt6;

comp_4 cmp4(.rs1_reg(rs1_reg[3:0]),.rs2_reg(rs2_reg[3:0]),.eq(n14),.gt(n18),.lt(n22));
comp_4 cmp5(.rs1_reg(rs1_reg[7:4]),.rs2_reg(rs2_reg[7:4]),.eq(n15),.gt(n19),.lt(n23));
comp_4 cmp6(.rs1_reg(rs1_reg[11:8]),.rs2_reg(rs2_reg[11:8]),.eq(n16),.gt(n20),.lt(n24));
comp_4 cmp7(.rs1_reg(rs1_reg[15:12]),.rs2_reg(rs2_reg[15:12]),.eq(n17),.gt(n21),.lt(n25));

//for greater than
and g4(gt4,n18,n15,n16,n17);
and g5(gt5,n19,n16,n17);
and g6(gt6,n20,n17);
or gtr(gt,gt4,gt5,gt6,n21);

//for lesser than
and l4(lt4,n22,n17,n15,n16);
and l5(lt5,n23,n17,n16);
and l6(lt6,n24,n17);
or ltn(lt,lt4,lt5,lt6,n25);

//for equal
and eq2(eq,n14,n15,n16,n17);

endmodule


