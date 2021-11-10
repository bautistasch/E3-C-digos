    //Implementacion de una maquina de estados de Mealy en Verilog
module fsm_mealy (clk, resetn, a, y, z);
    input clk, resetn, a;
    output reg z;
    output [2:0] y;

    reg [2:0] y, Y;

    // Asignacion de estados
    parameter [2:0] A = 0;
    parameter [2:0] B = 1;
    parameter [2:0] C = 2;
    parameter [2:0] D = 3;
    parameter [2:0] E = 4;
    parameter [2:0] F = 5;

    // Logica de proximo estado y salida (combinacional)
    always @(a, y)
        case (y)
            A: if (a)
                begin
                z = 0;
                Y = B;
                end
               else
                begin
                z = 0;
                Y = A;
                end
            B: if (a)
                begin
                z = 0;
                Y = C;
                end
               else
                begin
                z = 0;
                Y = A;
                end
			C: if (a)
                begin
                z = 0;
                Y = C;
                end
               else
                begin
                z = 0;
                Y = D;
                end
			D: if (a)
                begin
                z = 0;
                Y = B;
                end
               else
                begin
                z = 0;
                Y = E;
                end
			E: if (a)
                begin
                z = 0;
                Y = F;
                end
               else
                begin
                z = 0;
                Y = A;
                end
			F: if (a)
                begin
                z = 0;
                Y = C;
                end
               else
                begin
                z = 1;
                Y = F;
                end
			
			default:
				begin
				z = 0;
				Y = A;
				end
        endcase

    // Transicion de estado
    always @(negedge resetn, posedge clk)
        if (resetn == 0) y <= A;
        else y <= Y;



endmodule
