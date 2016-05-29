`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:03:23 03/20/2016 
// Design Name: 
// Module Name:    vga_sync 
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
module vga_sync
	(
	 input wire clk, reset,
	 output wire hsync, vsync, /*video_on,*/p_tick,
	 
	 //pixel_x, pixel_y for VGA
	 output wire [9:0] pixel_x, pixel_y
	 
	 //pixel_x, pixel_y for SVGA
	 //output wire [10:0] pixel_x, pixel_y
    );
	 
//Declaracion de constantes

//VGA 640X480 @60Hz parametros de sincronizacion
localparam HD = 640; //(Visible Area)AREA HORIZONTAL DE LA PANTALLA QUE ES VALIDA (ES DECIR QUE ES UTIL PARA PROYECTAR IMAGENES)
localparam HF = 48; //(Back porch) BORDE HORIZONTAL IZQUIERDO
localparam HB = 16; //(Front porch) BORDE HORIZONTAL DERECHO
localparam HR = 96; //(Sync pulse) HORIZONTAL RETRACE
localparam VD = 480; //(Visible Area)AREA VERTICAL DE LA PANTALLA QUE ES VALIDA (ES DECIR QUE ES UTIL PARA PROYECTAR IMAGENES)
localparam VF = 10; //(Front Porch) BORDE VERTICAL SUPERIOR
localparam VB = 33; //(Back Porch) BORDE VERTICAL INFERIOR
localparam VR = 2; //(Sync Pulse) VERTICAL RETRACE

//SVGA 800X600 @60Hz parametros de sincronizacion
//localparam HD = 800; //(Visible Area)AREA HORIZONTAL DE LA PANTALLA QUE ES VALIDA (ES DECIR QUE ES UTIL PARA PROYECTAR IMAGENES)
//localparam HF = 88; //(Back porch) BORDE HORIZONTAL IZQUIERDO
//localparam HB = 40; //(Front porch) BORDE HORIZONTAL DERECHO
//localparam HR = 128; //(Sync pulse) HORIZONTAL RETRACE
//localparam VD = 600; //(Visible Area)AREA VERTICAL DE LA PANTALLA QUE ES VALIDA (ES DECIR QUE ES UTIL PARA PROYECTAR IMAGENES)
//localparam VF = 1; //(Front Porch) BORDE VERTICAL SUPERIOR
//localparam VB = 23; //(Back Porch) BORDE VERTICAL INFERIOR
//localparam VR = 4; //(Sync Pulse) VERTICAL RETRACE

//mod2_counter
reg mod2_reg;
wire mod2_next;

//sync counter (VGA)
reg [9:0] h_count_reg, h_count_next;
reg [9:0] v_count_reg, v_count_next;

//sync counter (SVGA)
//reg [10:0] h_count_reg, h_count_next;
//reg [10:0] v_count_reg, v_count_next;

//output buffer
reg v_sync_reg, h_sync_reg;
wire v_sync_next, h_sync_next;
//status signal
wire h_end, v_end, pixel_tick;

//Body
//Registers
always @(posedge clk, posedge reset)
	if(reset)
		begin
			mod2_reg <=1'b0;
			v_count_reg <= 0;
			h_count_reg <= 0;
			v_sync_reg <= 1'b0;
			h_sync_reg <= 1'b0;
		end
	else
		begin
			mod2_reg <= mod2_next;
			v_count_reg <= v_count_next;
			h_count_reg <= h_count_next;
			v_sync_reg <= v_sync_next;
			h_sync_reg <= h_sync_next;
		end

//mod-2 circuito para generar 25MHz enable tick

assign mod2_next = ~mod2_reg;//Esto divide la frecuencia de clk a la mitad
assign pixel_tick = mod2_reg;

//status signal

//end of horizontal counter (799)
assign h_end = (h_count_reg == (HD+HF+HB+HR-1));
//end od vertical counter (524)
assign v_end = (v_count_reg == (VD+VF+VB+VR-1));

//next state logic of mod-800 horizontal sync counter
always @*
	if(pixel_tick) //25MHz pulse. Cada vez que pixel_tick sea positivo el contador se incrementa en una unidad, de esta forma barre todos los pixeles de una linea horizontal
		if (h_end)
			h_count_next = 10'd0;
		else
			h_count_next = h_count_reg + 10'd1;
	else
		h_count_next = h_count_reg;

//next state logic of mod-525 vertical sync counter
always @*
	if(pixel_tick & h_end) //25MHz pulse
		if(v_end)
			v_count_next = 10'd0;
		else
			v_count_next = v_count_reg + 10'd1;
	else
		v_count_next = v_count_reg;
		
//horizontal and vertical sync, buffered to avoid glitch

//h_sync_next asserted between 656 and 751
assign h_sync_next = (h_count_reg>=(HD+HB) && h_count_reg<=(HD+HB+HR-1));

//h_sync_next asserted between 490 and 491
//assign v_sync_next = (v_count_reg>=(VD+VB) && v_count_reg<=(VD+VB+VR-1));
assign v_sync_next = (v_count_reg>=(VD+VF) && v_count_reg<=(VD+VF+VR-1));

//video on/off
//assign video_on = (h_count_reg<HD) && (v_count_reg<VD);

//output

assign hsync = h_sync_reg;
assign vsync = v_sync_reg;
assign pixel_x = h_count_reg;
assign pixel_y = v_count_reg;
assign p_tick = pixel_tick;			

endmodule
