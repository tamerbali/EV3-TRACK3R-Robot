module colorDetect
(
 iRed,
 iBlue,
 iGreen,
 oRed,
 oBlue,
 oGreen,
 iClk,
 iRST,
 iVGA_X,
 iVGA_Y,
 oDirection,
 iV_SYNC
 );
 input [9:0] iRed;
 input [9:0] iBlue;
 input [9:0] iGreen;
 output[9:0] oRed;
 output[9:0] oBlue;
 output[9:0] oGreen;
 output [9:0] oDirection;
 input iClk;
 input iRST;
 input [9:0] iVGA_X;
 input [8:0] iVGA_Y;
 input iV_SYNC;
 wire [21:0] RedSquare;
 wire [21:0] BlueSquare;
 wire [21:0] Greensquare;

 wire [24:0] sumSquareColor;
 reg [9:0] X_Direction;

 // Vector distance of the colors
 assign RedSquare = (iRed) * (iRed);
 assign BlueSquare = (10'hFFFF - iBlue)*(10'hFFFF - iBlue);
 assign GreenSquare = (iGreen)*(iGreen);

 
 assign sumSquareColor = RedSquare + BlueSquare + GreenSquare;
 
 reg [9:0] ored_reg;
 reg [9:0] oblue_reg;
 reg [9:0] ogreen_reg;
 
 reg [9:0] X_COORD;

 
 reg [4:0] Blue_counter;
 reg first_pixel;
 reg first_cap;
assign oGreen = ogreen_reg;
assign oBlue = oblue_reg;
assign oDirection = X_Direction;
 
 always @ ( posedge iClk or posedge iRST)
 begin
 

	 if (iRST)
	 begin
		    ored_reg <= 10'd0;
          ogreen_reg <= 10'd0;
          oblue_reg <= 10'd0;  
			 X_COORD <= 10'd0;
	 
	 
	 end
	 else
	 begin
		if ( sumSquareColor < 24'd10000) 
		begin
			
			  ored_reg <= iRed;
           ogreen_reg <= iGreen;
           oblue_reg <= iBlue;
			  first_cap <= 1'b1;
			  if ( first_pixel)
			  begin
				if ( Blue_counter == 5'd10)
				begin
					X_Direction <= X_COORD;
				end
				else
					Blue_counter <= Blue_counter + 5'd1;
				 
			  end
			  else
			  begin
				first_pixel = 1'b1;
				X_COORD <= iVGA_X;
			  end
			
			  
        end
        else
        begin
			ored_reg <= iGreen;
			ogreen_reg <= iGreen;
			oblue_reg <= iGreen;
			
		  
			if (first_cap == 1'b0)
				X_Direction <= 10'd0;
			 if (iVGA_Y == 9'd480)
			begin
				first_cap <= 1'b0;
				first_pixel = 1'b0;
				 X_COORD <= 10'd0;
				Blue_counter <= 5'd0;
			end
		end
		
			
	end
end

endmodule
