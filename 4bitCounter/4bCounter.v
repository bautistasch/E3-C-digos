module Counter (CLK, RES, OUT);
	input CLK, RES;
	output [3:0] OUT;
	
	reg [3:0] OUT;	
	wire w1, w2, w3, w4;
	
	FlipFlopT FFT1 (CLK, RES, OUT[0], w1);
	FlipFlopT FFT2 (OUT[0], RES, OUT[1], w2);
	FlipFlopT FFT3 (OUT[1], RES, OUT[2], w3);
	FlipFlopT FFT4 (OUT[2], RES, OUT[3], w4); 
		
endmodule