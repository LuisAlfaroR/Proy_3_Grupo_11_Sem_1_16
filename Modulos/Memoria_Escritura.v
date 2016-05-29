`timescale 1ns / 1ps

module Memoria_Escritura(
	input [6:0] addr,
	input [7:0] st,mt,ht,s,m,h,d,me,a,
	input en,rst,forma,
	output reg AD,CS,RD,WR,Listo_es,Listo_limpia,
	output reg [7:0] Dato);

always @* 
	begin
	if(rst)begin AD=1;CS=1;RD=1;WR=1;Dato=8'b0;Listo_es=0;Listo_limpia=0;end
	else begin
	if(en==1)begin
	AD=1; CS=1; RD=1; WR=1; Dato=0;Listo_es=0;Listo_limpia=0;
	case (addr)
	
	//Inicialización
	
	7'd1: begin AD=0; Dato=0; end
	7'd2: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h02;end
	7'd3: begin Dato=8'h02; end
	7'd4: begin AD=1; CS=0; RD=1; WR=0; Dato=8'b00010000;end
	7'd5: begin Dato=8'b00010000;end
	7'd6: begin AD=1; CS=0; RD=1; WR=0; Dato=8'b00000000;end
	7'd7: begin Dato=8'b00000000;end
	7'd8: begin AD=0; Dato=0;end
	7'd9: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h10;end
	7'd10: begin Dato=8'h10;end
	7'd11: begin AD=1; CS=0; RD=1; WR=0; Dato=8'hd2;end
	7'd12: begin Dato=8'hd2; end
	
	7'd13: begin AD=0; Dato=8'h0;end
	7'd14: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h00;end 
	7'd15: begin Dato=8'h00;end
	7'd16: begin AD=1; CS=0; RD=1; WR=0; 
					 if(forma==1)begin
								Dato=8'b00010000;end
					 else begin if(forma==0)begin
								Dato=8'b00000000;end
								else begin Dato=8'b00000000;end
					 end
				end
	7'd17: begin
					 if(forma==1)begin
								Dato=8'b00010000;end
					 else begin if(forma==0)begin
								Dato=8'b00000000;end
								else begin Dato=8'b00000000;end
					 end
				end
	
	//Escritura de parámetros de hora y fecha
	
	7'd18: begin AD=0; Dato=8'h0;end
	7'd19: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h21;end
	7'd20: begin Dato=8'h21;end
	7'd21: begin AD=1; CS=0; RD=1; WR=0; Dato=s;end
	7'd22: begin Dato=s;end
	7'd23: begin AD=0; Dato=0;end
	7'd24: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h22;end
	7'd25: begin Dato=8'h22;end
	7'd26: begin AD=1; CS=0; RD=1; WR=0; Dato=m;end
	7'd27: begin Dato=m;end
	7'd28: begin AD=0; Dato=0;end
	7'd29: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h23;end
	7'd30: begin Dato=8'h23;end
	7'd31: begin AD=1; CS=0; RD=1; WR=0; Dato=h;end
	7'd32: begin Dato=h;end
	7'd33: begin AD=0; Dato=0;end
	7'd34: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h24;end
	7'd35: begin Dato=8'h24;end
	7'd36: begin AD=1; CS=0; RD=1; WR=0; Dato=d;end
	7'd37: begin Dato=d;end
	7'd38: begin AD=0; Dato=0;end
	7'd39: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h25;end
	7'd40: begin Dato=8'h25;end
	7'd41: begin AD=1; CS=0; RD=1; WR=0; Dato=me;end
	7'd42: begin Dato=me;end
	7'd43: begin AD=0; Dato=0;end
	7'd44: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h26;end
	7'd45: begin Dato=8'h26;end
	7'd46: begin AD=1; CS=0; RD=1; WR=0; Dato=a;end
	7'd47: begin Dato=a;end
	
	//Guardar parametros de reloj en el area reservada
	
	7'd48: begin AD=0; Dato=0;end
	7'd49: begin AD=0; CS=0; RD=1; WR=0; Dato=8'hf1;end 
	7'd50: begin Dato=8'hf1;end 
	7'd51: begin AD=1; CS=0; RD=1; WR=0; Dato=8'hf1;end 
	7'd52: begin Dato=8'hf1;end 
	
	//Limpia el bit Time Set Lock
	
	7'd53: begin AD=0; Dato=0;end
	7'd54: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h00;end 
	7'd55: begin Dato=8'h00;end 
	7'd56: begin AD=1; CS=0; RD=1; WR=0;
					if(forma==1)begin Dato=8'b00010000;end
					else begin Dato=8'b00000000;end
			 end	
	7'd57: begin 
					if(forma==1)begin Dato=8'b00010000;end
					else begin Dato=8'b00000000;end
			end 
	//Escritura de parametros del timer
	
	7'd58: begin AD=0; Dato=8'h0;end
	7'd59: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h41;end
	7'd60: begin Dato=8'h41;end
	7'd61: begin AD=1; CS=0; RD=1; WR=0; Dato=st;end
	7'd62: begin Dato=st;end
	7'd63: begin AD=0; Dato=8'h0;end
	7'd64: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h42;end
	7'd65: begin Dato=8'h42;end
	7'd66: begin AD=1; CS=0; RD=1; WR=0; Dato=mt;end
	7'd67: begin Dato=mt;end
	7'd68: begin AD=0; Dato=8'h0;end
	7'd69: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h43;end
	7'd70: begin Dato=8'h43;end
	7'd71: begin AD=1; CS=0; RD=1; WR=0; Dato=ht;end
	7'd72: begin Dato=ht;end
	
	//Guardar parametros del timer en el area reservada
	
	7'd73: begin AD=0; Dato=0;end
	7'd74: begin AD=0; CS=0; RD=1; WR=0; Dato=8'hf2;end 
	7'd75: begin Dato=8'hf2;end 
	7'd76: begin AD=1; CS=0; RD=1; WR=0; Dato=8'hf2;end 
	7'd77: begin Dato=8'hf2;end 
	
	//Seleccion de formato de hora, limpieza de banderas y puesta en marcha del RTC
	
													//Pone bit 2 de h01 en 1 para activar alarma del timer
	7'd78: begin AD=0; Dato=0;end			
	7'd79: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h01;end 
	7'd80: begin Dato=8'h01;end 
	7'd81: begin AD=1; CS=0; RD=1; WR=0; Dato=8'b00000100;end 
	7'd82: begin Dato=8'b00000100;end 
													//Cambios en la direccion h00
	7'd83: begin AD=0; Dato=8'h0;end
	7'd84: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h00;end 
	7'd85: begin Dato=8'h00;end
	7'd86: begin AD=1; CS=0; RD=1; WR=0; 
					 if(((st!=8'h59)|(mt!=8'h59)||(ht!=8'h23))&&(forma==1))begin
								Dato=8'b00111000;end
					 else begin if(((st==8'h59)&&(mt==8'h59)&&(ht==8'h23))&&(forma==1))begin
								Dato=8'b00110000;end
					 else begin if(((st!=8'h59)||(mt!=8'h59)||(ht!=8'h23))&&(forma==0))begin
								Dato=8'b00101000;end
					 else begin if(((st==8'h59)&&(mt==8'h59)&&(ht==8'h23))&&(forma==0))begin
								Dato=8'b00100000;end
								else begin Dato=8'b00111000;end
					 end
					 end
					 end
				end
	7'd87: begin 
					if(((st!=8'h59)|(mt!=8'h59)||(ht!=8'h23))&&(forma==1))begin
								Dato=8'b00111000;end
					 else begin if(((st==8'h59)&&(mt==8'h59)&&(ht==8'h23))&&(forma==1))begin
								Dato=8'b00110000;end
					 else begin if(((st!=8'h59)||(mt!=8'h59)||(ht!=8'h23))&&(forma==0))begin
								Dato=8'b00101000;end
					 else begin if(((st==8'h59)&&(mt==8'h59)&&(ht==8'h23))&&(forma==0))begin
								Dato=8'b00100000;end
					 end
					 end
					 end
				end
												//Limpieza de bandera
	7'd88: begin AD=0; Dato=0;end			
	7'd89: begin AD=0; CS=0; RD=1; WR=0; Dato=8'h01;end 
	7'd90: begin Dato=8'h01;end 
	7'd91: begin AD=1; CS=0; RD=1; WR=0; Dato=8'b00000100;end 
	7'd92: begin Dato=8'b00000100;end
	7'd93: begin Listo_es=1;Listo_limpia=1;end
	endcase
	end
	else begin AD=1;CS=1;RD=1;WR=1;Dato=8'b0;Listo_es=0;Listo_limpia=0; end
	end
	end
endmodule
