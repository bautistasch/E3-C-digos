module shift_regiter(
	input EN,
	input RST,
	input s_in, //Serial in
	input clk,
	output reg[0:7] p_out //Parallel out	
	);
	
	always @ (posedge clk or posedge RST)
		if (RST)
			p_out=8'b00000000;
		else if (!EN)
			p_out={s_in,p_out[0:6]};
endmodule

module testbench;
	reg EN,RST,s_in,clk;
	wire [0:7] p_out;
	shift_regiter shift(EN,RST,s_in,clk,p_out);
	initial begin
		clk=0;
		RST=1;
		EN=0;
		s_in=1;
		forever #5ns clk=~clk;
	end
	initial	begin
		#4ns RST=0;
		 s_in=1;
		#10ns s_in=1;
		#10ns s_in=0;
		#10ns s_in=1;
		#10ns s_in=0;
		#10ns EN=1;
		#10ns s_in=1;
		#10ns $finish;
	end
endmodule
			