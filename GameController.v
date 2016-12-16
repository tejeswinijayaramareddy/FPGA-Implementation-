/* +--------------------------------------------------------------------------------------+
   | Module: GameController                                                               |   
   | Input:  Clock,Reset,Start,Submit,Toggle,NoOfWords,Word,Valid,Read3,TimeOut           |
	| Output: Letter1,Letter2,Letter3,Letter4,Enable,InScore                               |
	|This module is the brain of the Game which reads how many words you want to play      |
   |a word from the ROM Word Bank and separates it to letters and checks the answer       |
	|entered by the user andsends our active for each correct                              |
	|answer and 0 for every wrong answer                                                   |                        
	+--------------------------------------------------------------------------------------+ */
`timescale 1 ns/1 ns
module GameController(Clock,Reset,Start,Submit,Toggle,NoOfWords,Word,Valid,Read3,TimeOut,Letter1,Letter2,Letter3,Letter4,Enable,InScore);
input Clock,Reset,Start,Submit,TimeOut;
input [3:0] Toggle;
input [5:0] NoOfWords;
input [63:0] Word;
input Valid;

output Read3,InScore,Enable;
output [7:0] Letter1;
output [7:0] Letter2;
output [7:0] Letter3;
output [7:0] Letter4;


reg Read3,InScore,Enable;
reg [7:0] Letter1;
reg [7:0] Letter2;
reg [7:0] Letter3;
reg [7:0] Letter4;

parameter S_bit0=0,S_bit1=1,S_bit2=2,S_bit3=3,Wait=4;

reg [2:0] State;
reg [5:0] Count = 6'b000000;
reg [5:0] temp = 6'b000000;
reg [3:0] Answer = 4'b0000;
reg [63:0] TempWord;
always @ (posedge Clock) begin

if (Reset == 0)
  begin
    State <= S_bit0;//Settting initial state to S_bit0
    //Result <= 2'b10;//Represents 'O'
    Read3 <= 0;
    Letter1 <= 8'b01011111;//Display '_'
    Letter2 <= 8'b01011111;//Display '_'
    Letter3 <= 8'b01011111;//Display '_'
    Letter4 <= 8'b01011111;//Display '_'
    Answer <= 4'b0000;
	 Count<=5'b00000;
  end
else
begin  
case (State)
  S_bit0:
  begin
  //Setting all values to zero
  Read3 <= 0;
  //SetTime<=0;
  Enable<=0;
  InScore<=0;
  Letter1 <= 8'b01011111;//Display '_'
  Letter2 <= 8'b01011111;//Display '_'
  Letter3 <= 8'b01011111;//Display '_'
  Letter4 <= 8'b01011111;//Display '_'
  Answer <= 4'b0000;
  Count <= 6'b000000;
    if ((Start == 1'b 1) )//Checking if login check has passed
      begin
		      if((NoOfWords != 6'b000000) &&(Submit == 1))
				begin 
				temp=NoOfWords;
            State <= S_bit1;//Settting initial state to S_bit1
            Read3 <= 1;
            Letter1 <= 8'b01011111;//Display '_'
            Letter2 <= 8'b01011111;//Display '_'
            Letter3 <= 8'b01011111;//Display '_'
            Letter4 <= 8'b00110010;//Display '_'
            Answer <= 4'b0000;  
				end
      end
    else
      begin
        State <= S_bit0;//Settting initial state to S_bit0
        Read3 <= 0;
        Letter1 <= 8'b01011111;//Display '_'
        Letter2 <= 8'b01011111;//Display '_'
        Letter3 <= 8'b01011111;//Display '_'
        Letter4 <= 8'b01011111; //Display '_'
        Answer <= 4'b0000;
      end
  end
  S_bit1:
  begin
      if(Count < temp)//Checking if end of game
		begin
      State <= Wait;//Settting initial state to S_bit0
      Read3 <= 1;//Sending signal to read the word
		InScore<=0;

		end

		else
		begin
		State <= S_bit1;//Settting initial state to S_bit0
        Read3 <= 0;
		  InScore<=0;
        Letter1 <= 8'b01011111;//Display '_'
        Letter2 <= 8'b01011111;//Display '_'
        Letter3 <= 8'b01011111;//Display '_'
        Letter4 <= 8'b01011111;//Display '_'
        Answer <= 4'b0000;
		end
		InScore<=0;
		
		end
Wait:
begin
State <= S_bit2;
end
	
S_bit2:
begin
      //Settting initial state to S_bit0
      Read3 <= 0;
		//SetTime <= 0;
		Enable <= 1;
      Letter1 <= Word[63:56];//Reading letter 1
          Letter2 <= Word[55:48];//Reading letter 2
          Letter3 <= Word[47:40];//Reading letter 3
          Letter4 <= Word[39:32]; //Reading letter 4
          Answer <= Word[31:28];//Reading answer
		  State <= S_bit3;
end 
		  
S_bit3:
begin

Read3 <= 0;
//SetTime <= 0;
		Enable <= 0;
      

  if((Submit == 1)&&(TimeOut!=1))//Checking if answer is submitted and the timer has not timed out
  begin		 
    if((Toggle!=0))//Checking if a valid answer is provided
      begin
        if(Answer == Toggle)//Comparing the toggle value with the answer
	       begin
	         
		      State <= S_bit1;
		      InScore <=1;
				
				Count <= Count+6'b000001;//Incrementing count to end game after 18 words
	       end
	     else
          begin
           
		     State <= S_bit1;
		     InScore <=0;
			  
			  Count <= Count+6'b000001;//Incrementing count to end game after 18 words
          end
     end
 end 
 else if ((Submit == 0)&&(TimeOut==1))//If no answer till timeout move to the next word
    begin
	 
	 State <= S_bit1;//Move to S_bit1
	 //Count <= Count+5'b00001;
	 end
else//Else if submit is not pressed 
begin
       
		 State <= S_bit3;
		 InScore <=0;
end
end
endcase
end
end
endmodule
