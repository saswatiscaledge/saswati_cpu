// Code your design here
module div(rs1_reg,rs2_reg,div_rd,rem);
  parameter N=16;
  input[N-1:0] rs1_reg,rs2_reg;
  output reg[N-1:0] div_rd;
  reg[N-1:0] dividend,divisor,result;
  output reg[N-1:0] rem;
  int i;
  always@(*)begin
    divisor=rs2_reg;
    dividend=rs1_reg;
    result=0;
    for(i = rs2_reg ;i > 0;i--)begin
	if(dividend>0 && result==0)begin
      	 //{m_co,result}=result+multiplier;
      	 dividend--;
		if(result > 2**16 || m_co>1)begin
	    		result=0;
			$display("line 19**********exception**********");
		end
    		      //$display("%t mul_rd=%0d multiplicand=%0d, multiplier=%0d",$time ,mul_rd,multiplicand,multiplier);
    end
    else
	    result=0;
      end
    	if(result<= 2**16 && m_co==0)
      		div_rd=result;
   /* while(dividend>=divisor)begin
      dividend-=divisor;
      result++;
      div_rd=result;
      //multiplicand--;
      //$display("%t div_rd=%0d dividend=%0d, divisor=%0d",$time ,div_rd,dividend,divisor);
      
    end
    rem=dividend;*/
  end
endmodule
