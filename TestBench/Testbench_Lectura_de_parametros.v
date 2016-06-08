`timescale 1ns / 1ps

module Testbench_Lectura_de_parametros;

	// Inputs
	reg clk;
	reg EN_lec;
	reg leer;
	reg up_lee;
	reg down_lec;
	reg rst_lee;
	reg [7:0] Dato;

	// Outputs
	wire AD;
	wire CS;
	wire RD;
	wire WR;
	wire Dir_Dat;
	wire [7:0] st_l;
	wire [7:0] mt_l;
	wire [7:0] ht_l;
	wire [7:0] s_l;
	wire [7:0] m_l;
	wire [7:0] h_l;
	wire [7:0] d_l;
	wire [7:0] me_l;
	wire [7:0] a_l;
	wire [7:0] Direccion;
	wire [5:0] addr;

	// Instantiate the Unit Under Test (UUT)
	Lectura_de_parametros uut (
		.clk(clk), 
		.EN_lec(EN_lec), 
		.leer(leer), 
		.up_lee(up_lee), 
		.down_lec(down_lec), 
		.rst_lee(rst_lee), 
		.Dato(Dato), 
		.AD(AD), 
		.CS(CS), 
		.RD(RD), 
		.WR(WR), 
		.Dir_Dat(Dir_Dat), 
		.st_l(st_l), 
		.mt_l(mt_l), 
		.ht_l(ht_l), 
		.s_l(s_l), 
		.m_l(m_l), 
		.h_l(h_l), 
		.d_l(d_l), 
		.me_l(me_l), 
		.a_l(a_l), 
		.Direccion(Direccion), 
		.addr(addr)
	);
	
	always begin #50 clk=~clk;end

	initial begin
		// Initialize Inputs
		clk = 1;
		EN_lec = 1;
		leer = 1;
		up_lee = 1;
		down_lec = 0;
		rst_lee = 1;
		Dato = 8'hz;
		// Wait 100 ns for global reset to finish
		#100;
		rst_lee=0;
		#10000;
      $finish;  
		// Add stimulus here

	end
      
endmodule

