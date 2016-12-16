/* +----------------------------------------------------------------------------------------+
   | Module: timer                                                                          |   
   | Input:  Clk,Rst,Enable,ChildMode                                                       |
	| Output: timeDisp,Timeout                                                               |
	|This module sets timer to 10 seconds if ChildMode=0 and 30 seconds if ChildMode=1        |                        
	+--------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module timer(Clk,Rst,Enable,EnableScore,ChildMode,timeDisp,Timeout);
input Clk,Rst,Enable,ChildMode,EnableScore;
output [7:0]timeDisp;
output Timeout;
reg [3:0]first; 
reg [26:0]counter;
reg [7:0]timeDisp;
reg Flag;
reg Timeout;
always @(posedge Clk) 
begin 
if(!Rst)begin
    Flag <= 1'b0;
    counter<=27'd0;
    timeDisp<=8'd0;
    Timeout <= 0;
end 

else if ((Enable==1) && (ChildMode ==0))//Difficult Level
	 begin
	    timeDisp<=8'd10;//Time Set to  10 seconds
		 Flag <= 1;
             Timeout <= 0;
	 end
  
 else if ((Enable==1) && (ChildMode ==1))//Easy Level
	 begin
	    timeDisp<=8'd30;//Timer set to 30 seconds
		 Flag <= 1;
		Timeout <= 0;
	 end
	 
  else
  begin
    if(Flag == 1)
    begin
    if(timeDisp != 8'd0)
    begin
    if (counter==27'd50000000)begin 
    Timeout <= 0;    
    if(EnableScore ==0)
	 begin
    timeDisp <= timeDisp - 8'd1; // decrement the time
    counter<=27'd0; 
	 end
    
	 
  end 
  else
  begin 
Timeout <= 0;//TimeOut set to zero showing timer is still downcounting
    counter <=counter + 27'd1; 
  end
end
else
begin
  Timeout <= 1;//Timer has reached value zero the the word has timed out
end

end
end
end
endmodule 