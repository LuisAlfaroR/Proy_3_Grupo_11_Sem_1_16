`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:26:52 03/21/2016
// Design Name:   Ping_Pong_v2
// Module Name:   C:/Users/Administrador/Dropbox/Tutoria Digitales/IS 2016/Segundo Proyecto/Ping_Pong_v2/Test_VGAtoSVGA.v
// Project Name:  Ping_Pong_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ping_Pong_v2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_VGAtoSVGA;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	Ping_Pong_v2 uut (
		.clk(clk), 
		.reset(reset), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb)
	);
	initial forever
	#5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		#10000;
		$stop;
        
		// Add stimulus here

	end
      
endmodule

