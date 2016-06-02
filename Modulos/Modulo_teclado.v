`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:38:04 06/02/2016 
// Design Name: 
// Module Name:    Modulo_teclado 
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
module Modulo_teclado(
	input clk,reset,ps2d,ps2c,
	output Aumenta,Disminuye,Siguiente,Anterior,Reset,Formato,QuitarAlarma,CambiarHora
    );

wire [7:0] letra;
wire teclaliberada,rx_done_tick;

DecoTeclado Deco (
    .clk(clk), 
    .TecladoReady(rx_done_tick), 
    .TeclaLiberada(teclaliberada), 
    .Letra(letra), 
    .Aumenta(Aumenta), 
    .Disminuye(Disminuye), 
    .Siguiente(Siguiente), 
    .Anterior(Anterior), 
    .Reset(Reset), 
    .Formato(Formato), 
    .QuitarAlarma(QuitarAlarma), 
    .CambiarHora(CambiarHora)
    );
	 
FiltroFO Filtro (
    .clk(clk), 
    .reset(reset), 
    .codigo_tecla(letra), 
    .ready(rx_done_tick), 
    .tecla_liberada(teclaliberada)
    );
	
Teclado Receptor (
    .clk(clk), 
    .reset(reset), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .rx_en(1'b1), 
    .rx_done_tick(rx_done_tick), 
    .dout(letra)
    );

endmodule
