`timescale 1ns / 1ps

module TestBench_Proyecto3_1;

	// Inputs
	reg clk;
	reg reset;
	reg aumenta;
	reg disminuye;
	reg siguiente;
	reg anterior;
	reg forma;
	reg Quita_IRQ;
	reg modifica_timer;
	reg IRQ;

	// Outputs
	wire AD;
	wire CS;
	wire RD;
	wire RW;
	wire [2:0] rgb;
	wire hsync;
	wire vsync;
	wire clk_out1;

	// Bidirs
	wire [7:0] Dato_sal;

	// Instantiate the Unit Under Test (UUT)
	Proyecto_3 uut (
		.clk(clk), 
		.reset(reset), 
		.aumenta(aumenta), 
		.disminuye(disminuye), 
		.siguiente(siguiente), 
		.anterior(anterior), 
		.forma(forma), 
		.Quita_IRQ(Quita_IRQ), 
		.modifica_timer(modifica_timer), 
		.IRQ(IRQ), 
		.AD(AD), 
		.CS(CS), 
		.RD(RD), 
		.RW(RW), 
		.Dato_sal(Dato_sal), 
		.rgb(rgb), 
		.hsync(hsync), 
		.vsync(vsync), 
		.clk_out1(clk_out1)
	);

	always begin #5 clk=~clk; end
	integer i,j;
	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		aumenta = 0;
		disminuye = 0;
		siguiente = 0;
		anterior = 0;
		forma = 0;
		Quita_IRQ = 0;
		modifica_timer = 0;
		IRQ = 0;

		// Wait 100 ns for global reset to finish
		#100;
      reset=0;
		#100;
		// Add stimulus here
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
		#100000;
		$finish;
	end
      
endmodule

