// Code your design here
module mul(rs1_reg,rs2_reg,mul_rd,m_co);
parameter N=16;
  input[N-1:0] rs1_reg,rs2_reg;
  output reg[N-1:0] mul_rd,m_co;
  reg[N-1:0] multiplicand,multiplier,result;
  int i;
  
  always@(*)begin
    multiplicand=rs2_reg;
    multiplier=rs1_reg;
    result=0;
    m_co=0;
     /*while(multiplicand!=0)begin
      {m_co,result}=result+multiplier;
      mul_rd=result;
      multiplicand--;
      //$display("%t mul_rd=%0d multiplicand=%0d, multiplier=%0d",$time ,rd_reg,multiplicand,multiplier);
    end*/
    for(i = rs2_reg ;i > 0;i--)begin
	if(multiplicand>0 && m_co==0)begin
      	 {m_co,result}=result+multiplier;
      	 multiplicand--;
		if(result > 2**16 || m_co>1)begin
	    		result=0;
			$display("line 26**********exception**********");
		end
    		      //$display("%t mul_rd=%0d multiplicand=%0d, multiplier=%0d",$time ,mul_rd,multiplicand,multiplier);
    end
    else
	    result=0;
      end
    	if(result<= 2**16 && m_co==0)
      		mul_rd=result;
  end
endmodule
