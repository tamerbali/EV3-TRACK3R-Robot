module MotorControl
(
iDirection,
oLeftMotor,
oRightMotor,
oNumPulses,
iClk,
iRST
);

input [9:0] iDirection;
output [20:0] oLeftMotor;
output [20:0] oRightMotor;
output [9:0] oNumPulses;
input iClk;
input iRST;

reg [20:0] oLeft_reg;
reg [20:0] oRight_reg;
reg [9:0] oNumPulses_reg;

assign oLeftMotor = oLeft_reg;
assign oRightMotor = oRight_reg;
assign oNumPulses = oNumPulses_reg;

always @ (posedge iClk or posedge iRST)
begin

	if (iRST)
	begin
		oLeft_reg <= 21'd0;
		oRight_reg <= 21'd0;
	end
	else
	begin
		if ((iDirection > 10'd2) && (iDirection < 10'd213))
		begin	
			oLeft_reg <= 21'd65000;
			oRight_reg<= 21'd65000;
			oNumPulses_reg <= 10'd20;
		end
		else if ((iDirection >= 10'd213) && (iDirection < 10'd426))
		begin
		   oLeft_reg <= 21'd85000;
			oRight_reg<= 21'd65000;
			oNumPulses_reg <= 10'd40;
		
		end
		else if ((iDirection >= 10'd426) && (iDirection < 10'd640))
		begin
		   oLeft_reg <= 21'd85000;
			oRight_reg<= 21'd85000;
			oNumPulses_reg <= 10'd20;
		
		end
		else
		begin
		   oLeft_reg <= 21'd0;
			oRight_reg<= 21'd0;
			oNumPulses_reg <= 10'd0;
		end
	end
end
endmodule
	