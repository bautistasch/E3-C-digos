module ALU(A, B, CY, OP, ST, Y);
	input wire [7:0] A, B;
	output wire [7:0] Y;
	input wire CY;
	input wire [1:0] OP;
	output wire ST;
	
	reg [8:0] Yi;
	
	always @(A or B or CY or OP)
	begin
		case(OP)
		0'b00:  // Y = A
			Yi = {1'b0, A};
		0'b01:			   
			Yi = A + B + CY; // Como se castea de [7:0] a [8:0] ?
		0'b10:
			Yi =  A - B;
		0'b11:
			Yi = 9'b0;	  
		default
			Yi = 9'bz;
		endcase
			
	end
	
	assign Y  = Yi[7:0];
	assign ST = Yi[8];
endmodule					   


module Test();
	
	reg [7:0] A, B;
	reg [7:0] Y;
	reg CY;
	reg [1:0] OP;
	reg ST;
	
	
	ALU U1(.A(A), .B(B), .CY(CY), .OP(OP), .ST(ST), .Y(Y));
	
	initial 
	begin 
		CY = 1;
		#5ns 
		OP = 0;
		A = 3;
		B = 2;
		#5ns 
		OP = 1;
		#5ns 
		OP = 2;
		#5ns 
		OP = 3; 
		#5ns $finish;
		
	end
	
	
endmodule	