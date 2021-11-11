module accumulator
(	
	input wire CLK,
	input wire RST,
	input wire control,
	output reg [3:0] ACC,
	output wire Zero
);

	reg [1:0] buffer;
	integer counter = 0;

	always @(posedge CLK or negedge RST)
	begin
		if(RST == 0)
		begin
			ACC = 0;
			buffer = 2'bx;
		end
		else
		begin
			if(counter < 2)
			begin
				buffer = {control , buffer[1]};
				counter = counter + 1;
			end						  
			else if(counter == 2)
			begin			
				if(buffer == 2'b01)
					ACC = ACC + 1;
				else if(buffer == 2'b11 )
					ACC = 8;
					
				counter = 0;
			end
		end
	end
	
   assign Zero = (ACC == 0) ? 1 : 0; 
endmodule	  


module TestBench();
	reg CLK;
	reg RST;
	reg control;
	reg [3:0] ACC;
	reg Zero;	
	
	always #5ns CLK = ~CLK;
	
	accumulator U1 (	
	.CLK(CLK),
	.RST(RST),
	.control(control),
	.ACC(ACC),
	.Zero(Zero)
	);	
		
		
	initial 
	begin
	CLK = 0;
	RST = 1;	
	control = 1;
	#2ns RST = 0;
	#2ns RST = 1;
	#5ns control = 1;
	#5ns control = 0;
	#5ns control = 1;
	#5ns control = 0;
	#5ns control = 1;
	#10ns control = 1;
	#50ns $finish;
	
	end
endmodule