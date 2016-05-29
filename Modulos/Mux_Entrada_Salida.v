`timescale 1ns / 1ps

module Mux_Entrada_Salida(
	input Dir_Dat,
	input [7:0] Direccion,
	output [7:0] Dato_a_leer,
	inout [7:0] Dato
    );
	 
	 reg [7:0] temp,temp1;
	 assign Dato=Dir_Dat ? 8'bz : temp;
	 assign Dato_a_leer=temp1;
	 
	 always@*begin
	  temp1=Dato;
	  temp=Direccion; 
	  end

endmodule
