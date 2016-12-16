/* +--------------------------------------------------------------------------------------+
   | Module: PassFailDisplay                                                              |   
   | Input:  WarningFlag                                                                  |
	| Output: DisplayOut                                                                   |
	|This module takes the flag in and displays if Login Check passes or fails             |                        
	+--------------------------------------------------------------------------------------+ */
`timescale 1 ns/1 ns
module PassFailDisplay(WarningFlag,DisplayOut);
  input [1:0] WarningFlag;
  output [6:0] DisplayOut;
  reg [6:0] DisplayOut;
  
  always @ (WarningFlag) begin
    case (WarningFlag)
	   2'b01:
		  begin
		    DisplayOut = 7'b0001110;//Display 'F'
		  end 
		2'b10:
		  begin
		    DisplayOut = 7'b0001100;//Display 'P'
		  end 
		2'b11:
		  begin
		    DisplayOut = 7'b1000000;//Display 'O'
		  end 
		default
		  begin 
		    DisplayOut = 7'b1000000;//Display 'O'
		  end
	endcase
  end
endmodule
