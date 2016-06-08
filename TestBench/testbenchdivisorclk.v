`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:37:11 04/05/2016
// Design Name:   DivisorClock
// Module Name:   C:/Users/Armando/Desktop/Ping_Pong_v2/testbenchdivisorclk.v
// Project Name:  Ping_Pong_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DivisorClock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbenchdivisorclk;

	// Inputs
	reg clk = 1'b0;
	reg reset = 1'b0;
	reg [9:0] Div = 10'd0;

	// Outputs
	wire DivClk;

	// Instantiate the Unit Under Test (UUT)
	DivisorClock uut (
		.clk(clk), 
		.reset(reset), 
		.Div(Div), 
		.DivClk(DivClk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		Div = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      initial forever #10 clk = ~clk;
endmodule

