`timescale 1ns / 1ps

module Proyecto_final(
    input clk,
    input reset,
    input aumenta,disminuye,siguiente,anterior,
    output [7:0] ano,mes,dia,hora,min,seg,ht,mt,st
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
	 

endmodule
