`timescale 1ns / 1ps

module Proyecto_3(
	input clk,reset,
	input ps2d,ps2c,							  //Entradas del teclado
	input IRQ,									  //Señal de IRQ
	output AD,CS,RD,RW,						  //Salidas control a RTC
	inout [7:0] Dato_sal,					  //Salida y entrada de datos del RTC
	output [2:0] rgb, 						  //Salidas a VGA
	output hsync, vsync, clk_out1
    );

wire Listo_es,Listo_ht,modifica,aumenta,disminuye,siguiente,anterior,forma,Quita_IRQ,modifica_timer,Rst;
wire [7:0] anole,mesle,diale,horale,minle,segle,htle,mtle,stle;
wire [7:0] ano,mes,dia,hora,min,seg,ht,mt,st;
wire [8:0] Habilita;

Modulo_teclado Entrada_Teclado (
    .clk(clk), 
    .reset(reset), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .Aumenta(aumenta), 
    .Disminuye(disminuye), 
    .Siguiente(siguiente), 
    .Anterior(anterior), 
    .Reset(Rst), 
    .Formato(forma), 
    .QuitarAlarma(Quitar_IRQ), 
    .CambiarHora(modifica_timer)
    );

Proyecto_final Inclusion_picoblaze (
    .clk(clk), 
    .reset(Rst), 
    .aumenta(aumenta), 
    .disminuye(disminuye), 
    .siguiente(siguiente), 
    .anterior(anterior), 
    .Listo_es(Listo_es), 
	 .formato(forma), 
	 .cambia(modifica_timer), 
	 .quita(Quita_IRQ),
    .anole(anole), 
    .mesle(mesle), 
    .diale(diale), 
    .horale(horale), 
    .minle(minle), 
    .segle(segle), 
    .htle(htle), 
    .mtle(mtle), 
    .stle(stle), 
    .ano(ano), 
    .mes(mes), 
    .dia(dia), 
    .hora(hora), 
    .min(min), 
    .seg(seg), 
    .ht(ht), 
    .mt(mt), 
    .st(st), 
    .Listo_ht(Listo_ht), 
    .Habilita(Habilita), 
	 .modifica_timer(modifica)
    );
	 
Proyecto_2 Programacion_anterior (
    .clk(clk), 
    .reset(Rst),
	 .Listo_ht(Listo_ht),
    .Habilita(Habilita),
	 .Listo_es(Listo_es),
    .a(ano), 
    .me(mes), 
    .d(dia), 
    .h(hora), 
    .m(min), 
    .s(seg), 
    .ht(ht), 
    .mt(mt), 
    .st(st), 
    .forma(forma), 
    .Quita_IRQ(Quita_IRQ), 
    .modifica_timer(modifica), 
    .IRQ(IRQ), 
    .AD(AD), 
    .CS(CS), 
    .RD(RD), 
    .RW(RW), 
    .Dato_sal(Dato_sal), 
    .rgb(rgb), 
    .hsync(hsync), 
    .vsync(vsync), 
    .clk_out1(clk_out1), 
    .a_l(anole), 
    .me_l(mesle), 
    .d_l(diale), 
    .h_l(horale), 
    .m_l(minle), 
    .s_l(segle), 
    .ht_l(htle), 
    .mt_l(mtle), 
    .st_l(stle)
    );


endmodule
