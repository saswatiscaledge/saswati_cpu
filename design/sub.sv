module sub(rs1_reg,rs2_reg,sub_rd);
  parameter N=16;
           input [N-1:0] rs1_reg, rs2_reg;

           output reg [N-1:0] sub_rd;
  
 // always @(*) begin
      /* if(rs1_reg > rs2_reg)
    		{sub_rd} = rs1_reg - rs2_reg ;
	else
		$display("**************rs1 < rs2,exception************");*/
   //s = a+b+ci;
  //co = a+b+ci;  
      genvar i;
      for(i=0;i<N;i++)begin
          xor x2(sub_rd[i],rs1_reg[i],rs2_reg[i]);
  end
endmodule
