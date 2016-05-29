`timescale 1ns / 1ps

module Proyecto_final(
    input clk,
    input reset,
    input aumenta,disminuye,siguiente,anterior,Listo_es,
    output [7:0] ano,mes,dia,hora,min,seg,ht,mt,st,
	 output Listo_ht
    );

wire [9:0] address;
wire [17:0] instruction;
wire [7:0] port_id , in_port , out_port,in_port_tec,in_port_rtc;
wire write_strobe ;


Registro_Teclado Teclado (
    .clk(clk), 
    .reset(reset), 
    .aumenta(aumenta), 
    .disminuye(disminuye), 
    .siguiente(siguiente), 
    .anterior(anterior), 
    .Port_ID(port_id), 
    .In_Port(in_port_tec)
    );	

MUX_In_Port MUX_del_In_Port (
    .Port_ID(port_id), 
    .In_Port_tec(in_port_tec), 
    .In_Port_RTC(in_port_rtc), 
    .In_Port_sal(in_port)
    );

kcpsm3 PicoBlaze (
    .address(address), 
    .instruction(instruction), 
    .port_id(port_id), 
    .write_strobe(write_strobe), 
    .out_port(out_port), 
    .read_strobe(read_strobe), 
    .in_port(in_port), 
    .interrupt(0), 
    .interrupt_ack(interrupt_ack), 
    .reset(reset), 
    .clk(clk)
    );
	 
prueba ROM (
    .address(address), 
    .instruction(instruction), 
    .clk(clk)
    );

Resgistro_a_desde_RTC Registro_a_desde_RTC (
    .clk(clk), 
    .reset(reset), 
    .write(write_strobe), 
    .Listo_es(Listo_es), 
    .Out_Port(out_port), 
    .Port_ID(port_id), 
    .In_Port(in_port_rtc), 
    .ano(ano), 
    .mes(mes), 
    .dia(dia), 
    .horas(hora), 
    .minutos(min), 
    .segundos(seg), 
    .ht(ht), 
    .mt(mt), 
    .st(st), 
    .anole(0), 
    .mesle(0), 
    .diale(0), 
    .horasle(0), 
    .minutosle(0), 
    .segundosle(0), 
    .htle(0), 
    .mtle(0), 
    .stle(0), 
    .Listo_ht(Listo_ht), 
    .Listo_esc(Listo_esc)
    );	 

endmodule
