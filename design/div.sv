module div(rs1_reg,rs2_reg,remainder,rd_div);
parameter N=16;
input [N-1:0] rs1_reg,rs2_reg;
output reg [N-1:0] remainder,rd_div;

// Variables
integer i;
  reg [N-1:0] divisor_copy, dividend_copy;
  reg [N-1:0] temp;

always @(rs1_reg or rs2_reg)
begin
	divisor_copy = rs2_reg;
	dividend_copy = rs1_reg;
	temp = 0; 
        
 
 
  for(i = 0;i < N;i = i + 1)
	begin
      temp = {temp[N-2:0], dividend_copy[N-1]};
      dividend_copy[N-1:1] = dividend_copy[N-2:0];
		/*
			* Substract the Divisor Register from the Remainder Register and
			* plave the result in remainder register (temp variable here!)
		*/
		temp = temp - divisor_copy;
		// Compare the Sign of Remainder Register (temp)
      if(temp[N-1] == 1)
		begin
		/*
			* Restore original value by adding the Divisor Register to the
			* Remainder Register and placing the sum in Remainder Register.
			* Shift Quatient by 1 and Add 0 to last bit.
		*/
			dividend_copy[0] = 0;
			temp = temp + divisor_copy;
		end
		else
		begin
		/*
			* Shift Quatient to left.
			* Set right most bit to 1.
		*/
			dividend_copy[0] = 1;
		end
	end
	rd_div = dividend_copy;
	remainder = temp;//dividend - (divisor_copy*dividend_copy)
end
 
endmodule





















