// TestBench
module Test;  
	reg clk_, RESET_, IZQ_, DER_, EMER_; 
	reg LA_, LB_, LC_, RA_, RB_, RC_;
	
	
	FordTBird FTB (
	.CLOCK(clk_), .RESET(RESET_), .IZQ(IZQ_), .DER(DER_), .EMER(EMER_), 
	.LA(LA_), .LB(LB_), .LC(LC_), .RA(RA_), .RB(RB_), .RC(RC_)
	);
	
	// Clock
  	// periodo = 10 
  	always #5ns clk_ = ~clk_;
		
	initial begin
	    //Estados iniciales
	    clk_ <= 0;
	    RESET_ <= 0;
	
		#50ns IZQ_ = 1;
		#100ns EMER_ = 1;
		#50ns EMER_ = 0;
				IZQ_ = 0;
			
			
		#50ns $finish;
	end
		
endmodule