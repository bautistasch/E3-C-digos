// Módulo principal
`define STATE_1 1
`define STATE_2 2
`timescale 1ns/1ps
module PEncoder (IN1, IN2, INT1, INT2, OUT);
	// I/O set
	input [7:0] IN1;
	input [7:0] IN2;
	
	output INT1, INT2;
	reg INT1, INT2;
	
	output [2:0] OUT;
	reg [2:0] OUT;
	
	always@*
		begin
			if(IN1 == 0)
			begin
				assign INT1 = 1'b0;
				assign INT2 = 1'b1;
				casex (IN2)
					8'bxxxxxxx1: OUT =3'b000;
					8'bxxxxxx10: OUT =3'b001;
					8'bxxxxx100: OUT =3'b010;
					8'bxxxx1000: OUT =3'b011;
					8'bxxx10000: OUT =3'b100;
					8'bxx100000: OUT =3'b101;
					8'bx1000000: OUT =3'b110;
					8'b10000000: OUT =3'b111;
				endcase
			end
			else
			begin
	assign INT1 = 1'b0;
				assign INT1 = 1'b1;
				assign INT2 = 1'b0;
				casex (IN1)
					8'bxxxxxxx1: OUT =3'b000;
					8'bxxxxxx10: OUT =3'b001;
					8'bxxxxx100: OUT =3'b010;
					8'bxxxx1000: OUT =3'b011;
					8'bxxx10000: OUT =3'b100;
					8'bxx100000: OUT =3'b101;
					8'bx1000000: OUT =3'b110;
					8'b10000000: OUT =3'b111;
				endcase
			end
		end
endmodule
		

// Test Bench
module Test;
	reg [7:0] IN1_;
	reg [7:0] IN2_;
	reg [2:0] OUT_;
	reg INT1, INT2_;
	
	PEncoder U1 (.IN1(IN1_), .IN2(IN2_), .INT1(INT1_), .INT2(INT2_), .OUT(OUT_));
	
	initial 
		begin
			
			#5ns assign IN1_ = 8'b0000_0000;
			assign IN2_ = 8'b0001_0000; 
			#5ns assign IN1_ = 8'b0000_0010;
			#5ns assign IN1_ = 8'b0000_0100;
			#5ns assign IN1_ = 8'b0000_1000;
			#5ns assign IN1_ = 8'b0001_0000; 
			
			#5ns $finish;
		end
		
endmodule		