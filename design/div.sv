module full_subtractor #(parameter N=16)
  (
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] Diff,
    output Borrow
  );
  
  wire [N-1:0] temp;
  
  assign temp = A - B;
  assign Diff = temp;
  assign Bor = (A < B);
  
endmodule

module divider#(parameter N=16)( 
  input [N-1:0] rs1_reg,//rs1_reg=dividend
  input [N-1:0] rs2_reg,//rs2_reg=divisor
  output reg[N-1:0] rd1_quotient,
  output reg[N-1:0] rd2_remainder
);
  
  wire [N-1:0] temp_remainder;
  wire [N-1:0] current_dividend;
  wire quotient_bit;
  

  initial begin
    temp_remainder = rs1_reg;
    rd1_quotient = 0;
  end
  
  genvar i;
  
  generate
    for(i=N-1; i>=0; i=i-1)begin
      current_dividend == {temp_remainder[N-1:i], rd1_quotient[i-1:0]};  //The result of the concatenation operation is a new N-bit value current_dividend with the higher N-i bits taken from temp_remainder and the lower i bits taken from Quotient. 
      full_subtractor#(N) fs(
        .A(current_dividend),
        .B(rs2_reg),
        .Diff(temp_remainder),
        .Borrow(quotient_bit)
      );
      assign rs1_reg[i] = quotient_bit;
    end
  endgenerate

  assign rd2_remainder = temp_remainder;
  
endmodule

