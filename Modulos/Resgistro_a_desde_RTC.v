`timescale 1ns / 1ps

module Resgistro_a_desde_RTC(
	input clk, 
	input reset, write, Listo_es,
	input [7:0] Out_Port, Port_ID,
	input [7:0] anole,mesle,diale,horasle,minutosle,segundosle,htle,mtle,stle,
	output reg [7:0] In_Port=8'b0,ano=8'b0,mes=8'b0,dia=8'b0,horas=8'b0,minutos=8'b0,segundos=8'b0,ht=8'b0,mt=8'b0,st=8'b0,
	output reg [8:0] Habilita=9'b0,
	output reg Listo_ht=0,modifica_timer=0
    );

//reg [7:0] tano,tmes,tdia,thoras,tminutos,tsegundos,tht,tmt,tst,thabilita;
reg [7:0] habilita=0;
//reg tListo_ht,tListo_esc;
/*always@(posedge clk)begin
		if(reset)begin
			In_Port=0;ano=0;mes=0;dia=0;horas=0;minutos=0;segundos=0;ht=0;mt=0;st=0;Listo_ht=0;
			Habilita=0;modifica_timer=0;
			//tano=0;tmes=0;tdia=0;thoras=0;tminutos=0;tsegundos=0;tht=0;tmt=0;tst=0;tListo_ht=0;
			//tListo_esc=0;thabilita=0;
			end
end*/

always@*begin
			//In_Port=0;ano=tano;mes=tmes;dia=tdia;horas=thoras;minutos=tminutos;segundos=tsegundos;
			//ht=tht;mt=tmt;st=tst;Listo_ht=tListo_ht;Listo_esc=tListo_esc;
			/*case(Port_ID)
			8'hb:begin 
						if(write && Out_Port==8'h1)begin 
							Listo_ht=1;end
							else begin Listo_ht=0;end 
					end
			//Registro cuando se reciben datos del picoblaze
			8'h1:begin if(write)begin habilita=Out_Port; end end
			8'h2:begin if(write)begin ano=Out_Port; end end
			8'h3:begin if(write)begin mes=Out_Port; end end
			8'h4:begin if(write)begin dia=Out_Port; end end
			8'h5:begin if(write)begin horas=Out_Port; end end
			8'h6:begin if(write)begin minutos=Out_Port; end end
			8'h7:begin if(write)begin segundos=Out_Port; end end
			8'h8:begin if(write)begin ht=Out_Port; end end
			8'h9:begin if(write)begin mt=Out_Port; end end
			8'ha:begin if(write)begin st=Out_Port; end end
			//Registro cuando se leen los datos, enviar al picoblaze
			8'hc:begin In_Port=Listo_es; end
			8'hd:begin In_Port=anole; end
			8'he:begin In_Port=mesle; end
			8'hf:begin In_Port=diale; end
			8'h10:begin In_Port=horasle; end
			8'h11:begin In_Port=minutosle; end
			8'h12:begin In_Port=segundosle; end
			8'h13:begin In_Port=htle; end
			8'h14:begin In_Port=mtle; end
			8'h15:begin In_Port=stle; end
			8'h16:begin 
							if(write && Out_Port==8'h9)begin 
								modifica_timer=1;end
								else begin modifica_timer=0;end 	
					end
				endcase*/
			if(Port_ID==8'hb && write)begin 
					if(Out_Port==8'h1)begin Listo_ht=1;end
					else begin Listo_ht=0;end end
			//Registro cuando se reciben datos del picoblaze
			if(Port_ID==8'h1 && write)begin habilita=Out_Port; end
			if(Port_ID==8'h2 && write)begin ano=Out_Port; end
			if(Port_ID==8'h3 && write)begin mes=Out_Port; end
			if(Port_ID==8'h4 && write)begin dia=Out_Port; end
			if(Port_ID==8'h5 && write)begin horas=Out_Port; end
			if(Port_ID==8'h6 && write)begin minutos=Out_Port; end
			if(Port_ID==8'h7 && write)begin segundos=Out_Port; end
			if(Port_ID==8'h8 && write)begin ht=Out_Port; end
			if(Port_ID==8'h9 && write)begin mt=Out_Port; end
			if(Port_ID==8'ha && write)begin st=Out_Port; end
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
			if(Port_ID==8'h16 && write)begin 
				if(Out_Port==8'h9)begin modifica_timer=1;end
					else begin modifica_timer=0;end end
			case(habilita)
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

endmodule
