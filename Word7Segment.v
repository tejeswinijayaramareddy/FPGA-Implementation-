/* +--------------------------------------------------------------------------------------+
   | Module: Word7Segment                                                                 |   
   | Input:  In                                                                           |
	| Output: Out7b                                                                        |
	|This module is a specialized even segmet lights up coresponding segments to display   |
	|alphabets on seven segments                                                           |                        
	+--------------------------------------------------------------------------------------+ */
`timescale 1ns/1ns
module Word7Segment(In,Out7b);
//Input is a 8 bits input from the game controoler
//Output 7 bits to the 7 segment display
	input [7:0] In;
	output [6:0] Out7b;
	reg [6:0] Out7b;

	always@(In)
	begin
		case(In)
			//A
			8'h41:
			begin 	       
				Out7b=7'b0001_000;
			end
			//b
			8'h42:
			begin
				Out7b=7'b0000_011;
			end
			//C
			8'h43:
			begin
				Out7b=7'b1000_110;
			end
			//d
			8'h44:
			begin
				Out7b=7'b0100_001;
			end
			//E
			8'h45:
			begin
				Out7b=7'b0000_110;
			end
			//F
			8'h46:
			begin
				Out7b=7'b0001_110;
			end
			//g
			8'h47:
			begin
				Out7b=7'b0010_000;
			end
			//h
			8'h48:
			begin
				Out7b=7'b0001_011;
			end
			//I
			8'h49:
			begin
				Out7b=7'b1001_111;
			end
			//J
			8'h4A:
			begin
				Out7b=7'b1110_000;
			end
			//K skip
			//L
			8'h4C:
			begin
				Out7b=7'b1000_111;
			end
			//M skip
			//N 
			8'h4E:
			begin
				Out7b=7'b0101_011;
			end
			//o
			8'h4F:
			begin
				Out7b=7'b0100_011;
			end
			//P
			8'h50:
			begin
				Out7b=7'b0001_100;
			end
			//q
			8'h51:
			begin
				Out7b=7'b0011_000;
			end
			//r
			8'h52:
			begin
				Out7b=7'b0101_111;
			end
			//S
			8'h53:
			begin
				Out7b=7'b0010_010;
			end
			//T skip
			8'h54:
			begin
				Out7b=7'b0000_111;
			end
			//U
			8'h55:
			begin
				Out7b=7'b1000_001;
			end
			//V skip
			//W skip
			//X skip
			//y
			8'h59:
			begin
				Out7b=7'b0010_001;
			end
			//Z skip
			//" "
			8'h20:
			begin
				Out7b=7'b1111_111;
			end
			//underscore "_"
			8'h5F:
			begin
				Out7b=7'b1110_111;
			end
			default:
			//Output displays blank
			begin
				Out7b=7'b1111_111;
			end
		endcase
	end
endmodule
