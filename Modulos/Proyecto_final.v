`timescale 1ns / 1ps

module Proyecto_final(
    input clk,
    input reset,
    input aumenta,disminuye,siguiente,anterior,Listo_es,formato,cambia,quita,
	 input [7:0] anole,mesle,diale,horale,minle,segle,htle,mtle,stle,
    output [7:0] ano,mes,dia,hora,min,seg,ht,mt,st,
	 output Listo_ht,
	 output [8:0] Habilita
    );

wire [11:0] address;
wire [17:0] instruction;
wire [7:0] port_id , in_port , out_port,in_port_tec,in_port_rtc;
wire write_strobe,bram_enable;//,interrupcion ;


Registro_Teclado Teclado (
    //.clk(clk), 
    .reset(reset), 
    .aumenta(aumenta), 
    .disminuye(disminuye), 
    .siguiente(siguiente), 
    .anterior(anterior), 
	 .formato(formato),
	 .cambia(cambia),
	 .quita(quita),
    .Port_ID(port_id), 
    .In_Port(in_port_tec), 
	 //.interrupcion(interrupcion)
    );	

MUX_In_Port MUX_del_In_Port (
    .Port_ID(port_id), 
    .In_Port_tec(in_port_tec), 
    .In_Port_RTC(in_port_rtc), 
    .In_Port_sal(in_port)
    );

/*kcpsm3 PicoBlaze (
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
    );*/
	 
kcpsm6 Picoblaze (
    .address(address), 
    .instruction(instruction), 
    .bram_enable(bram_enable), 
    .in_port(in_port), 
    .out_port(out_port), 
    .port_id(port_id), 
    .write_strobe(write_strobe), 
    .k_write_strobe(k_write_strobe), 
    .read_strobe(read_strobe), 
    .interrupt(1'b0), 
    .interrupt_ack(interrupt_ack), 
    .sleep(1'b0), 
    .reset(reset), 
    .clk(clk)
    );
	
programa ROM (
    .address(address), 
    .instruction(instruction), 
    .enable(bram_enable), 
    .rdl(rdl), 
    .clk(clk)
    );
	
/*prueba ROM (
    .address(address), 
    .instruction(instruction), 
    .clk(clk)
    );*/

Resgistro_a_desde_RTC Registro_a_desde_RTC (
    //.clk(clk), 
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
    .anole(anole), 
    .mesle(mesle), 
    .diale(diale), 
    .horasle(horale), 
    .minutosle(minle), 
    .segundosle(segle), 
    .htle(htle), 
    .mtle(mtle), 
    .stle(stle), 
    .Listo_ht(Listo_ht), 
    .Listo_esc(Listo_esc),
	 .Habilita(Habilita)
    );	 

endmodule
