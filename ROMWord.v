/* +---------------------------------------------------------------------------------------------+
   | Module: ROMWord                                                                             |   
   | Input:  Clk,Read3,Reset,Count                                                               |
	| Output: WordOut,Valid                                                                       |
	|This module reads word from the ROM Bamk one by one when the Game Controller sends the signal|                        
	+---------------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module  ROMWord(Clk,Read3,Reset,Count,WordOut,Valid);
  input  Clk,Read3,Reset;
  input [4:0]Count;
  output [63:0] WordOut;
  output Valid;
  
  wire [63:0] Word;
  wire [4:0] AddressIn;
    
	 //Reading word by word from the Word Bank ROM
    WordController myWordController (Clk,Read3,Reset,Count,Word,AddressIn,WordOut,Valid);
	 //ROM which stores the 64 bit word and corresponding answer
    Rom_SimWord3 myRom_SimWord3 (AddressIn,Clk,Word);

endmodule
