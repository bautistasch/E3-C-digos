module Memory4x4( 

	input wire[3:0] ADDR, 

	input wire CS,
	
	input wire start,

	output reg OUT

);

reg [3:0]mem[15:0];

integer i;
integer j=0;	

initial begin
	for (i = 0; i < 16; i = i+1)
		mem[i] = i;
end

LSOSC u_HSOSC(.CLKLFPU(1), .CLKLFEN(1), .CLKLF(int_osc));

always @(posedge int_osc)
	if (CS && start)
	begin
		OUT = mem[ADDR][j];
		if(j<4)
			j=j+1;
		else
			j=0;
	end
	else
		OUT = 1'bz;
endmodule
