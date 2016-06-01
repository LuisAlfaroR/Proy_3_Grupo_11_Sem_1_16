`timescale 1ns / 1ps

module Resgistro_a_desde_RTC(
	//input clk, 
	input reset, write, Listo_es,
	input [7:0] Out_Port, Port_ID,
	output reg [7:0] In_Port,ano,mes,dia,horas,minutos,segundos,ht,mt,st,
	output reg [8:0] Habilita,
	input [7:0] anole,mesle,diale,horasle,minutosle,segundosle,htle,mtle,stle,
	output reg Listo_ht, Listo_esc
    );

reg [7:0] tano,tmes,tdia,thoras,tminutos,tsegundos,tht,tmt,tst,thabilita;
reg tListo_ht,tListo_esc;

always@*begin
		if(reset)begin
			In_Port=0;ano=0;mes=0;dia=0;horas=0;minutos=0;segundos=0;ht=0;mt=0;st=0;Listo_ht=0;Listo_esc=0;
			Habilita=0;
			tano=0;tmes=0;tdia=0;thoras=0;tminutos=0;tsegundos=0;tht=0;tmt=0;tst=0;tListo_ht=0;
			tListo_esc=0;thabilita=0;
			end
		else begin
			In_Port=0;ano=tano;mes=tmes;dia=tdia;horas=thoras;minutos=tminutos;segundos=tsegundos;
			ht=tht;mt=tmt;st=tst;Listo_ht=tListo_ht;Listo_esc=tListo_esc;
			if(Port_ID==8'hb && write)begin 
					if(Out_Port==8'h1)begin tListo_ht=1;end
					else begin tListo_ht=0;end end
			//Registro cuando se reciben datos del picoblaze
			if(Port_ID==8'h1 && write)begin thabilita=Out_Port; end
			if(Port_ID==8'h2 && write)begin tano=Out_Port; end
			if(Port_ID==8'h3 && write)begin tmes=Out_Port; end
			if(Port_ID==8'h4 && write)begin tdia=Out_Port; end
			if(Port_ID==8'h5 && write)begin thoras=Out_Port; end
			if(Port_ID==8'h6 && write)begin tminutos=Out_Port; end
			if(Port_ID==8'h7 && write)begin tsegundos=Out_Port; end
			if(Port_ID==8'h8 && write)begin tht=Out_Port; end
			if(Port_ID==8'h9 && write)begin tmt=Out_Port; end
			if(Port_ID==8'ha && write)begin tst=Out_Port; end
			//Registro cuando se leen los datos, enviar al picoblaze
			if(Port_ID==8'hc)begin In_Port=Listo_es; end
			if(Port_ID==8'hd)begin In_Port=anole; end
			if(Port_ID==8'he)begin In_Port=mesle; end
			if(Port_ID==8'hf)begin In_Port=diale; end
			if(Port_ID==8'h10)begin In_Port=horasle; end
			if(Port_ID==8'h11)begin In_Port=minutosle; end
			if(Port_ID==8'h12)begin In_Port=segundosle; end
			if(Port_ID==8'h13)begin In_Port=htle; end
			if(Port_ID==8'h14)begin In_Port=mtle; end
			if(Port_ID==8'h15)begin In_Port=stle; end
			tListo_esc=Listo_es;
			case(thabilita)
			6'h0:begin Habilita=9'b000000001;end
			6'h1:begin Habilita=9'b000000010;end
			6'h2:begin Habilita=9'b000000100;end
			6'h3:begin Habilita=9'b000001000;end
			6'h4:begin Habilita=9'b000010000;end
			6'h5:begin Habilita=9'b000100000;end
			6'h6:begin Habilita=9'b001000000;end
			6'h7:begin Habilita=9'b010000000;end
			6'h8:begin Habilita=9'b100000000;end
			6'h9:begin Habilita=9'b000000000;end
			endcase
			end
end

endmodule
