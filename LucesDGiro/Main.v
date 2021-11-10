//Main & only module
module FordTBird (
	input CLOCK, RESET, IZQ, DER, EMER, 
	output reg LA, LB, LC, RA, RB, RC
	);
	
	reg [2:0] Sreg, Snext;
	parameter [2:0] IDLE = 3'b000,
					L1	 = 3'b001,
					L2	 = 3'b011,
					L3	 = 3'b010,
					
					R1	 = 3'b101,
					R2	 = 3'b111,
					R3	 = 3'b110,
					LR3	 = 3'b100;
	
	always @ (posedge CLOCK or posedge RESET)
		if (RESET == 1) Sreg <=IDLE; else Sreg <= Snext;
		
	always @ (IZQ, DER, EMER, Sreg) begin
		case (Sreg)
			IDLE:	if (EMER | (IZQ & DER) )	Snext = LR3;
					else if (DER)				Snext = R1;
					else if (IZQ)				Snext =	L1;
					else 						Snext = IDLE;
			R1:		if (EMER) Snext = LR3; else Snext = R2; 
			R2:		if (EMER) Snext = LR3; else Snext = R3;
			R3:		if (EMER) Snext = LR3; else Snext = IDLE;
			L1:		if (EMER) Snext = LR3; else Snext = L2;
			L2:		if (EMER) Snext = LR3; else Snext = L3;
			L3:		if (EMER) Snext = LR3; else Snext = IDLE;
				
			LR3:	Snext = IDLE; 
			default Snext = IDLE;
		endcase
	 end
	 
	 
	 
	 always @ (Sreg) begin 
		 case (Sreg)
			 IDLE: 	{LC,LB,LA,RA,RB,RC} = 6'b000000;
			 R1: 	{LC,LB,LA,RA,RB,RC} = 6'b000100;
			 R2: 	{LC,LB,LA,RA,RB,RC} = 6'b000110;
			 R3: 	{LC,LB,LA,RA,RB,RC} = 6'b000111;
			 L1: 	{LC,LB,LA,RA,RB,RC} = 6'b001000;
			 L2: 	{LC,LB,LA,RA,RB,RC} = 6'b011000;
			 L3: 	{LC,LB,LA,RA,RB,RC} = 6'b111000;
			 LR3: 	{LC,LB,LA,RA,RB,RC} = 6'b111111;
		 	default	{LC,LB,LA,RA,RB,RC} = 6'b000000;
		 endcase
	end
endmodule
			 