`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:24:18 06/08/2016
// Design Name:   Proyecto_final
// Module Name:   C:/Users/Luis Alfaro Rojas/Documents/GitHub/Proy_3_Grupo_11_Sem_1_16/TestBench/TestBench_PicoBlaze.v
// Project Name:  Proyectofinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Proyecto_final
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench_PicoBlaze;

	// Inputs
	reg clk;
	reg reset;
	reg aumenta;
	reg disminuye;
	reg siguiente;
	reg anterior;
	reg Listo_es;
	reg formato;
	reg cambia;
	reg quita;
	reg [7:0] anole;
	reg [7:0] mesle;
	reg [7:0] diale;
	reg [7:0] horale;
	reg [7:0] minle;
	reg [7:0] segle;
	reg [7:0] htle;
	reg [7:0] mtle;
	reg [7:0] stle;

	// Outputs
	wire [7:0] ano;
	wire [7:0] mes;
	wire [7:0] dia;
	wire [7:0] hora;
	wire [7:0] min;
	wire [7:0] seg;
	wire [7:0] ht;
	wire [7:0] mt;
	wire [7:0] st;
	wire Listo_ht;
	wire modifica_timer;
	wire [8:0] Habilita;

	// Instantiate the Unit Under Test (UUT)
	Proyecto_final uut (
		.clk(clk), 
		.reset(reset), 
		.aumenta(aumenta), 
		.disminuye(disminuye), 
		.siguiente(siguiente), 
		.anterior(anterior), 
		.Listo_es(Listo_es), 
		.formato(formato), 
		.cambia(cambia), 
		.quita(quita), 
		.anole(anole), 
		.mesle(mesle), 
		.diale(diale), 
		.horale(horale), 
		.minle(minle), 
		.segle(segle), 
		.htle(htle), 
		.mtle(mtle), 
		.stle(stle), 
		.ano(ano), 
		.mes(mes), 
		.dia(dia), 
		.hora(hora), 
		.min(min), 
		.seg(seg), 
		.ht(ht), 
		.mt(mt), 
		.st(st), 
		.Listo_ht(Listo_ht), 
		.modifica_timer(modifica_timer), 
		.Habilita(Habilita)
	);


	always begin #5 clk=~clk;end
	integer i,j;
	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		aumenta = 0;
		disminuye = 0;
		siguiente = 0;
		anterior = 0;
		Listo_es = 0;
		formato = 0;
		cambia = 0;
		quita = 0;
		anole = 8'h21;
		mesle = 8'h21;
		diale = 8'h21;
		horale = 8'h21;
		minle = 8'h21;
		segle = 8'h21;
		htle = 8'h21;
		mtle = 8'h21;
		stle = 8'h21;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		#100;
		
      for(j=0;j<9;j=j+1)
			begin
			for(i=0;i<8;i=i+1)
			begin
				#1000;
				aumenta=1;
				#1000;
				aumenta=0;
			end
			#1000;
			siguiente=1;
			#1000;
			siguiente=0;
			#1000;
			end
			#10000;
			Listo_es=1;
			#100;
			Listo_es=0;
			#100000;
			cambia=1;
			#1000;
			cambia=0;
			#100;
			for(j=0;j<9;j=j+1)
			begin
			for(i=0;i<8;i=i+1)
			begin
				#1000;
				aumenta=1;
				#1000;
				aumenta=0;
			end
			#1000;
			siguiente=1;
			#1000;
			siguiente=0;
			#1000;
			end
			anole = 8'h12;
			mesle = 8'h12;
			diale = 8'h12;
			horale = 8'h12;
			minle = 8'h12;
			segle = 8'h12;
			htle = 8'h12;
			mtle = 8'h12;
			stle = 8'h12;
			#1000;
			Listo_es=1;
			#100;
			Listo_es=0;
			#100000;
			$finish;
	end
      
endmodule

