//Implementacion de una maquina de estados de Moore en Verilog
//Implementacion alternativa con un solo bloque always
module fsm_moore2 (clk, resetn, w, y, z);
    input clk, resetn, w;
    output z;
    output [2:1] y;

    reg [2:1] y;

    // Asignacion de estados
    parameter [2:1] A = 2'b00;
    parameter [2:1] B = 2'b01;
    parameter [2:1] C = 2'b11;

    // Logica de proximo estado y avance de estado combinadas
    always @(negedge resetn, posedge clk)
        if (resetn == 0) y <= A;
        else
            case (y)
                A:  if (w)  y = B;
                    else    y = A;
                B:  if (w)  y = C;
                    else    y = A;
                C:  if (w)  y = C;
                    else    y = A;
                default:    y = 2'bxx;
            endcase
        assign z = (y == C);

endmodule