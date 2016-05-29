`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:06 03/21/2016 
// Design Name: 
// Module Name:    Ping_Pong_v2 
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
module Ping_Pong_v2
	(
		input wire clk, reset,
		//input wire [1:0] btn,
		input [7:0] dato,
		input rtcin,
		input wire ampm,
		input wire sistemamilitar,
		output wire hsync, vsync,
		output wire [3:0] selector_dato,
		output wire [2:0] rgb,
		input wire [8:0] Habilita
    );
	 
//pixel_x, pixel_y for VGA
wire [9:0] pixel_x, pixel_y;


//pixel_x, pixel_y for SVGA
//wire [10:0] pixel_x, pixel_y;

wire video_on, pixel_tick; 
reg[2:0] rgb_reg = 3'b000;
wire [2:0] rgb_next;
wire ringout;
wire selector_digito;
wire [10:0]direccion;


//reg [9:0]Div;
DivisorClock DivisorCLK (
    .clk(clk), 
    .reset(reset),
    .DivClk(DivClk)
    );
vga_sync VGA_SINCRONIZACION (
    .clk(DivClk), 
    .reset(reset), 
    .hsync(hsync), 
    .vsync(vsync), 
    //.video_on(video_on), 
    .p_tick(pixel_tick), 
    .pixel_x(pixel_x), 
    .pixel_y(pixel_y)
    );

pong_graph_st PONG (
    .clk(DivClk), 
  //.video_on(video_on),
	//.reset(reset),
	.direccion(direccion),
	.ampm(ampm),
	.sistemamilitar(sistemamilitar),
	.Habilita(Habilita),
	.selector_dato(selector_dato),
	.selector_digito(selector_digito),
	.ringout(ringout),
    .pix_x(pixel_x), 
    .pix_y(pixel_y), 
    .rgb_text(rgb_next)
    );
	 
divisorclkring iclkdivisorring (
    .clk(clk), 
    .rtcin(rtcin), 
    .ring(ringout)
    );
	 
deco_direcciones instance_name (
    .dato(dato), 
    .selector(selector_digito), 
    .direccion(direccion)
    );
	
	
always @(posedge DivClk)
	if(pixel_tick)
		rgb_reg <= rgb_next;
assign rgb = rgb_reg;

//assign rgb = rgb_next;

endmodule
