/* +------------------------------------------------------------------------------+
   | Module: Addition                                                             |
   | input:  ModBinaryIn                                                          |
	| output: BDCOut                                                               |        
	| This module checks the input value. If it's value is 5 or more, add 3 to its.|
	+------------------------------------------------------------------------------+ */
	
module Addition(ModBinaryIn,BDCOut);
input [3:0] ModBinaryIn;             
output [3:0] BDCOut;
reg [3:0] BDCOut;                
always @ (ModBinaryIn)
   //check for ModBinaryIn if it is 5 or more add 3 to it
	case (ModBinaryIn)
	4'b0000: BDCOut <= 4'b0000;
	4'b0001: BDCOut <= 4'b0001;
	4'b0010: BDCOut <= 4'b0010;
	4'b0011: BDCOut <= 4'b0011;
	4'b0100: BDCOut <= 4'b0100;
	4'b0101: BDCOut <= 4'b1000;
	4'b0110: BDCOut <= 4'b1001;
	4'b0111: BDCOut <= 4'b1010;
	4'b1000: BDCOut <= 4'b1011;
	4'b1001: BDCOut <= 4'b1100;
	default: BDCOut <= 4'b0000;
	endcase
endmodule 