module ALU
( 
	input wire CLK,
	input wire RST,
	input wire [3:0] A,
	input wire [3:0] B,
	output reg [3:0] C,
	output wire flagZero,
	output wire flagDetect
);
	wire [4:0] overflow;
	assign overflow = A + B;	
	
	stateMachineFlagDetector U1(.CLK(CLK), .RST(RST), .overFlowBit(overflow[4]), .flagDetector(flagDetect) );
	
	always @(posedge CLK or negedge RST)   
	if(RST == 0) C = 0;
	else	
		begin
			C = A + B; 
		end
	
	assign flagZero = (C == 0) ? 1 : 0;
	
endmodule			

module stateMachineFlagDetector
(
	input wire CLK,	  
	input wire RST,
	input wire overFlowBit,
	output wire flagDetector,
);

	parameter [1:0] S0 = 0; 
	parameter [1:0] S1 = 1;
	parameter [1:0] S2 = 2;
	parameter [1:0] S3 = 3;
	
	reg [1:0] y, Y;
	
	initial
	begin
		y = S0;	
	end
	
	always @(y or overFlowBit)
	begin
		case(y)
			S0:
				if(overFlowBit == 1)  
					Y = S1;
				else
					Y = S0;
			S1:
				if(overFlowBit == 0)  
					Y = S2;
				else
					Y = S1;		
			S2:			
				if(overFlowBit == 1)  
					Y = S3;
				else
					Y = S0;		
			S3:	  
				if(overFlowBit == 1)  
					Y = S1;
				else
					Y = S2;		
			default: Y = 2'bxx;  
		endcase
	end

    always @(negedge RST, posedge CLK)
    if (RST == 0) y <= S0;		  
    else y <= Y;
		
	assign flagDetector = (y == S3) ? 1 : 0;
		
endmodule			   		   



module TestBench();
	
	reg CLK;
	reg RST;
	reg [3:0] A;
	reg [3:0] B;
	reg [3:0] C;
	reg flagZero;
	reg flagDetect;
	
	
	ALU U1(	
	.CLK(CLK),
	.RST(RST),
	.A(A),
	.B(B),
	.C(C),
	.flagZero(flagZero),
	.flagDetect(flagDetect)
	);
	
	
	always #5ns CLK = ~CLK;
		
	initial	
	begin
	CLK = 0;
	RST = 1;	
	A = 0;
	B = 0;
	#2ns 
	RST = 0;
	#2ns
	RST = 1;
	#2ns
	A = 3;
	B = 4;
	#30ns
	A = 0;
	B = 0;
	#7ns
	A = 4'b1111;
	B = 4'b0001;
	#7ns
	A = 4'b0001;
	B = 4'b0001;
	#7ns
	A = 4'b1111;
	B = 4'b0001;	
	#100ns $finish;
	end
	
endmodule
	
	