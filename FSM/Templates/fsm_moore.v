//Implementacion de una maquina de estados de Moore en Verilog
module fsm_moore (clk, resetn, w, y, z);
    input clk, resetn, w;   // Clock, reset, sensor inputs (async)
    output z;               // Control output
    output [2:1] y;         // State output (para debug)

    reg [2:1] y, Y;

    // Asignacion de estados
    parameter [2:1] A = 2'b00;
    parameter [2:1] B = 2'b01;
    parameter [2:1] C = 2'b10;

    // Logica de proximo estado (combinacional)
    always @(w, y)
        case (y)
            A:  if (w) Y = B;
                else Y = A;
            B:  if (w) Y = C;
                else Y = A;
            C:  if (w) Y = C;
                else Y = A;
            default: Y = 2'bxx;
        endcase

    // Transicion al proximo estado (secuencial)
    always @(negedge resetn, posedge clk)
        if (resetn == 0) y <= A;
        else y <= Y;

    // Salida (combinacional)
    assign z = (y == C);
endmodule