													 //Testbench for break control state machines
module bc_testbench;
  reg clk;                     // Clock 
  reg rstn;                    // Reset (async)
  reg sensor;                  // Sensor 
  wire [2:0] state;            // Estado FSM (para debug)
  wire out;                    // Salida
 
  // Instancia de la FSM
  // Las lineas comentadas contienen las otras implementaciones
  //fsm_mealy  fsm0 
  //fsm_moore2  fsm0
  fsm_mealy  fsm0 
                  ( .clk (clk),
                 .resetn (rstn),
                 .a (sensor),
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
    sensor = 0;
 
    //Pulso de reset
    #12  rstn <= 1;

    //Sensor
       	 sensor = 1;
    #10  sensor = 1;
    #10   sensor = 0;
    #10   sensor = 0;
    #10   sensor = 1;
    #10   sensor = 0;
	
	#10   sensor = 0;
	$display (state);
	
    #10   sensor = 1;
    #10   sensor = 0;
	
    #10   sensor = 1;
    #10   sensor = 1;
    #10   sensor = 0;
    #10   sensor = 0;
    #10   sensor = 1;
    #10   sensor = 0;

    #10 $finish;
  end
endmodule
 