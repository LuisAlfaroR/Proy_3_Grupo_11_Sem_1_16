`timescale 1ns / 1ps

module Resgistro_a_desde_RTC(
	input clk, reset, write, Listo_es,
	input [7:0] Out_Port, Port_ID,
	output reg [7:0] In_Port,ano,mes,dia,horas,minutos,segundos,ht,mt,st,
	input [7:0] anole,mesle,diale,horasle,minutosle,segundosle,htle,mtle,stle,
	output reg Listo_ht, Listo_esc
    );

reg [7:0] tIn_Port,tano,tmes,tdia,thoras,tminutos,tsegundos,tht,tmt,tst;
reg tListo_ht,Listo_esc;

CONSTANT parsel, 01

CONSTANT an, 02
CONSTANT me, 03
CONSTANT di, 04
CONSTANT h, 05
CONSTANT m, 06
CONSTANT s, 07
CONSTANT hti, 08
CONSTANT mti, 09
CONSTANT sti, 0A

CONSTANT escriba, 0B
CONSTANT listoes, 0C

CONSTANT anole, 0D
CONSTANT mesle, 0E
CONSTANT diale, 0F
CONSTANT horale, 10
CONSTANT minutole, 11
CONSTANT segundole, 12
CONSTANT htile, 13
CONSTANT mtile, 14
CONSTANT stile, 15


always@(posedge clk)begin
		if(reset)begin
			In_Port=0;ano=0;mes=0;dia=0;horas=0;minutos=0;segundos=0;ht=0;mt=0;st=0;Listo_ht=0;Listo_esc=0;
			tIn_Port=0;tano=0;tmes=0;tdia=0;thoras=0;tminutos=0;tsegundos=0;tht=0;tmt=0;tst=0;tListo_ht=0;
			tListo_esc=0;
			end
		else begin
			In_Port=tIn_Port;ano=tano;mes=tmes;dia=tdia;horas=thoras;minutos=tminutos;segundos=tsegundos;
			ht=tht;mt=tmt;st=tst;Listo_ht=tListo_ht;
			if(Port_ID==8'h1 && write)begin 
					if(Out_Port==8'h9)begin tListo_ht=1;end
					else begin tListo_ht=0;end end
			if(Port_ID==8'h2 && write)begin tano=Out_Port; end
			if(Port_ID==8'h3 && write)begin tmes=Out_Port; end
			if(Port_ID==8'h4 && write)begin tdia=Out_Port; end
			if(Port_ID==8'h5 && write)begin thoras=Out_Port; end
			if(Port_ID==8'h6 && write)begin tminutos=Out_Port; end
			if(Port_ID==8'h7 && write)begin tsegundos=Out_Port; end
			if(Port_ID==8'h8 && write)begin tht=Out_Port; end
			if(Port_ID==8'h9 && write)begin tmt=Out_Port; end
			if(Port_ID==8'ha && write)begin tst=Out_Port; end
			//Registro cuando se leen los datos
			if(Port_ID==8'hc)begin tIn_Port=Listo_es; end
			if(Port_ID==8'hd)begin tIn_Port=Out_Port; end
			if(Port_ID==8'he)begin tIn_Port=Out_Port; end
			if(Port_ID==8'hf)begin tIn_Port=Out_Port; end
			if(Port_ID==8'h10)begin tIn_Port=Out_Port; end
			if(Port_ID==8'h11)begin tIn_Port=Out_Port; end
			if(Port_ID==8'h12)begin tIn_Port=Out_Port; end
			if(Port_ID==8'h13)begin tIn_Port=Out_Port; end
			if(Port_ID==8'h14)begin tIn_Port=Out_Port; end
			if(Port_ID==8'd15)begin tIn_Port=Out_Port; end			

endmodule
