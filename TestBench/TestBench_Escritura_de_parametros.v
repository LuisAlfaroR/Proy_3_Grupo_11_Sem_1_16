`timescale 1ns / 1ps

module TestBench_Escritura_de_parametros;

	// Inputs
	reg clk;
	reg EN;
	reg up;
	reg rst;
	reg down;
	reg Ld_1;
	reg Ld_2;
	reg forma;
	reg [7:0] s;
	reg [7:0] m;
	reg [7:0] h;
	reg [7:0] d;
	reg [7:0] me;
	reg [7:0] a;
	reg [7:0] st;
	reg [7:0] mt;
	reg [7:0] ht;

	// Outputs
	wire AD;
	wire CS;
	wire RD;
	wire WR;
	wire Listo_es;
	wire Listo_limpia;
	wire [7:0] Dato;

	// Instantiate the Unit Under Test (UUT)
	Escritura_de_parametros uut (
		.clk(clk), 
		.EN(EN), 
		.up(up), 
		.rst(rst), 
		.down(down), 
		.Ld_1(Ld_1), 
		.Ld_2(Ld_2), 
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
		.AD(AD), 
		.CS(CS), 
		.RD(RD), 
		.WR(WR), 
		.Listo_es(Listo_es), 
		.Listo_limpia(Listo_limpia), 
		.Dato(Dato)
	);
	
	always begin #50 clk=~clk;end

	initial begin
		// Initialize Inputs
		clk = 1;
		EN = 1;
		up = 1;
		rst = 1;
		down = 0;
		Ld_1 = 0;
		Ld_2 = 0;
		forma = 0;
		s = 8'h23;
		m = 8'h10;
		h = 8'h11;
		d = 8'h18;
		me = 8'h01;
		a = 8'h16;
		st = 8'h59;
		mt = 8'h59;
		ht = 8'h21;
		#100;
		rst=0;
		#10000;
      $finish;  
		// Add stimulus here

	end
      
endmodule

