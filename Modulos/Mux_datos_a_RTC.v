`timescale 1ns / 1ps

module Mux_datos_a_RTC(
	input Es_Le,
	input [7:0] dato_esc, //Datos enviados al escribir
	input [7:0] dato_lec, //Datos de direccion a leer
	output reg[7:0] dato //Dato enviado al RTC
    );

always@* begin
	if(Es_Le==1)begin
	 dato=dato_lec;
	 end
	else begin
	 dato=dato_esc;
	 end
end

endmodule
