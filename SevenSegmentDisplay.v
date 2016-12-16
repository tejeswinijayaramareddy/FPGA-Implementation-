/* +--------------------------------------------------------------------------------------+
   | Module: SevenSegmentDisplay                                                          |   
   | Input:  IdDigitIn                                                                    |
	| Output: IdDisplayOut                                                                 |
	|This module lights up coresponding segments to display digits on the seven segment    |                        
	+--------------------------------------------------------------------------------------+ */
`timescale 1 ns/1 ns
module SevenSegmentDisplay(IdDigitIn,IdDisplayOut);
  input [3:0] IdDigitIn;
  output [6:0] IdDisplayOut;
  reg [6:0] IdDisplayOut;
  
  always @ (IdDigitIn) begin
    case (IdDigitIn)
	   4'b0000:
		  begin
		    IdDisplayOut = 7'b1000000;//Diplay '0'
		  end 
		4'b0001:
		  begin
		    IdDisplayOut = 7'b1111001;//Display'1'
		  end 
		4'b0010:
		  begin
		    IdDisplayOut = 7'b0100100;//Display '2'
		  end 
		4'b0011:
		  begin
		    IdDisplayOut = 7'b0110000;//Display '3'
		  end 
		4'b0100:
		  begin
		    IdDisplayOut = 7'b0011001;//Display '4'
		  end 
		4'b0101:
		  begin
		    IdDisplayOut = 7'b0010010;//Display '5'
		  end 
		4'b0110:
		  begin
		    IdDisplayOut = 7'b0000010;//Display '6'
		  end 
		4'b0111:
		  begin
		    IdDisplayOut = 7'b1111000;//Display '7'
		  end 
		4'b1000:
		  begin
		    IdDisplayOut = 7'b0000000;//Display '8'
		  end 
		4'b1001:
		  begin
		    IdDisplayOut = 7'b0010000;//Display '9'
		  end 
		4'b1010:
		  begin
		    IdDisplayOut = 7'b0001000;//Display 'A'
		  end 
		4'b1011:
		  begin
		    IdDisplayOut = 7'b0000011;//Display 'B'
		  end 
		4'b1100:
		  begin
		    IdDisplayOut = 7'b1000110;//Display 'C'
		  end 
		4'b1101:
		  begin
		    IdDisplayOut = 7'b0100001;//Display 'D'
		  end 
		4'b1110:
		  begin
		    IdDisplayOut = 7'b0000110;//Display 'E'
		  end 
		4'b1111:
		  begin
		    IdDisplayOut = 7'b0001110;//Display 'F'
		  end 
		default:
		  begin
		    IdDisplayOut = 7'b1111111;
		  end 
	endcase
  end
endmodule

