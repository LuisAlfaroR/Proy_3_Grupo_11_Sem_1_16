`timescale 1ns / 1ps

module TestBench_Registro_a_desde_RTC;

	// Inputs
	reg clk;
	reg reset;
	reg write;
	reg Listo_es;
	reg [7:0] Out_Port;
	reg [7:0] Port_ID;
	reg [7:0] anole;
	reg [7:0] mesle;
	reg [7:0] diale;
	reg [7:0] horasle;
	reg [7:0] minutosle;
	reg [7:0] segundosle;
	reg [7:0] htle;
	reg [7:0] mtle;
	reg [7:0] stle;

	// Outputs
	wire [7:0] In_Port;
	wire [7:0] ano;
	wire [7:0] mes;
	wire [7:0] dia;
	wire [7:0] horas;
	wire [7:0] minutos;
	wire [7:0] segundos;
	wire [7:0] ht;
	wire [7:0] mt;
	wire [7:0] st;
	wire Listo_ht;
	wire Listo_esc;

	// Instantiate the Unit Under Test (UUT)
	Resgistro_a_desde_RTC uut (
		.clk(clk), 
		.reset(reset), 
		.write(write), 
		.Listo_es(Listo_es), 
		.Out_Port(Out_Port), 
		.Port_ID(Port_ID), 
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
		.anole(anole), 
		.mesle(mesle), 
		.diale(diale), 
		.horasle(horasle), 
		.minutosle(minutosle), 
		.segundosle(segundosle), 
		.htle(htle), 
		.mtle(mtle), 
		.stle(stle), 
		.Listo_ht(Listo_ht), 
		.Listo_esc(Listo_esc)
	);

	always begin #5 clk=~clk;end

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		write = 0;
		Listo_es = 0;
		Out_Port = 8'h1;
		Port_ID = 0;
		anole = 8'h13;
		mesle = 8'h2;
		diale = 8'h1;
		horasle = 8'h15;
		minutosle = 8'h29;
		segundosle = 8'h43;
		htle = 8'h23;
		mtle = 8'h40;
		stle = 8'h57;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		
		write=1;
		Port_ID=8'hb;
		#100;
		Port_ID=8'h02;
		#100;
		Port_ID=8'h03;
		#100;
		Port_ID=8'h04;
		#100;
		Port_ID=8'h05;
		#100;
		Port_ID=8'h06;
		#100;
		Port_ID=8'h07;
		#100;
		Port_ID=8'h08;
		#100;
		Port_ID=8'h09;
		#100;
		Port_ID=8'h0a;
		#100;
		write=0;
		Port_ID=8'h0c;
		#100;
		Listo_es = 1;
		#100;
		Port_ID=8'h0c;
		#100;
		Listo_es = 0;
		#100;
		Port_ID=8'h0c;
		#100;
		Port_ID=8'h0d;
		#100;
		Port_ID=8'h0e;
		#100;
		Port_ID=8'h0f;
		#100;
		Port_ID=8'h10;
		#100;
		Port_ID=8'h11;
		#100;
		Port_ID=8'h12;
		#100;
		Port_ID=8'h13;
		#100;
		Port_ID=8'h14;
		#100;
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule

