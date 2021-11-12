//Testbench for break control state machines
module Test;
  reg CLK_;                     // Clock 
  reg RST_;                    // Reset (async)
  reg DCE_, POK_, PNOK_, DCS_;
  wire ME_, MS_, LOK_, LNOK_;

  QControl Main( .CLK (CLK_),
                 .RST (RST_),
                 .DCE (DCE_),
				 .POK (POK_),
				 .PNOK (PNOK_),
				 .DCS (DCS_),
				 .Me(ME_),
				 .Ms(MS_),
				 .Lok(LOK_),
				 .Lnok(LNOK_)
	);
				 
  // Clock
  // periodo = 10 
  always #5ns CLK_ = ~CLK_;
 
 
  initial begin
    CLK_ <= 0;
    RST_ <= 0;
    DCE_ <= 0;
	DCS_ <= 0;
	POK_<= 0;
    PNOK_<= 0;
	
	//Pulso de reset
    #5ns  RST_ <= 1;
	#8ns  RST_ <= 0;

    //Flujo
    #10ns  DCE_ <= 1;
	#10ns  POK_ <= 1;
	#10ns  DCS_ <= 1;
		   DCE_ <= 0;
		   POK_ <= 0;
	#10ns  DCS_ <= 0;
			
	

    #20ns $finish;
  end
endmodule