/* +---------------------------------------------------------------------------------------------+
   | Module: ScoreController                                                                     |   
   | Input:  Clk,Reset,InScore,Enable                                                            |
	| Output: ReadAddress,WriteAddress,WriteEnable,ScoreIn                                        |
	|This obtains signal from game controller InScore=1-->correct answer 0-->for wrong answer and |
	|adds the scoreand wites the score to the RAM                                                 |                        
	+---------------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module ScoreController(Clk,Reset,InScore,Enable,ReadAddress,WriteAddress,WriteEnable,ScoreIn);
input InScore,Clk,Enable,Reset;

output [7:0] ScoreIn;
output [3:0]ReadAddress;
output [3:0]WriteAddress;
output WriteEnable;

reg [7:0] ScoreIn=8'b00000000;
reg [3:0]ReadAddress=4'b0000;
reg [3:0]WriteAddress=4'b0000;
reg WriteEnable;
//reg [7:0] Count =8'b00000000;

always @(posedge Clk) begin
if(Reset ==0)
begin
ScoreIn<=8'b00000000;
WriteEnable<=1;
end
else if (Enable == 1)
begin
WriteEnable<=0;//Reading from RAM
end
else
begin
ScoreIn<=ScoreIn+InScore;//Adding score
WriteEnable<=1;//Writing into RAM
end
end
endmodule



