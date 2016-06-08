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
    output reg [10:0] direccion = 11'h420
    );
	 
	 wire [3:0] nibble;
	 
	 assign nibble = selector ? dato[7:4] : dato[3:0];
	 
	 always@* begin
		direccion = 11'h420;
		
		case(nibble)
			4'd0: direccion = 11'h420;
			4'd1: direccion = 11'h450;
			4'd2: direccion = 11'h480;
			4'd3: direccion = 11'h4b0;
			4'd4: direccion = 11'h4e0;
			4'd5: direccion = 11'h510;
			4'd6: direccion = 11'h540;
			4'd7: direccion = 11'h570;
			4'd8: direccion = 11'h5a0;
			4'd9: direccion = 11'h5d0;
			default: direccion = 11'd0;
		endcase
		
	 end


endmodule
