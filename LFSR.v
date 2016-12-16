/* +--------------------------------------------------------------------------------------------------------------+
   | Module: LFSR                                                                                                 |   
   | Input:  reset,clock                                                                                          |
	| Output: LFSR                                                                                                 |
	|This module generates a 15 bit value and ranomly the bits from 5:1 are used to addressthe ROM Word Bank       |                        
	+--------------------------------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module LFSR(reset,clock,LFSR);
  input reset,clock;
  output [4:0] LFSR;
  
  reg [4:0] LFSR;
  reg [14:0] temp;

  always @(posedge clock)
  begin
    //Resetting LFSR and the timeout flag to initial values
    if(reset == 0)
	   begin
		  temp<=15'b111111111111111;//Initializing to the first value of the sequence
		  //timeout<=1'b0;
		end

		  else
		    begin
			   temp[0] <= temp[0] ^ temp[14];//Tapping in first and last input
				temp[14:1] <= temp[13:0];//Shifting rest f the values
			end
   LFSR<=temp[5:1];//Giving out only five bits of the randomly generated value
  end
endmodule

