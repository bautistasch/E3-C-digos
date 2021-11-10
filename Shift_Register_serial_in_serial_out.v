module shift_register (
	input clk, 
	input clr, 
	input in,
	output reg [3:0] out
	);
	
	always @ (posedge clk or clr)
		if (clr==1)
			out=4'b0000;
		else
			out={in, out[3:1]};
endmodule


module test;
	reg clk, clr; 
	reg in; 
	reg [3:0]out;
	shift_register U0(clk,clr,in,out);
	
	initial begin
		clk=0;
		in=0;
		clr=1;
		forever #5ns clk=~clk;
	end
	initial begin
			#2ns clr=0;
			in=0;
			#2ns in=1;	
			#5ns in=1;
			#5ns in=0;
			#5ns in=1;
			#30ns $finish;
	end		
endmodule
	
	
				
		
	
	
