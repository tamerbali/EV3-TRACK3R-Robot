module pwm
(
iclk,
iRST,
ihcount_max,
pwmout,
pwmout2,
pwm_other,
pwm_own
);

input iclk;
input iRST;
input [20:0] ihcount_max;
output pwmout;
output pwmout2;
input pwm_other;
output pwm_own;
reg [20:0] L_count;
reg pwmout_reg;
reg pwmout2_reg;
reg [20:0] H_count;
reg [20:0] ihcount_max_prev;
reg [5:0] pwm_pulses;

reg pwm_own_reg;
assign pwm_own = pwm_own_reg;
assign pwmout = pwmout_reg;
assign pwmout2 = pwmout2_reg;
always @ (posedge iclk or posedge iRST)
begin
	if (iRST)
	begin
		H_count <= 21'd0;
		L_count <= 21'd0;
		pwmout_reg <= 1'b0;
		pwmout2_reg <= 1'b0;
	end
	else 
	begin

	if	(pwm_pulses <= 6'd25)
	begin
   pwm_own_reg <= 1'b0;
	if (pwmout_reg == 1'b1)
	begin
		if (H_count >= ihcount_max_prev)
	   begin 
			L_count <= 21'd0;
			H_count <= 21'd0;
			pwmout_reg <= 1'b0;
			pwmout2_reg <= 1'b0;
			pwm_pulses <= pwm_pulses + 6'd1;
		end
		else
		begin
			H_count <= H_count + 21'd1;
			
		end
	end
	else
	begin	
		if (L_count >= 21'd1000000)
		begin
				pwmout_reg <= 1'b1;
				pwmout2_reg <= 1'b1;
				H_count <= 21'd0;
				L_count <= 21'd0;
				
		end
		else
		begin
			 L_count <= L_count + 21'd1;
		end
	end
	end
	else 
	begin
	pwm_own_reg <= 1'b1;
	if (pwm_other == 1'b1)
	begin
	     pwm_pulses <= 6'd0;
	     ihcount_max_prev <= ihcount_max;
	end
	end

 end
end
endmodule
