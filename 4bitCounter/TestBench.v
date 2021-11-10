module test;
	
	reg clk, res;
	reg [3:0] out;
	// Clock
	// periodo = 10 
	always #5 clk = ~clk;
	
	Counter cont (clk, res, out); 
						   
	
	initial begin
		clk <= 0;
		res <= 1;
		#10 res = 0;
		#200 $finish;	
	end
		
endmodule
	