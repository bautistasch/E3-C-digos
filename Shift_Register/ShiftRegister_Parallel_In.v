module ParallelInShiftRegister
(
	input wire SerialIn,
	input wire CLK,		
	input wire RST,
	input wire mode,  
	input wire [3:0] paralelIn,
	output reg [3:0] Q
);

	wire [3:0] D;

	parameter PARALEL_IN_ON = 0;
	parameter PARALEL_IN_OFF = 1;

	always @(posedge CLK or negedge RST)
	begin
		if(RST == 0) Q = 0;
		else
		begin
			Q = D;
		end
	end	
	
	assign D = (mode == PARALEL_IN_ON) ? paralelIn : {Q[2:0], SerialIn};
	
endmodule 



module TestBench();

	reg SerialIn;
	reg CLK;		
	reg RST;
	reg mode;  
	reg [3:0] paralelIn;
	reg [3:0] Q;
	
	ParallelInShiftRegister U1(
	.SerialIn(SerialIn),
	.CLK(CLK),		
	.RST(RST),
	.mode(mode),  
	.paralelIn(paralelIn),
	.Q(Q)	
	);
	
	always #5ns CLK = ~CLK;
	initial  
	begin
		RST = 1;
		CLK = 0;
		mode = 1;
		SerialIn = 0;
		paralelIn = 0;
		#2ns 
		RST = 0;
		#2ns
		RST = 1;
		#5ns 
		SerialIn = 1;
		#5ns 
		SerialIn = 1;
		#5ns 
		SerialIn = 0;
		#5ns 
		SerialIn = 1;
		#5ns 
		SerialIn = 0;
		#5ns 
		SerialIn = 1;
		#35ns
		mode = 0;
		paralelIn = 4'b1001;  
		#35ns $finish;
	end
	
endmodule	