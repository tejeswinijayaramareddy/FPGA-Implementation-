/* +--------------------------------------------------------------------------------------------------------------------+
   | Module: LoginCheck                                                                                                 |   
   | Input:  Clk,Reset,FourBitRegIn,ROMMemoryIn,FourBitRegValid,ROMMemoryValid                                          |
	| Output: Start,PassFail                                                                                             |
	|This module verifies he credentials and sends a start to the game controller to start only if credentials pass      |                        
	+--------------------------------------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module LoginCheck(Clk,Reset,FourBitRegIn,ROMMemoryIn,FourBitRegValid,ROMMemoryValid,Start,PassFail);
input Clk,Reset;
input [31:0] FourBitRegIn;
input [31:0] ROMMemoryIn;
input FourBitRegValid;
input ROMMemoryValid;

output Start;
output [1:0] PassFail;

reg Start;
reg [1:0] PassFail;
reg [31:0] temp; 
reg [3:0] PassFailCount;

always @(posedge Clk) begin
if (Reset == 0)
  begin
     //Resetting all values to the inial default value zero
     Start<=1'b0;
	  PassFail<=2'b11;
	  temp<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
	  PassFailCount <= 4'b0000;
  end
 else if (FourBitRegValid == 1'b1)//Checking if the 32 bit ID and Password is ready and completely entered by the user in the for bit reg
   begin
	  Start<=1'b0;
	  PassFail<=2'b11;//Display 'O'
	  temp <= FourBitRegIn;//Loading the entire user name and password into temporary reg
	end
 else if ((ROMMemoryValid == 1'b1))//Checking if the word read from ROM is valid
 begin
   PassFailCount <= PassFailCount + 4'b0001;//Adding PassFailCount to count the no: of comparisons the LoginCheck has gone through
   if ((ROMMemoryIn == temp) && (PassFailCount < 4'b1000))//If the ID and Password credentials match
	  begin
	    Start<=1'b1;//Start the game controller
	    PassFail<=2'b10;//Display 'P' 
		 PassFailCount<=4'b0000;//Reset PassFailCount to zero for next check later
	    temp <=32'b0000_0000_0000_0000_0000_0000_0000_0000;//Clearing temp reg
	  end
	 end
	else if (PassFailCount == 4'b0111)//When the end of ROM file is reached after all trials
	begin
	    Start<=1'b0;//No start to the game controller
	    PassFail<=2'b01;//Dsplay 'F'
	    temp <=32'b0000_0000_0000_0000_0000_0000_0000_0000;//Clearing temp reg
   end

end
endmodule
