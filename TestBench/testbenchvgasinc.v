`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:33:43 04/05/2016
// Design Name:   vga_sync
// Module Name:   C:/Users/Armando/Desktop/Ping_Pong_v2/testbenchvgasinc.v
// Project Name:  Ping_Pong_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_sync
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbenchvgasinc;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire hsync;
	wire vsync;
	wire video_on;
	wire p_tick;
	wire [9:0] pixel_x;
	wire [9:0] pixel_y;

	// Instantiate the Unit Under Test (UUT)
	vga_sync uut (
		.clk(clk), 
		.reset(reset), 
		.hsync(hsync), 
		.vsync(vsync), 
		.video_on(video_on), 
		.p_tick(p_tick), 
		.pixel_x(pixel_x), 
		.pixel_y(pixel_y)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#4000;
        
		// Add stimulus here
	
	end
      initial forever #10 clk = ~clk;
endmodule

