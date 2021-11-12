En esta carpeta se encuentra en "/EJ1" el proyecto en Aldec para una simulación previa y ver que toda la lógica funcione. En "/Bustelo_Radiant" se encuentra el proyecto funcional para la FPGA en Radiant.

Para simplificación del programa se configuró una entrada de clock (CLK) externo que bien se puede reemplazar por el clock interno de la FPGA, y a su vez se le agregó una entrada de reset (RST) para cuando se iniciara el equipo por ejemplo.

También tenemos el Test.dwf3work, que es el template para probar la FPGA con la Digilent, están configurados los pines para fácil y rápida conexión.

Por último nos encontramos con dos ".png" para ver la similitud entre la simulación y la prueba con el Digilent. Se probo como si el auto estuviera OK, por lo que se enciende Lok, en la simulación se puede probar con NO OK y funciona, es simplemente una prueba lo de la Digilent. 