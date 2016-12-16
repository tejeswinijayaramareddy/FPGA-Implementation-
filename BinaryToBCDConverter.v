/* +------------------------------------------------------------------------+
   | Module: BinaryToBCDConverter                                           |
   | input:  BinaryIn                                                       |
	| output: OnethPlaceDigit,TenthPlaceDigit                                |
	| This module converts a given Binary number to corresponding BCD number |
	| Shift the binary bits to left and concatenate extra places with 0. When|
	| the binary value in any of the colum is 5 or 4 add 3.                  |
   +------------------------------------------------------------------------+ */
module BinaryToBCDConverter(BinaryIn,OnethPlaceDigit,TenthPlaceDigit);
input [7:0] BinaryIn;
output [3:0] OnethPlaceDigit;
output [3:0]TenthPlaceDigit;
wire [3:0] Convert1;
wire [3:0] Convert2;
wire [3:0] Convert3;
wire [3:0] Convert4;
wire [3:0] Convert5;
wire [3:0] Convert6;
wire [3:0] Convert7;
wire [3:0] DigitOut1;
wire [3:0] DigitOut2;
wire [3:0] DigitOut3;
wire [3:0] DigitOut4;
wire [3:0] DigitOut5;
wire [3:0] DigitOut6;
wire [3:0] DigitOut7;

//create digits with 8 shifts one bit at a time
 assign DigitOut1 = {1'b0,BinaryIn[7:5]};         
 assign DigitOut2 = {Convert1[2:0],BinaryIn[4]};
 assign DigitOut3 = {Convert2[2:0],BinaryIn[3]};
 assign DigitOut4 = {Convert3[2:0],BinaryIn[2]};
 assign DigitOut5 = {Convert4[2:0],BinaryIn[1]};
 assign DigitOut6 = {1'b0,Convert1[3],Convert2[3],Convert3[3]};
 assign DigitOut7 = {Convert6[2:0],Convert4[3]};


Addition myAddition1(DigitOut1,Convert1); //check the DigitOut1, if it is 5 or more add 3 to it
Addition myAddition2(DigitOut2,Convert2); //check the DigitOut2, if it is 5 or more add 3 to it
Addition myAddition3(DigitOut3,Convert3); //check the DigitOut3, if it is 5 or more add 3 to it
Addition myAddition4(DigitOut4,Convert4); //check the DigitOut4, if it is 5 or more add 3 to it
Addition myAddition5(DigitOut5,Convert5); //check the DigitOut5, if it is 5 or more add 3 to it
Addition myAddition6(DigitOut6,Convert6); //check the DigitOut6, if it is 5 or more add 3 to it
Addition myAddition7(DigitOut7,Convert7); //check the DigitOut7, if it is 5 or more add 3 to it

 assign OnethPlaceDigit = {Convert5[2:0],BinaryIn[0]}; //After shift and add3 read the digit in unit place
 assign TenthPlaceDigit = {Convert7[2:0],Convert5[3]}; //After shift and add3 read the digit in unit place
endmodule
 