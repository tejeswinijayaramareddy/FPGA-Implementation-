/* +--------------------------------------------------------------------------------------+
   | Module: DigitCount                                                                   |   
   | Input:  Clk,Reset,StartCount                                                         |
	| Output: CounterValue                                                                 |
	|This module counts the number of times the toggle button is pressed to set the vowel  |                        
	+--------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module DigitCount(Clk,Reset,StartCount,CounterValue);
  input Clk,Reset,StartCount;
  output [3:0]CounterValue;
  reg [3:0]CounterValue;
  
  always @ (posedge Clk) begin
    if (Reset == 0)
	   begin
		  CounterValue <= 4'b0000;//Clearing Counter Value during Reset
		end
else if (StartCount == 1)
		  begin
		       if (CounterValue < 4'b0101)
				   begin
	            CounterValue <= CounterValue+4'b0001;//Incrementing the count of digits
					end
				else if(CounterValue == 4'b0101)//As this module counts only last four digit of ID checking if maximum limit is reached
					begin
						CounterValue <= 4'b0001;//Wrapping around to count from 1 to 5
					end
		  
		  end
	end
endmodule

  
  