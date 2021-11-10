module ram1 (
	input wire clk,
	input wire write_en,
	input wire [3:0] addr,
	input wire [3:0] data_in,
	output reg [3:0] data_out,
);

	// Defino la memoria
	reg [3:0] mem [15:0];

	/// Inicializo la memoria
	integer i;
	initial begin
	for (i=0;i<=15;i=i+1)
		mem[i] = 0;
	end
	
	// Uso el clk para sincronizar bien la escritura, y asegurarme de almacenar
	// los valores correctos
	always @(posedge clk)
	begin
		if (write_en) begin
			mem[addr] <= data_in;
		end
		data_out <= mem[addr];
	end
endmodule