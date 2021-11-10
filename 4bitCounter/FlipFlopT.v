module FlipFlopT(T, RES, Q, QN);
	input T, RES;
	output Q, QN;
	reg Q, QN;
	
	always @ (posedge T, RES)
		begin 
			if (RES)
				Q <= 0;
			else
				Q = !Q;
		end
		
	assign QN = !Q;
		
endmodule