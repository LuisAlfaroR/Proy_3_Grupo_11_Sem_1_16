`timescale 1ns / 1ps

module Memoria_Lectura(
	input [5:0] addr,
	input en,rst,
	input [7:0] Dato,
	output reg AD,CS,RD,WR,Dir_Dat,
	output reg [7:0] st,mt,ht,s,m,h,d,me,a,
	output reg [7:0] Direccion);

reg [7:0] temp;

always @* 
	begin
	if(rst)begin 
	AD=1;CS=1;RD=1;WR=1;Dir_Dat=0;
	st=0;mt=0;ht=0;s=0;m=0;h=0;d=0;me=0;a=0;
   Direccion=8'b0;end
	else begin
	if(en==1)begin
	AD=1;CS=1;RD=1;WR=1;Dir_Dat=0; 
	st=0;mt=0;ht=0;s=0;m=0;h=0;d=0;me=0;a=0;
   Direccion=8'b0;
	case (addr)
	
	//Transferir datos del area reservada a la RAM
	
	6'd1: begin AD=0; Direccion=0; end
	6'd2: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'hf0;end
	6'd3: begin Direccion=8'hf0; end
	6'd4: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; end
	6'd5: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; end
	
	//Inicio de copia de datos
				//Segundos
	6'd6: begin AD=0; Direccion=0;end
	6'd7: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h21;end
	6'd8: begin Direccion=8'h21;end
	6'd9: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd10: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; s=Dato; end
				//minutos
	6'd11: begin AD=0; Direccion=0;end
	6'd12: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h22;end
	6'd13: begin Direccion=8'h22;end
	6'd14: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd15: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; m=Dato; end	
				//horas
	6'd16: begin AD=0; Direccion=0;end
	6'd17: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h23;end
	6'd18: begin Direccion=8'h23;end
	6'd19: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd20: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; h=Dato;end		
				//dia
	6'd21: begin AD=0; Direccion=0;end
	6'd22: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h24;end
	6'd23: begin Direccion=8'h24;end
	6'd24: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd25: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; d=Dato; end	
				//mes
	6'd26: begin AD=0; Direccion=0;end
	6'd27: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h25;end
	6'd28: begin Direccion=8'h25;end
	6'd29: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd30: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; me=Dato; end
				//año
	6'd31: begin AD=0; Direccion=0;end
	6'd32: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h26;end
	6'd33: begin Direccion=8'h26;end
	6'd34: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd35: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; a=Dato; end
				//Segundos del timer
	6'd36: begin AD=0; Direccion=0;end
	6'd37: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h41;end
	6'd38: begin Direccion=8'h41;end
	6'd39: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd40: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; st=Dato; end
				//minutos del timer
	6'd41: begin AD=0; Direccion=0;end
	6'd42: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h42;end
	6'd43: begin Direccion=8'h42;end
	6'd44: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd45: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; mt=Dato; end	
				//horas del timer
	6'd46: begin AD=0; Direccion=0;end
	6'd47: begin AD=0; CS=0; RD=1; WR=0; Direccion=8'h43;end
	6'd48: begin Direccion=8'h43;end
	6'd49: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1;end
	6'd50: begin AD=1; CS=0; RD=0; WR=1; Dir_Dat=1; ht=Dato; end
										
	endcase
	end
	else begin 
	AD=1;CS=1;RD=1;WR=1;Dir_Dat=0;
	st=0;mt=0;ht=0;s=0;m=0;h=0;d=0;me=0;a=0;
   Direccion=8'b0; end
	end
	end
endmodule
