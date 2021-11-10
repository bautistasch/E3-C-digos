module Memory4Bits(
	input [3:0] ADDR,
	input CS,
	output reg [3:0] OUT 
	);
	
reg [3:0]mem[15:0];

integer i;

initial
begin 
	for (integer i = 0; i < 16; i = i+1)
		mem[i] = i;
end


always @(ADDR)
	if (CS)
		OUT = mem[ADDR];
	else
		OUT = 4'bzzzz;
	
endmodule 