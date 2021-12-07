module mux8_4 (
	input [7:0] in [3:0][1:0],
	input EN,
	input s,	
	output reg [7:0] out [3:0]
	);

	integer i;
	always @*
		if (EN)
			for (i=0; i<5;i=i+1)
				out[i]=7'b0000000;
		else
			for (i=0; i<5;i=i+1)
				out[i]=in[i][s];
endmodule

module testbench3;
	reg [7:0] in [3:0][1:0];
	reg EN;
	reg s;	
	wire [7:0] out [3:0];
	
	mux8_4 mux(in,EN,s,out);
	integer i;
	
	initial
		begin
			EN=1;
			s=0;
			for (i=0;i<5;i=i+1)
				in[i][0]=i;
			for (i=0;i<5;i=i+1)
				in[i][1]=i+5-1;
			#5ns EN=0;
			#5ns s=1;
			#5ns;
		end
endmodule
		