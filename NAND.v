// Módulo principal
// Compuerta NAND
`timescale 1ns/1ps
module NAND (A, B, Z);
	
	input A, B;
	//wire A, B;
	output Z;
	//wire Z;
	
	assign #(3,1) Z = !(A && B);
	//assign Z = !(A || B); -> OR 
	//assign Z = !A; -> NOT
	//assign Z = (A ^ B); -> XOR
	
endmodule


// Módulo de Testeo
module Test;
	
	reg A_, B_;
	wire wire_1;
	
	NAND U1 (.A(A_), .B(B_), .Z(wire_1));
	
	initial
		
		begin 
		
			assign A_ = 0;
			assign B_ = 0;		   	
				 
			#10ns assign A_ = 1;
			assign B_ = 0;			  
				 
			#10ns assign A_ = 0;
			assign B_ = 1;
			
			#10ns assign A_ = 1;
			
			#10ns assign A_ = 0;
			assign B_ = 0;
				 
			#10ns $finish;
		end
	
endmodule