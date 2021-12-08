// Módulo principal
`timescale 1ns/1ps
module MUX8_2 (INS, SETIN, SETOUT, OUT, EN);
	// I/O set
	input [7:0] INS[0:7];
	
	input [2:0] SETIN;
	reg [2:0] SETIN;
	input SETOUT;
	
	input EN;
	
	output [7:0] OUT[0:1];
	reg [7:0] OUT[0:1];
	
	integer j;
	integer p;
	
	always @*
		begin
			if(EN == 1)
				begin
					j = SETIN;
					p = SETOUT;
					OUT[p] =  INS[j];
				end
			else
				begin
					OUT[0] = 8'bz;
					OUT[1] = 8'bz;
				end
		end
endmodule
					

// TestBench
module Test;  
	reg [7:0] INS_ [0:7];
	reg [2:0] SETIN_;
	reg SETOUT_;
	reg [7:0] OUT_ [0:1];
	reg EN_;
	
	
	MUX8_2 U1 (.INS(INS_), .SETIN(SETIN_), .SETOUT(SETOUT_), .OUT(OUT_), .EN(EN_));
	
	
	initial 
		begin
			#10ns assign EN_ = 1;
			assign SETOUT_ = 1;
			assign SETIN_ = 3'b000;
			INS_[0] = 8'b0000_0100;	
			
			#10ns assign SETOUT_ = 1;
			assign SETIN_ = 3'b000;
			INS_[0] = 8'b0000_0110;
			
			#5ns assign EN_ = 0; //Muestra la salida tri state
			
			#10ns assign SETOUT_ = 0;
			assign SETIN_ = 3'b000;
			INS_[0] = 8'b0000_1111;	
			
			
			#10ns $finish;
		end
		
endmodule
						