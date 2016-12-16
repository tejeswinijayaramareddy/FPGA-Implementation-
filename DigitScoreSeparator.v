/* +--------------------------------------------------------------------------------------+
   | Module: DigitScoreSeparator                                                          |   
   | Input:  second,first,Enable,ScoreOut2,ScoreOut1                                      |
	| Output: Display1,Display2                                                            |
	|This module displays Score when Enable is high and timer when Enable is low           |                        
	+--------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module DigitScoreSeparator(second,first,Enable,ScoreOut2,ScoreOut1,Display1,Display2);
input [3:0]second;
input [3:0]first;
input Enable;
input [3:0]ScoreOut2;
input [3:0]ScoreOut1;

output [3:0] Display1;
output [3:0] Display2;

reg [3:0] Display1;
reg [3:0] Display2;

always@(second,first,Enable,ScoreOut1,ScoreOut2) begin
if (Enable == 1)//If score mode
begin
//Display Score
Display1=ScoreOut1[3:0];
Display2=ScoreOut2[3:0];
end
else //If timer mode
begin
//Display time
Display1<=first[3:0];
Display2<=second[3:0];
end
end
endmodule
