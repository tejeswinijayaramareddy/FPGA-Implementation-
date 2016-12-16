module FourBitReg(Clk,Reset,Submit,DataIn,DataOut,ValidData);
  input Clk,Reset,Submit;
  input [3:0]DataIn;
  output [31:0]DataOut;
  output ValidData;
  reg [31:0]DataOut;
  reg [31:0] temp = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
  reg[3:0] Count;
  reg ValidData;
  
  always @ (posedge Clk) begin
    if (Reset == 0)
	   begin
		  DataOut <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		  Count <=4'b0000;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b0000))//Entering First Digit of ID
      begin
	     temp[31:28] <= DataIn;
		  Count<= Count + 4'b0001;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b0001))//Entereing Second digit of ID
      begin
	     temp[27:24] <= DataIn;
		  Count<= Count + 4'b0001;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b0010))//Entering third digit of ID
      begin
	     temp[23:20] <= DataIn;
		  Count<= Count + 4'b0001;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b0011))//Entering fourth digit of ID
      begin
	     temp[19:16] <= DataIn;
		  Count<= Count + 4'b0001;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b0100))//Entering first digit of password
      begin
	     temp[15:12] <= DataIn;
		  Count<= Count + 4'b0001;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b0101))//Entering second digit of password
      begin
	     temp[11:8] <= DataIn;
		  Count<= Count + 4'b0001;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b0110))//Eneting third digit of password
      begin
	     temp[7:4] <= DataIn;
		  Count<= Count + 4'b0001;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b0111))//Entering foruth digit of password
      begin
	     temp[3:0] <= DataIn;
		  Count<= Count + 4'b0001;
		  ValidData<=1'b0;
		end
	else if ((Submit == 1) && (Count == 4'b1000))//Final submit of credentials
      begin
	     DataOut <= temp;
		  Count<= 4'b1111;
		  ValidData<=1'b1;
		end
	else if (Count == 4'b1111)
	  begin
	     ValidData<=1'b0;
		end
	end
endmodule	
  
  