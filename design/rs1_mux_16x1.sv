module rs1_mux_16x1(rs1_sel,rs1,rs1_o);
  input [3:0]rs1_sel;
  input [15:0]rs1;
  output rs1_o;
  
  assign rs1_o=rs1[rs1_sel];
  
  
endmodule