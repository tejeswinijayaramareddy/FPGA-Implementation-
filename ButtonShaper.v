/* +------------------------------------------------------------------------------------------+
   | Module: ButtonShaper                                                                     |   
   | Input:  Clk,Reset,ButtonShaperIn                                                         |
	| Output: ButtonShaperOut                                                                  |
	|This module provides a single high pulse for a long active low push button press          |                        
	+------------------------------------------------------------------------------------------+ */
`timescale 1 ns/1 ns
module ButtonShaper(Clk,Reset,ButtonShaperIn,ButtonShaperOut);
  input Clk,Reset,ButtonShaperIn;
  output ButtonShaperOut;
  reg ButtonShaperOut;
  
  parameter S_Off=1,S_Pulse=2,S_Wait=3;
  
  reg [1:0] State,StateNext;
  	always @ (State, ButtonShaperIn) begin
	  case (State)
	    S_Off: //The first stage when the button shaper is triggered using Reset
		 begin
		   ButtonShaperOut = 0;
		   if (ButtonShaperIn == 1)
			  begin
			    StateNext = S_Off;//The state remains off if the Button is not pressed
			  end
			else
			  begin
			    StateNext = S_Pulse;//The state moves to S_Pulse to generate a single pulse for the Button is pressed
			  end
		 end
		 
		 S_Pulse:
		 begin
		   ButtonShaperOut = 1;
		   StateNext = S_Wait;//After producing a single pulse the control moves to the wait state till the button is pressed again.
		 end
		   
		 S_Wait: 
		 begin
		   ButtonShaperOut = 0;
		   if (ButtonShaperIn == 1)
			  begin
			    StateNext = S_Off;//Considering the button is not pressed anymore we go to the initial off state
			  end
			else
			  begin
			  //A single long press of the button through multiple cycles is considered a single press and remains in the wait state till the pressed button is let go
			    StateNext = S_Wait;
			  end
		 end
			  
			  default:
			  begin
			    StateNext = S_Off;//If none of the conditions satisfy then the button shaper will always remain in the initial off state.
			  end
		  endcase
	end
	 always @ (posedge Clk) begin
    if (Reset == 0)
	   begin
		  State <= S_Off;//When the button shaper is reset then the state automatically is reset t the initial off state
		end
	 else
	   begin
		  State <= StateNext;//Else the next state is the one assigned by the previous always block
		end
	end
endmodule
