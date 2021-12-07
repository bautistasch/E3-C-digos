module shift_register (
	input clk, 
	input clr, 
	input [3:0] in,
	output reg [3:0] out
	);
	
	always @ (posedge clk or clr)
		if (clr==1)
			out=4'b0000;
		else
			out= in[3:0] | {1'b0, out [3:1]};
endmodule


module test;
	reg clk, clr; 
	reg [3:0]in; 
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
			#2ns in=4'b1010;
			#5ns in=4'b0000;
			#30ns $finish;
	end		
endmodule