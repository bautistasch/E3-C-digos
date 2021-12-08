`timescale 1ns/1ps
module Deco4to16 (IN, OUT, ENA, ENB, ENC);
	
	input [3:0] IN;
	output [15:0] OUT;
	input ENA, ENB, ENC;
	wire ENA, ENB, ENC;
	reg [15:0]OUT;
	reg	[3:0] IN;
	
	always @ (IN or ENA or ENB or ENC)
		begin
			if(ENA && ENB && ~ENC)
				begin
				  case(IN)
					  4'd0: OUT = 0'b0000_0000_0000_0001;	 
					  4'd1: OUT = 0'b0000_0000_0000_0010;
					  4'd2: OUT = 0'b0000_0000_0000_0100;
					  4'd3: OUT = 0'b0000_0000_0000_1000;
					  4'd4: OUT = 0'b0000_0000_0001_0000;
					  4'd5: OUT = 0'b0000_0000_0010_0000;
					  4'd6: OUT = 0'b0000_0000_0100_0000;
					  4'd7: OUT = 0'b0000_0000_1000_0000;
					  4'd8: OUT = 0'b0000_0001_0000_0000;
					  4'd9: OUT = 0'b0000_0010_0000_0000;
					  4'd10: OUT = 0'b0000_0100_0000_0000;
					  4'd11: OUT = 0'b0000_1000_0000_0000;
					  4'd12: OUT = 0'b0001_0000_0000_0000;
					  4'd13: OUT = 0'b0010_0000_0000_0000;
					  4'd14: OUT = 0'b0100_0000_0000_0000;
					  4'd15: OUT = 0'b1000_0000_0000_0000;
				  endcase    
				end
			else 
				OUT = 16'b0000_0000_0000_0000;  	
		end		 
endmodule				 


module Test;
	
	reg [3:0] IN_;
	reg [15:0] OUT_;
	reg ENA_, ENB_, ENC_;
	
	Deco4to16 U1 (.IN(IN_), .OUT(OUT_), .ENA(ENA_), .ENB(ENB_), .ENC(ENC_));
	
	initial 
		
		begin 
			assign ENA_ = 1;
			assign ENB_ = 1;
			assign ENC_ = 0;
			
			#5ns assign IN_ = 0;
			#5ns assign IN_= 1;
			#5ns assign IN_= 2;
			#5ns assign IN_= 3;
			#5ns assign IN_= 4;
			#5ns assign IN_= 5;
			#5ns assign IN_= 6;
			#5ns assign IN_= 7;	
			#5ns assign IN_= 7;
			#5ns assign IN_= 9;
			#5ns assign IN_= 10;
			#5ns assign IN_= 11;
			#5ns assign IN_= 12;
			#5ns assign IN_= 13;
			#5ns assign IN_= 14;
			#5ns assign IN_= 15;
			
			#5ns $finish;
		end
	
endmodule