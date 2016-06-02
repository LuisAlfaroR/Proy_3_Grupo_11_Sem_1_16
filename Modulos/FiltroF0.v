`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:01 08/22/2015 
// Design Name: 
// Module Name:    FiltroFO 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module FiltroFO(
   input wire clk, reset,
	input wire [7:0] codigo_tecla,
	input wire ready,
	output reg tecla_liberada = 1'b0
    );
	 
	 localparam
		 espera_codigo_ruptura = 1'b0,//codigo de ruptura es el F0
		 espera_codigo_tecla = 1'b1;
	 
	 reg estado_actual = 1'b0, estado_siguiente = 1'b0;
	 
	 always @(posedge clk, posedge reset)
		if (reset)
			estado_actual <= espera_codigo_ruptura;
		else
			estado_actual <= estado_siguiente;
			
	 always @*
		begin
			estado_siguiente = estado_actual;
			tecla_liberada=1'b0;
			
			case (estado_actual)
				espera_codigo_ruptura:
					if (ready == 1'b1 && codigo_tecla == 8'b11110000)
						estado_siguiente = espera_codigo_tecla;
				espera_codigo_tecla:
					if (ready == 1'b1 && ~(codigo_tecla == 8'b11110000))
						begin
							estado_siguiente = espera_codigo_ruptura;
							tecla_liberada = 1'b1;
						end
			endcase
		end
		
endmodule 