module FlipFlopT(CLK, RST, Q, nQ);
	
	input CLK, RST;
	output reg Q;	 
	output wire nQ; 
	assign nQ = ~Q;		
	
	always @(posedge CLK or negedge RST)
	begin
		if(RST == 0)
			Q <= 0;
		else 
			Q <= ~Q;
	end		 
	
endmodule

module counter4bits(UP_DOWN, ENA, CLK, RST, Z, Q);

	input wire UP_DOWN, ENA, CLK, RST; 
	output reg Z;
	output wire [3:0] Q;
	wire aux1;
	wire [3:0] Q_FF;
	wire [3:0] Q_UP_DOWN;				   
	
	parameter UP = 1'b1;
	
	FlipFlopT U0(.CLK(CLK), .RST(RST), .Q(Q_FF[0]), .nQ(aux1));
	FlipFlopT U1(.CLK(~Q_FF[0]), .RST(RST), .Q(Q_FF[1]), .nQ(aux1));
	FlipFlopT U2(.CLK(~Q_FF[1]), .RST(RST), .Q(Q_FF[2]), .nQ(aux1));
	FlipFlopT U3(.CLK(~Q_FF[2]), .RST(RST), .Q(Q_FF[3]), .nQ(aux1));
	
	assign Q_UP_DOWN = (UP_DOWN == UP) ? Q_FF : ~Q_FF;
	assign Q = (ENA == 0) ? 3'bz : Q_UP_DOWN;
	
endmodule

module test();
	
	reg UP_DOWN, ENA, CLK, RST, Z;   	   
	reg [3:0] Q;
	
	counter4bits U0(.UP_DOWN(UP_DOWN), .ENA(ENA), .CLK(CLK), .RST(RST), .Z(Z), .Q(Q));
	
	initial
	begin		
	UP_DOWN = 1;
	CLK = 0;
	ENA = 1;
	RST = 1;
	#2ns
	RST = 0;
	#2ns
	RST = 1;
	#300ns;	
	UP_DOWN = 0;
	#150ns;	
	#150ns RST = 0;
	#20ns RST = 1;
	#150ns
	ENA = 0;
	#20ns $finish;		  
	end
	   	always #5ns CLK = ~CLK;
endmodule