/* +------------------------------------------------------------------------------------------------------+
   | Module: MemoryController                                                                             |   
   | Input: Clk,Start,Reset,WordIn,AddressIn                                                              |
	| Output: WordOut,Valid                                                                                |
	|This module reads and sends out the authentic credentials of valid ID and Passwords from ROM          |                        
	+------------------------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns

module MemoryController (Clk,Start,Reset,WordIn,AddressIn,WordOut,Valid);

input Clk,Start,Reset;
input [31:0]WordIn;
output [4:0]AddressIn;
output [31:0]WordOut;
output Valid;

reg [4:0]AddressIn;
reg [31:0]WordOut;
reg [3:0]Count;
reg Valid;

always @(posedge Clk) begin
  if (Reset == 0)
  begin
      AddressIn<=5'b00000;//Initially setting address value to zero to read the first element
      Count<=4'b0000;//Count set to zero 
      WordOut<=32'b0000_0000_0000_0000_0000_0000_0000_0000;//Reset word to zero
		Valid<=1'b0;
  end
  if (Start == 1'b1)//Start signal to start the memory controller to read words from ROM
    begin
      AddressIn<=5'b00001;//Initially setting address value to zero to read the first element
      Count<=Count+4'b0001;//Count set to zero 
      WordOut<=WordIn;//Reading the first word from the hex file
		Valid<=1'b0;
    end
	 
    else if ((Count > 4'b0000) && (Count < 4'b1000))
      begin
        AddressIn<=AddressIn+5'b00001;//Incrementing address to read the next values
        Count<=Count+4'b0001;//Count still set to zero
        WordOut<=WordIn;//Reading words from the address
		  Valid<=1'b1;
      end
    else
       begin
        Count<=4'b0000;//After reaching end of file no more change in the count
        AddressIn<=5'b00000;//Adress is reset to zero
        WordOut<=32'b0000_0000_0000_0000_0000_0000_0000_0000;//WordOut is always zero afer reaching end of file
		  Valid<=1'b0;
       end
   end
endmodule

