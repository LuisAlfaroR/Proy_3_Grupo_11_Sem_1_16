`timescale 1ns / 1ps

module Escritura_de_parametros(
	input clk,EN,up,rst,down,Ld_1,Ld_2,forma,
	input [7:0] s,m,h,d,me,a,st,mt,ht,
	output AD,CS,RD,WR,Listo_es,Listo_limpia,
	output [7:0] Dato
    );

wire [6:0] direccion;


Contador_0_15 Contador (
    .clk(clk), 
    .EN(EN), 
    .up(up), 
	 .Ld_1(Ld_1),
	 .Ld_2(Ld_2),
    .down(down), 
    .rst(rst), 
    .out(direccion)
    );
	 

Memoria_Escritura Instrucciones_escritura (
    .addr(direccion), 
    .st(st), 
    .mt(mt), 
    .ht(ht), 
    .s(s), 
    .m(m), 
    .h(h), 
    .d(d), 
    .me(me), 
    .a(a), 
    .en(EN), 
    .rst(rst), 
    .forma(forma), 
    .AD(AD), 
    .CS(CS), 
    .RD(RD), 
    .WR(WR), 
    .Listo_es(Listo_es), 
    .Listo_limpia(Listo_limpia), 
    .Dato(Dato)
    );

endmodule
