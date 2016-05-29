`timescale 1ns / 1ps

module Lectura_de_parametros(
	 input clk,
	 input EN_lec,
	 input leer,
    input up_lee,
    input down_lec,
    input rst_lee,
	 input [7:0] Dato,
	 output AD,CS,RD,WR,Dir_Dat,
	 output [7:0] st_l,mt_l,ht_l,s_l,m_l,h_l,d_l,me_l,a_l,
	 output [7:0] Direccion,
	 output [5:0] addr
    );

Contador_lectura Contador_Lectura (
    .clk(clk), 
    .EN(EN_lec), 
    .up(up_lee), 
    .down(down_lec), 
    .rst(rst_lee), 
    .out(addr)
    );

Memoria_Lectura Memoria_Lectura (
    .addr(addr), 
    .en(leer), 
    .rst(rst_lee), 
    .Dato(Dato), 
    .AD(AD), 
    .CS(CS), 
    .RD(RD), 
    .WR(WR), 
    .Dir_Dat(Dir_Dat), 
    .st(st_l), 
    .mt(mt_l), 
    .ht(ht_l), 
    .s(s_l), 
    .m(m_l), 
    .h(h_l), 
    .d(d_l), 
    .me(me_l), 
    .a(a_l), 
    .Direccion(Direccion)
    );
	 
endmodule
