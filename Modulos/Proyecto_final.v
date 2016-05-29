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
wire [7:0] port_id , in_port , out_port ;
wire write_strobe ;
reg [7:0] in;

Registro_Teclado Teclado (
    .clk(clk), 
    .reset(reset), 
    .aumenta(aumenta), 
    .disminuye(disminuye), 
    .siguiente(siguiente), 
    .anterior(anterior), 
    .Port_ID(port_id), 
    .In_Port(in_port)
    );	

kcpsm3 PicoBlaze (
    .address(address), 
    .instruction(instruction), 
    .port_id(port_id), 
    .write_strobe(write_strobe), 
    .out_port(out_port), 
    .read_strobe(read_strobe), 
    .in_port(in_port), 
    .interrupt(interrupt), 
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
    .In_Port(In_Port), 
    .ano(ano), 
    .mes(mes), 
    .dia(dia), 
    .horas(horas), 
    .minutos(minutos), 
    .segundos(segundos), 
    .ht(ht), 
    .mt(mt), 
    .st(st), 
    .anole(8'h2), 
    .mesle(8'h2), 
    .diale(8'h2), 
    .horasle(8'h2), 
    .minutosle(8'h2), 
    .segundosle(8'h2), 
    .htle(8'h2), 
    .mtle(8'h2), 
    .stle(8'h2), 
    .Listo_ht(Listo_ht), 
    .Listo_esc(Listo_esc)
    );	 

endmodule
