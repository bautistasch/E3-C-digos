module decoder (
	input EN,
	input [1:0] in,
	output reg [3:0]	out
	);
	
	always @ (in or EN)
		if (!EN)
			out=4'b0;
		else
			case (in)
				2'd0: out=4'b1000;
				2'd1: out=4'b0100;
				2'd2: out=4'b0010;
				2'd3: out=4'b0001;
			endcase
endmodule

module testbench;
	reg EN;
	reg [1:0] in;
	wire [3:0] out;
	decoder dec(EN,in,out);
	
	initial
		begin
			EN=0;
			#2ns in=1;
			#2ns in=3;
			#1ns EN=1;
			#2ns in=2;
			#2ns in=1;
			#2ns in=0;
			#2ns;
		end
endmodule
	