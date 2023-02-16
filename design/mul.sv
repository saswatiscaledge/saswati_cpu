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
 





  

  
  
