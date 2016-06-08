`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:43:46 03/21/2016
// Design Name:   Ping_Pong_v2
// Module Name:   C:/Users/Administrador/Dropbox/Tutoria Digitales/IS 2016/Segundo Proyecto/Ping_Pong_v2/Test_VGA.v
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

module Test_VGA;

	// Inputs
	reg clk;
	reg reset;
	reg [1:0] btn;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	Ping_Pong_v2 uut (
		.clk(clk), 
		.reset(reset), 
		.btn(btn), 
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
		btn = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		btn = 0;
		#10000000;
		reset = 0;
		btn = 2'b01;
		#10000000;
		
        
		// Add stimulus here

	end
      
endmodule

