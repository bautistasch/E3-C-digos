//Testbench for break control state machines
module bc_testbench;
  reg clk;                     // Clock 
  reg rstn;                    // Reset (async)
  reg sensor;                  // Sensor 
  wire [2:1] state;            // Estado FSM (para debug)
  wire out;                    // Salida
 
  // Instancia de la FSM
  // Las lineas comentadas contienen las otras implementaciones
  //fsm_mealy  fsm0 
  //fsm_moore2  fsm0
  fsm_moore  fsm0 
                  ( .clk (clk),
                 .resetn (rstn),
                 .w (sensor),
                 .y (state),
                 .z (out));
 
  // Clock
  // periodo = 10 
  always #5 clk = ~clk;
 
 
  initial begin
    // Debug info a consola
    // $monitor("At time %t, clk = %h, sensor = %h, out = %h",
    //          $time, clk, sensor, out);

    // dumpfile para gtkwave
    //$dumpfile("dump.vcd");
    //$dumpvars(0, clk, rstn, sensor, out, state);

    //Estados iniciales
    clk <= 0;
    rstn <= 0;
    sensor <= 0;
 
    //Pulso de reset
    #12  rstn <= 1;

    //Sensor
    //Activo menos de 1 ciclo
    #15   sensor <= 1;
    #6   sensor <= 0;

    //Activo menos de 2 ciclos
    #15   sensor <= 1;
    #13   sensor <= 0;

    //Activo mas de 2 ciclos
    #20   sensor <= 1;
    #23   sensor <= 0;
 

    #20 $finish;
  end
endmodule
 