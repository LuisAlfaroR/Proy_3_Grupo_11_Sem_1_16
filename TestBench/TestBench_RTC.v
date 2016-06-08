`timescale 1ns / 1ps

module TestBench_RTC;


	// Inputs
	reg clk;
	reg down_num;
	reg up_num;
	reg up_par;
	reg down_par;
	reg rst;
	reg forma;
	reg Quita_IRQ;
	reg modifica_timer;
	reg [3:0] seleccion_dato;

	// Outputs
	wire AD;
	wire CS;
	wire RD;
	wire RW;
	wire am;
	wire forma_hora;
	wire [7:0] dato3;

	// Bidirs
	wire [7:0] Dato_sal;

	// Instantiate the Unit Under Test (UUT)
	RTC uut (
		.clk(clk), 
		.down_num(down_num), 
		.up_num(up_num), 
		.up_par(up_par), 
		.down_par(down_par), 
		.rst(rst), 
		.forma(forma), 
		.Quita_IRQ(Quita_IRQ), 
		.modifica_timer(modifica_timer), 
		.AD(AD), 
		.CS(CS), 
		.RD(RD), 
		.RW(RW), 
		.Dato_sal(Dato_sal), 
		.seleccion_dato(seleccion_dato), 
		.am(am), 
		.forma_hora(forma_hora), 
		.dato3(dato3)
	);


	always begin #5 clk=~clk;end
	integer i,j;
	initial begin
		// Initialize Inputs
		clk = 1;
		down_num = 0;
		up_num = 0;
		up_par = 0;
		down_par = 0;
		rst = 0;
		forma = 0;
		Quita_IRQ = 0;
		modifica_timer = 0;
		seleccion_dato = 0;
		#1000;
		clk = 1;
		down_num = 0;
		up_num = 0;
		up_par = 0;
		down_par = 0;
		rst = 1;
		forma = 0;
		Quita_IRQ = 0;
		modifica_timer = 0;
		seleccion_dato = 0;
		// Wait 100 ns for global reset to finish
		#1000;
		rst=0;
		#1000;
		rst=1;
		#1000;
		rst=0;
		#1000;
		for(j=0;j<8;j=j+1)
			begin
			up_par=0;
					for (i = 0; i < 8; i = i + 1) 
					begin 
					up_num=1;#1000; 
					end
			up_num=0;
			#1000;
			up_par=1;
			#1000;
		end
		up_par=0;
		#1000;
		up_par=1;
		#1000;
		up_par=0;
		#100000;
		//Modificacion del timer
		modifica_timer = 1;
		#1000;
		for(j=0;j<2;j=j+1)
			begin
			up_par=0;
					for (i = 0; i < 3; i = i + 1) 
					begin 
					up_num=1;#1000; 
					end
			up_num=0;
			#1000;
			up_par=1;
			#1000;
		end
		up_par=1;
		#1000;
		up_par=0;
		#40000;
		modifica_timer = 0;
		#30000;
		$finish;

	end
      
endmodule

