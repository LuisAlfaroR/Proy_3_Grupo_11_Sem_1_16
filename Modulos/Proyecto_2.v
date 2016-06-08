`timescale 1ns / 1ps

module Proyecto_2(
   input clk,reset, Listo_ht,quita,
	input [8:0] Habilita,
	input wire [7:0] a,me,d,h,m,s,ht,mt,st,
	input forma,Quita_IRQ,modifica_timer, //switch
	input IRQ,									  //Señal de IRQ
	output AD,CS,RD,RW,						  //Salidas control a RTC
	inout [7:0] Dato_sal,					  //Salida y entrada de datos del RTC
	output [2:0] rgb, 						  //Salidas a VGA
	output hsync, vsync, clk_out1, Listo_es,						  //Salidas a VGA
	output wire [7:0] a_l,me_l,d_l,h_l,m_l,s_l,ht_l,mt_l,st_l,
	output alarma
	);

 
wire [3:0] seleccion_dato;
wire am,forma_hora,activa;
wire [7:0] dato3;

RTC RTC (
    .clk(clk), 
    .rst(reset), 
    .forma(forma), 
    .Quita_IRQ(Quita_IRQ), 
    .modifica_timer(modifica_timer), 
	 .Listo_ht(Listo_ht), 
	 .a(a), 
    .me(me), 
    .d(d), 
    .h(h), 
    .m(m), 
    .s(s), 
    .ht(ht), 
    .mt(mt), 
    .st(st),
    .AD(AD), 
    .CS(CS), 
    .RD(RD), 
    .RW(RW), 
    .Dato_sal(Dato_sal), 
    .seleccion_dato(seleccion_dato), 
    .am(am), 
	 .quita(quita),
	 .activa(activa),
    .forma_hora(forma_hora), 
    .dato3(dato3),
	 .clk_out1(clk_out1),
	 .Listo_es(Listo_es),
	 .a_l(a_l), 
    .me_l(me_l), 
    .d_l(d_l), 
    .h_l(h_l), 
    .m_l(m_l), 
    .s_l(s_l), 
    .ht_l(ht_l), 
    .mt_l(mt_l), 
    .st_l(st_l)
    );

Ping_Pong_v2 VGA (
    .clk(clk), 
    .reset(reset), 
    .dato(dato3), 
    .rtcin(IRQ||activa), 
    .ampm(am), 
    .sistemamilitar(~forma_hora), 
    .hsync(hsync), 
    .vsync(vsync), 
    .selector_dato(seleccion_dato), 
    .rgb(rgb),
	 .Habilita(Habilita),
	 .alarma(alarma)
    );

endmodule
