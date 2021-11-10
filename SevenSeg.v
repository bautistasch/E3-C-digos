// Module principal
`timescale 1ns/1ps
module SevenSegDec (IN, EN, SEGS);
	
	input [3:0] IN;   
	//reg [3:0] IN;
	
	input EN; 
	//wire  EN; 
	
	output [6:0] SEGS;
	reg [6:0] SEGS;
	
	always @ (IN or EN)
		begin 
			if (EN)
				case (IN)
					
					4'd0: SEGS = 7'b1111110;
					4'd1: SEGS = 7'b1100000;
					4'd2: SEGS = 7'b1101101;
					4'd3: SEGS = 7'b1111001;
					4'd4: SEGS = 7'b1101110;
					4'd5: SEGS = 7'b1111110;
					4'd6: SEGS = 7'b1111110;
					4'd7: SEGS = 7'b1111110;
					4'd8: SEGS = 7'b1111110;
					4'd9: SEGS = 7'b1111110;
					default: SEGS = 7'bx;
				endcase
				//{SEGA, SEGB, SEGC, SEGD, SEGE, SEGF, SEGG} = SEGS;
			end
endmodule			 

module TestSevenSeg;
	
	reg EN_;
	reg [3:0] IN_;
	reg [7:0] SEGS_;
	
	SevenSegDec U1(.IN(IN_), .EN(EN_), .SEGS(SEGS_));

	initial 
		
		begin 
			assign EN_ = 1;
			
			#5ns assign IN_ = 0;
			#5ns assign IN_ = 1;
			#5ns assign IN_ = 2;  
			#5ns assign IN_ = 3;
			#5ns assign IN_ = 4;
			#5ns $finish;
		end
		
endmodule