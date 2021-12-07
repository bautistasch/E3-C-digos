module priority_encoder (
	input EN,
	input [0:7] in,
	output reg [2:0] out,
	output reg GS, 
	output reg EO
	);
	integer i;
	always @ (EN or in)
		if (EN)
			{GS, EO, out} = {1'b1,1'b1, 3'b111};
		else
		begin
				
			for (i=0;i<8;i=i+1)
				if (!in[i])
				begin
					{GS, EO}={1'b0,1'b1};
					out=~i;
					$display("%d",i);
				end					
			
			if (in==8'b11111111) {GS, EO, out}={1'b1,1'b0,3'b111};				
		end	
		
endmodule

module testbench2;
	wire GS, EO;
	wire [2:0] out;
	reg EN;
	reg [0:7] in;							  
	
	priority_encoder enc(EN, in, out, GS, EO);
	
	initial
		begin
			EN=1;
			in=8'b00000011;
			#5ns EN=0;
			#5ns in=8'b01101111;
			#5ns in=8'b11111111; 
			#5ns;
		end		 
endmodule
	