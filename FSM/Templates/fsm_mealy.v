//Implementacion de una maquina de estados de Mealy en Verilog
module fsm_mealy (clk, resetn, w, y, z);
    input clk, resetn, w;
    output reg z;
    output [2:1] y;

    reg [2:1] y, Y;

    // Asignacion de estados
    parameter [2:1] A = 2'b00;
    parameter [2:1] B = 2'b01;

    // Logica de proximo estado y salida (combinacional)
    always @(w, y)
        case (y)
            A: if (w)
                begin
                z = 0;
                Y = B;
                end
               else
                begin
                z = 0;
                Y = A;
                end
            B: if (w)
                begin
                z = 1;
                Y = B;
                end
               else
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
