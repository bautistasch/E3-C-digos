//Main & only module
module QControl (
	input CLK, DCE, POK, PNOK, DCS, RST, 
	output reg Me, Ms, Lok, Lnok
	);
	
	reg [2:0] Sreg, Snext;
	parameter [1:0] Prev_CE = 2'b00,
					CE	 	= 2'b01,
					CS	 	= 2'b10,
					Post_CS = 2'b11;
	
					
	always @(posedge RST, posedge CLK)
        if (RST == 1) Sreg <= Prev_CE;
		else Sreg <= Snext;
	
			
	always @ (DCE, POK, PNOK, DCS, Sreg) begin
		case (Sreg)
			Prev_CE:if(!DCE)
					begin  
						Me = 1;
						Ms = 0;
						Lnok = 0;
						Lok = 0;
						Snext = Prev_CE;
					end
					else
					begin		
						Me = 0;
						Snext = CE;
					end
					
			CE:		if(POK)
					begin  
						Lok = 1;
						Ms = 1;
						Snext = CS;
					end
					else if (PNOK)
					begin  
						Lnok = 1;
						Ms = 1;
						Snext = CS;
					end
					else
						Snext = CE;	
						
			CS:	 	if(DCS)
					begin
						Ms = 0;
						Snext = Post_CS;
					end
					else Snext = CS;
				
			Post_CS:if(!DCS)
					begin
						Lnok = 0;
						Lok = 0;
						Snext = Prev_CE;
					end
					else Snext = Post_CS;
				
			default Snext = Prev_CE;
		endcase
	 end
endmodule