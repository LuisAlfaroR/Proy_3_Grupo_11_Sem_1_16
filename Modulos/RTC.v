`timescale 1ns / 1ps

module RTC(
   input clk,down_num,up_num,up_par,down_par,rst,forma,Quita_IRQ,modifica_timer,
	output AD,CS,RD,RW,
	inout [7:0] Dato_sal,
	//Comunicacion con VGA
	input [3:0] seleccion_dato,
	output am,forma_hora,clk_out1,
	output [7:0] dato3,
	output [8:0] Habilita
    );

assign forma_hora=forma;

wire rst_lee,down_es,down_lec,EN_es,EN_lec,RTC,LD_par,EN_par,rst_par,rst_Listo;
wire rst_esc,up_esc,LD_esc_1,LD_esc_2,Es_Le,Leer,up_lee,rst_cuent_IRQ,EN_IRQ,rst_recolecta;
wire clk_sel,cuenta_fin;
wire [7:0] a,me,d,h,m,s,ht,mt,st;
wire [7:0] a_l,me_l,d_l,h_l,m_l,s_l,ht_l,mt_l,st_l;
wire ADe,CSe,RDe,WRe;
wire ADl,CSl,RDl,WRl;
wire [7:0] de_mem_esc_a_RTC,de_mem_lec_a_RTC;
wire [7:0] dato_a_enviar;
wire [7:0] Dato_a_leer;
wire Dir_Dat;
wire [5:0] de_mem_lec_a_recep;
wire [7:0] a_d,me_d,d_d,h_d,m_d,s_d,ht_d,mt_d,st_d;
wire [7:0] a_vga, me_vga, d_vga, h_vga, m_vga, s_vga, ht_vga, mt_vga, st_vga;

Divisor_de_Frecuencia Clk_a_100ns (
    .clk(clk), 
    .clk_out1(clk_out1)
    );

Control_RTC Control_general_del_RTC (
    .clk(clk_out1), //Reloj de 100ns
    .rst(rst), 
    .modifica_timer(modifica_timer), //Modificar los segundos, minutos y horas del timer, nada más
    .Quita_IRQ(Quita_IRQ), //Desactiva alerta
    .Listo_ht(Listo_ht), //Recoleecion de parametros termina de agregar horas del timer
    .Listo_es(Listo_es), //Termina de enviar parametros al RTC
    .Listo_Limpia(Listo_Limpia), //Termina de limpiar la bandera de IRQ
    .cuenta_fin(cuenta_fin), //Han pasado 60 us desde que se activó IRQ
    .rst_lee(rst_lee), //Empezar a leer desde el año
    .down_es(down_es), //Siempre bajo, contador de escritura cuente hacia abajo
    .down_lec(down_lec), //Siempre bajo, contador de lectura cuente hacia abajo
    .EN_es(EN_es), //Siempre alto, permite al contador de escritura avanzar
    .EN_lec(EN_lec), //Siempre alto, permite al contador de lectura avanzar
    .RTC(RTC), //Mostrar en la VGA los parametros programados o los enviados por el RTC
    .LD_par(LD_par), //Posiciona el contador de parametros en 6 para empezar a cambiar el timer
    .EN_par(EN_par), //Permite al contador de seleccionar el parametro avanzar
    .rst_par(rst_par), //Pone en 0 los parametros seleccionados por el usuario
    .rst_Listo(rst_Listo), //Deshabilita el aviso de que se agregó las horas del timer
    .rst_esc(rst_esc), //Reinicia el contador de la memoria de escritura de parametros
    .up_esc(up_esc), //Permite al contador de memoria de escritura avanzar
    .LD_esc_1(LD_esc_1), //Indica a la memoria donde empezar a enviar al RTC
    .LD_esc_2(LD_esc_2), //Indica a la memoria donde empezar a enviar al RTC
    .Es_Le(Es_Le), //Permite enviar al RTC los datos de la escritura o recibir los datos para la lectura
    .Leer(Leer), //Permite a la memoria de lectura leer los datos del RTC
    .up_lee(up_lee), //Permite al contador de lectura avanzar
    .rst_cuent_IRQ(rst_cuent_IRQ),//Reinicia el contador que indica que se activó IRQ
    .EN_IRQ(EN_IRQ),
	 .rst_recolecta(rst_recolecta)
	 );

Escritura_de_parametros Escritura_de_parametros_en_RTC (
    .clk(clk_out1), 
    .EN(EN_es), 
    .up(up_esc), 
    .rst(rst_esc), 
    .down(down_es), 
    .Ld_1(LD_esc_1), 
    .Ld_2(LD_esc_2), 
    .forma(forma), 
    .s(s), 
    .m(m), 
    .h(h), 
    .d(d), 
    .me(me), 
    .a(a), 
    .st(st), 
    .mt(mt), 
    .ht(ht), 
    .AD(ADe), 
    .CS(CSe), 
    .RD(RDe), 
    .WR(WRe), 
    .Listo_es(Listo_es), 
    .Listo_limpia(Listo_Limpia), 
    .Dato(de_mem_esc_a_RTC)
    );

Mux_datos_a_RTC Mux_Envio_dato_lec_o_esc (
    .Es_Le(Es_Le), 
    .dato_esc(de_mem_esc_a_RTC), 
    .dato_lec(de_mem_lec_a_RTC), 
    .dato(dato_a_enviar)
    );
	 
Mux_Entrada_Salida Envio_y_recepcion_datos (
    .Dir_Dat(Dir_Dat), 
    .Direccion(dato_a_enviar), 
    .Dato_a_leer(Dato_a_leer), 
    .Dato(Dato_sal)
    );

Mux_control_a_RTC Mux_control_RTC (
    .Es_Le(Es_Le), 
    .AD_e(ADe), 
    .CS_e(CSe), 
    .RD_e(RDe), 
    .RW_e(WRe), 
    .AD_l(ADl), 
    .CS_l(CSl), 
    .RD_l(RDl), 
    .RW_l(WRl), 
    .AD(AD), 
    .CS(CS), 
    .RD(RD), 
    .RW(RW)
    );

Lectura_de_parametros Lectura_de_parametros_del_RTC (
    .clk(clk_out1), 
    .EN_lec(EN_lec), 
    .leer(Leer), 
    .up_lee(up_lee), 
    .down_lec(down_lec), 
    .rst_lee(rst_lee), 
    .Dato(Dato_a_leer), 
    .AD(ADl), 
    .CS(CSl), 
    .RD(RDl), 
    .WR(WRl), 
    .Dir_Dat(Dir_Dat), 
    .st_l(st_d), 
    .mt_l(mt_d), 
    .ht_l(ht_d), 
    .s_l(s_d), 
    .m_l(m_d), 
    .h_l(h_d), 
    .d_l(d_d), 
    .me_l(me_d), 
    .a_l(a_d), 
    .Direccion(de_mem_lec_a_RTC),
	 .addr(de_mem_lec_a_recep)
    );

Parametros_desde_RTC Recoleccion_parametros_desde_RTC (
    .addr(de_mem_lec_a_recep), 
	 .clk(clk_out1),
	 .rst(rst_recolecta),
    .st_l(st_d), 
    .mt_l(mt_d), 
    .ht_l(ht_d), 
    .s_l(s_d), 
    .m_l(m_d), 
    .h_l(h_d), 
    .d_l(d_d), 
    .me_l(me_d), 
    .a_l(a_d), 
    .st(st_l), 
    .mt(mt_l), 
    .ht(ht_l), 
    .s(s_l), 
    .m(m_l), 
    .h(h_l), 
    .d(d_l), 
    .me(me_l), 
    .a(a_l)
    );

Contador_IRQ Contador_IRQ (
    .clk(clk_out1), 
    .EN(EN_IRQ), 
    .rst(rst_cuent_IRQ), 
    .cuenta_fin(cuenta_fin)
    );

MUX_Seleccion_dato Seleccion_de_parametro_a_VGA (
    .seleccion_dato(seleccion_dato), 
    .a_vga(a_vga), 
    .me_vga(me_vga), 
    .d_vga(d_vga), 
    .h_vga(h_vga), 
    .m_vga(m_vga), 
    .s_vga(s_vga), 
    .ht_vga(ht_vga), 
    .mt_vga(mt_vga), 
    .st_vga(st_vga), 
    .dato(dato3),
	 .am(am)
    );
	 
endmodule
