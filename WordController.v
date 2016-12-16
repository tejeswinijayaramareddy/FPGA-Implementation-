/* +---------------------------------------------------------------------------------------------+
   | Module: WordController                                                                      |   
   | Input: Clk,Start,Reset,Count,WordIn,AddressIn                                               |
	| Output: WordOut,Valid                                                                       |
	|This module reads wordrandomly based on the Count value from LFSR and gives out the word     |                        
	+---------------------------------------------------------------------------------------------+ */
module WordController (Clk,Start,Reset,Count,WordIn,AddressIn,WordOut,Valid);

input Start,Reset,Clk;
input [63:0]WordIn;
output [4:0]AddressIn;
input[4:0]Count;
output [63:0]WordOut;
output Valid;

reg [4:0]AddressIn=5'b00001;
reg [63:0]WordOut;
//reg [3:0]Count;
reg Valid;

always @(posedge Clk) begin
  if (Reset == 0)
  begin
      AddressIn<=Count+1;//Initially setting address value to zero to read the first element
      //Count<=4'b0000;//Count set to zero 
      WordOut<=64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;//Reset word to zero
		Valid<=1'b0;
  end
  if (Start == 1'b1)//Start signal to start the memory controller to read words from ROM
    begin
      AddressIn<=Count;//Initially setting address value to zero to read the first element
      //Count<=Count+1;//Count set to zero 
      WordOut<=WordIn;//Reading the first word from the hex file
		Valid<=1'b1;
    end 
   end
endmodule