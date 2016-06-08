`timescale 1ns / 1ps

module TestBench_Escritura;

	// Inputs
	reg clk;
	reg EN;
	reg up;
	reg rst;
	reg down;
	reg [7:0] s;
	reg [7:0] m;
	reg [7:0] h;
	reg [7:0] d;
	reg [7:0] me;
	reg [7:0] a;

	// Outputs
	wire AD;
	wire CS;
	wire RD;
	wire WR;
	wire [7:0] Dato;

	// Instantiate the Unit Under Test (UUT)
	Escritura_de_parametros uut (
		.clk(clk), 
		.EN(EN), 
		.up(up), 
		.rst(rst), 
		.down(down),
		.s(s), 
		.m(m), 
		.h(h), 
		.d(d), 
		.me(me), 
		.a(a), 
		.AD(AD), 
		.CS(CS), 
		.RD(RD), 
		.WR(WR), 
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
		s = 8'b00010010;
		m = 8'b00100011;
		h = 8'b00010000;
		d = 8'b00010101;
		me = 8'b00010010;
		a = 8'b00010110;
		#100;
		rst=0;
		#2400;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

