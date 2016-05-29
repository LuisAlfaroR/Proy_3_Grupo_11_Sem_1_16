`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:53:52 04/05/2016 
// Design Name: 
// Module Name:    deco_direcciones 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module deco_direcciones(
    input [7:0] dato,
    input selector,
    output reg [10:0] direccion = 11'h300
    );
	 
	 wire [3:0] nibble;
	 
	 assign nibble = selector ? dato[7:4] : dato[3:0];
	 
	 always@* begin
		direccion = 11'h300;
		
		case(nibble)
			4'd0: direccion = 11'h300;
			4'd1: direccion = 11'h310;
			4'd2: direccion = 11'h320;
			4'd3: direccion = 11'h330;
			4'd4: direccion = 11'h340;
			4'd5: direccion = 11'h350;
			4'd6: direccion = 11'h360;
			4'd7: direccion = 11'h370;
			4'd8: direccion = 11'h380;
			4'd9: direccion = 11'h390;
			default: direccion = 11'd0;
		endcase
		
	 end


endmodule
