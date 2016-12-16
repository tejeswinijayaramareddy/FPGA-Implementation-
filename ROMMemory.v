/* +------------------------------------------------------------------------------------------------------+
   | Module: ROMMemory                                                                                    |   
   | Input:  Clk,Reset,Start                                                                              |
	| Output: WordOut,Valid                                                                                |
	|This module reads and sends out the credentials of valid ID and Passwords allowed to play this game   |                        
	+------------------------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module  ROMMemory(Clk,Reset,Start,WordOut,Valid);
  input  Clk,Start,Reset;
  output [31:0] WordOut;
  output Valid;
  
  wire [31:0] Word;
  wire [4:0] AddressIn;
    //Memory controller to read word by word of the creditials of authentic users stored in the ROM
    MemoryController myMemoryController (Clk,Start,Reset,Word,AddressIn,WordOut,Valid);
	 //ROM where the credentials are stored
    ROM_Sim myROM_Sim (AddressIn,Clk,Word);

endmodule
