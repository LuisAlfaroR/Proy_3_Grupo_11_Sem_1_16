`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:03:32 03/20/2016 
// Design Name: 
// Module Name:    pong-graph-st 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pong_graph_st
	(
 		//input wire video_on,
		input wire clk,
		input wire [9:0] pix_x, pix_y,
		input wire ringout,
		input wire [10:0] direccion,
		input wire ampm,
		input wire [8:0]Habilita,
		input sistemamilitar,
		output wire [2:0] rgb_text,
		output reg [3:0] selector_dato,
		output reg selector_digito
    );

wire [10:0] renglon;
wire [2:0] columna;
wire [7:0] data;

localparam [2:0] rojo = 3'b001, verde = 3'b000, azul = 3'b100,blanco= 3'b111, amarillo = 3'b011, magenta= 3'b101; 

//Se modifican en el case
reg[9:0] posx = 10'd0, posy = 10'd0;
reg [1:0] escalamiento = 2'd2;
reg [10:0] codigo_caracter = 11'd0;
reg [2:0] color = verde;

reg [2:0] rgb_reg = verde;

//assign rgb_text = data[columna] ? color : verde;
assign rgb_text = rgb_reg;

wire[9:0] c = ((pix_x - posx) / escalamiento);

assign renglon = (pix_y - posy) / escalamiento + codigo_caracter;
assign columna = 3'd7 - c[2:0];

font_rom fr (/*.clk(clk),*/ .addr(renglon), .data(data));

always @(negedge clk) begin
	if (data[columna] == 1'b1)
		rgb_reg = color;
	else 
	   rgb_reg = verde;
end

always @* begin
	
	posx = 10'd0;
	posy = 10'd0;
	escalamiento = 2'd2;
	color = verde;
	codigo_caracter = 11'h000;
	selector_dato = 4'd0;
	selector_digito = 1'b0;
	//if(~video_on)
	//	color = 3'b000; //Green
	//else begin
		if ((pix_x >= 10'd183) && (pix_x < 10'd199) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd183;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h440;
			color = azul;
		end
	
		else if ((pix_x >= 10'd203) && (pix_x < 10'd219) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd203;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h690;
			color = azul;
		end
	
		else if ((pix_x >= 10'd223) && (pix_x < 10'd239) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd223;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h610;
			color = azul;
		end
		
		else if ((pix_x >= 10'd243) && (pix_x < 10'd259) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd243;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h000;
			color = verde;
		end
		
		else if ((pix_x >= 10'd263) && (pix_x < 10'd279) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd263;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h4d0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd283) && (pix_x < 10'd299) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd283;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h650;
			color = azul;
		end
		
		else if ((pix_x >= 10'd303) && (pix_x < 10'd319) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd303;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h730;
			color = azul;
		end
		
		else if ((pix_x >= 10'd372) && (pix_x < 10'd388) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd372;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h410;
			color = azul;
		end
		
		else if ((pix_x >= 10'd392) && (pix_x < 10'd408) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd392;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h7e0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd412) && (pix_x < 10'd428) && (pix_y >= 10'd54) && (pix_y < 10'd86)) begin
			posx = 10'd412;
			posy = 10'd54;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6f0;
			color = azul;
		end
		
		//Mostrar los digitos
		else if ((pix_x >= 10'd184) && (pix_x < 10'd208) && (pix_y >= 10'd102) && (pix_y < 10'd150)) begin
			if (Habilita== 9'b000000100)
				color = magenta;
			else
			   color = rojo;
				
			posx = 10'd184;
			posy = 10'd102;
			escalamiento = 2'd3;
			selector_dato = 4'd0;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end
		else if ((pix_x >= 10'd214) && (pix_x < 10'd238) && (pix_y >= 10'd102) && (pix_y < 10'd150)) begin
			if (Habilita== 9'b000000100)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd214;
			posy = 10'd102;
			escalamiento = 2'd3;
			selector_dato = 4'd0;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		else if ((pix_x >= 10'd264) && (pix_x < 10'd287) && (pix_y >= 10'd102) && (pix_y < 10'd150)) begin
			if (Habilita== 9'b000000010)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd264;
			posy = 10'd102;
			escalamiento = 2'd3;
			selector_dato = 4'd1;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd293) && (pix_x < 10'd317) && (pix_y >= 10'd102) && (pix_y < 10'd150)) begin
			if (Habilita== 9'b000000010)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd293;
			posy = 10'd102;
			escalamiento = 2'd3;
			selector_dato = 4'd1;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		
		
		else if ((pix_x >= 10'd343) && (pix_x < 10'd367) && (pix_y >= 10'd102) && (pix_y < 10'd150)) begin
			posx = 10'd343;
			posy = 10'd102;
			escalamiento = 2'd3;
			codigo_caracter = 11'h320;
			color = rojo;
		end
		
		else if ((pix_x >= 10'd373) && (pix_x < 10'd397) && (pix_y >= 10'd102) && (pix_y < 10'd150)) begin
			posx = 10'd373;
			posy = 10'd102;
			escalamiento = 2'd3;
			codigo_caracter = 11'h300;
			color = rojo;
		end
		
		else if ((pix_x >= 10'd403) && (pix_x < 10'd427) && (pix_y >= 10'd102) && (pix_y < 10'd150)) begin
			if (Habilita== 9'b000000001)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd403;
			posy = 10'd102;
			escalamiento = 2'd3;
			selector_dato = 4'd2;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd433) && (pix_x < 10'd457) && (pix_y >= 10'd102) && (pix_y < 10'd150)) begin
			if (Habilita== 9'b000000001)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd433;
			posy = 10'd102;
			escalamiento = 2'd3;
			selector_dato = 4'd2;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd117) && (pix_x < 10'd141) && (pix_y >= 10'd204) && (pix_y < 10'd252)) begin
			posx = 10'd117;
			posy = 10'd204;
			escalamiento = 2'd3;
			codigo_caracter = 11'h480;
			color = azul;
		end
		else if ((pix_x >= 10'd147) && (pix_x < 10'd171) && (pix_y >= 10'd204) && (pix_y < 10'd252)) begin
			posx = 10'd147;
			posy = 10'd204;
			escalamiento = 2'd3;
			codigo_caracter = 11'h6f0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd177) && (pix_x < 10'd201) && (pix_y >= 10'd204) && (pix_y < 10'd252)) begin
			posx = 10'd177;
			posy = 10'd204;
			escalamiento = 2'd3;
			codigo_caracter = 11'h720;
			color = azul;
		end
		
		else if ((pix_x >= 10'd207) && (pix_x < 10'd231) && (pix_y >= 10'd204) && (pix_y < 10'd252)) begin
			posx = 10'd207;
			posy = 10'd204;
			escalamiento = 2'd3;
			codigo_caracter = 11'h610;
			color = azul;
		end
		
		else if ((pix_x >= 10'd57) && (pix_x < 10'd81) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b000001000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd57;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd3;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end	
		
		else if ((pix_x >= 10'd87) && (pix_x < 10'd111) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b000001000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd87;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd3;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd117) && (pix_x < 10'd141) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			posx = 10'd117;
			posy = 10'd268;
			escalamiento = 2'd3;
			codigo_caracter = 11'h3a0;
			color = rojo;
		end
		
		else if ((pix_x >= 10'd147) && (pix_x < 10'd171) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b000010000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd147;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd4;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd177) && (pix_x < 10'd201) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b000010000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd177;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd4;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd207) && (pix_x < 10'd231) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			posx = 10'd207;
			posy = 10'd268;
			escalamiento = 2'd3;
			codigo_caracter = 11'h3a0;
			color = rojo;
		end
		
		else if ((pix_x >= 10'd237) && (pix_x < 10'd261) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b000100000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd237;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd5;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd267) && (pix_x < 10'd291) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b000100000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd267;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd5;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd76) && (pix_x < 10'd92) && (pix_y >= 10'd324) && (pix_y < 10'd356)) begin
			posx = 10'd76;
			posy = 10'd324;
			escalamiento = 2'd2;
			codigo_caracter = 11'h480;
			color = azul;
		end
		
		else if ((pix_x >= 10'd166) && (pix_x < 10'd182) && (pix_y >= 10'd324) && (pix_y < 10'd356)) begin
			posx = 10'd166;
			posy = 10'd324;
			escalamiento = 2'd2;
			codigo_caracter = 11'h4d0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd256) && (pix_x < 10'd272) && (pix_y >= 10'd324) && (pix_y < 10'd356)) begin
			posx = 10'd256;
			posy = 10'd324;
			escalamiento = 2'd2;
			codigo_caracter = 11'h530;
			color = azul;
		end
		
		else if ((pix_x >= 10'd367) && (pix_x < 10'd383) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd367;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h430;
			color = azul;
		end
		
		else if ((pix_x >= 10'd387) && (pix_x < 10'd403) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd387;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h720;
			color = azul;
		end
		
		else if ((pix_x >= 10'd407) && (pix_x < 10'd423) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd407;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6f0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd427) && (pix_x < 10'd443) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd427;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6e0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd447) && (pix_x < 10'd463) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd447;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6f0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd467) && (pix_x < 10'd483) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd467;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6d0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd487) && (pix_x < 10'd503) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd487;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h650;
			color = azul;
		end
		else if ((pix_x >= 10'd507) && (pix_x < 10'd523) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd507;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h740;
			color = azul;
		end
		
		else if ((pix_x >= 10'd527) && (pix_x < 10'd543) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd527;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h720;
			color = azul;
		end
		
		else if ((pix_x >= 10'd547) && (pix_x < 10'd563) && (pix_y >= 10'd204) && (pix_y < 10'd236)) begin
			posx = 10'd547;
			posy = 10'd204;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6f0;
			color = azul;
		end

		else if ((pix_x >= 10'd348) && (pix_x < 10'd372) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b001000000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd348;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd6;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end	
		
		else if ((pix_x >= 10'd378) && (pix_x < 10'd402) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b001000000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd378;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd6;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd408) && (pix_x < 10'd432) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			posx = 10'd408;
			posy = 10'd268;
			escalamiento = 2'd3;
			codigo_caracter = 11'h3a0;
			color = rojo;
		end
		
		else if ((pix_x >= 10'd438) && (pix_x < 10'd462) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b010000000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd438;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd7;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd468) && (pix_x < 10'd492) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b010000000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd468;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd7;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd498) && (pix_x < 10'd522) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			posx = 10'd498;
			posy = 10'd268;
			escalamiento = 2'd3;
			codigo_caracter = 11'h3a0;
			color = rojo;
		end
		
		else if ((pix_x >= 10'd528) && (pix_x < 10'd552) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b100000000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd528;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd8;
			selector_digito = 1'b1;
			codigo_caracter = direccion;
		end
		
		else if ((pix_x >= 10'd558) && (pix_x < 10'd582) && (pix_y >= 10'd268) && (pix_y < 10'd316)) begin
			if (Habilita== 9'b100000000)
				color = magenta;
			else
			   color = rojo;
			posx = 10'd558;
			posy = 10'd268;
			escalamiento = 2'd3;
			selector_dato = 4'd8;
			selector_digito = 1'b0;
			codigo_caracter = direccion;
		end
		// horas minutos y segundos del cronometro
		else if ((pix_x >= 10'd367) && (pix_x < 10'd383) && (pix_y >= 10'd324) && (pix_y < 10'd356)) begin
			posx = 10'd367;
			posy = 10'd324;
			escalamiento = 2'd2;
			codigo_caracter = 11'h480;
			color = azul;
		end
		
		else if ((pix_x >= 10'd457) && (pix_x < 10'd473) && (pix_y >= 10'd324) && (pix_y < 10'd356)) begin
			posx = 10'd457;
			posy = 10'd324;
			escalamiento = 2'd2;
			codigo_caracter = 11'h4d0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd547) && (pix_x < 10'd563) && (pix_y >= 10'd324) && (pix_y < 10'd356)) begin
			posx = 10'd547;
			posy = 10'd324;
			escalamiento = 2'd2;
			codigo_caracter = 11'h530;
			color = azul;
		end
		//ring
		else if ((pix_x >= 10'd506) && (pix_x < 10'd522) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd506;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = ringout ? 11'h030 : 11'h000;
			color = rojo;
		end
		
		else if ((pix_x >= 10'd526) && (pix_x < 10'd542) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd526;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h520;
			color = azul;
		end
		
		else if ((pix_x >= 10'd546) && (pix_x < 10'd562) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd546;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h690;
			color = azul;
		end
		else if ((pix_x >= 10'd566) && (pix_x < 10'd582) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd566;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6e0;
			color = azul;
		end
		
		else if ((pix_x >= 10'd586) && (pix_x < 10'd602) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd586;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h670;
			color = azul;
		end
		//am y pm 
		else if ((pix_x >= 10'd128) && (pix_x < 10'd144) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd128;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h610;
			color = sistemamilitar ? verde : (ampm ? amarillo : azul);
		end
		
		else if ((pix_x >= 10'd148) && (pix_x < 10'd164) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd148;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6d0;
			color = sistemamilitar ? verde : (ampm ? amarillo : azul);
		end
		
		else if ((pix_x >= 10'd168) && (pix_x < 10'd184) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd168;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h2f0;
			color = sistemamilitar ? verde : azul;
		end
		
		
		else if ((pix_x >= 10'd188) && (pix_x < 10'd204) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd188;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h700;
			color = sistemamilitar ? verde : (~ampm ? amarillo : azul);
		end
		
		else if ((pix_x >= 10'd208) && (pix_x < 10'd224) && (pix_y >= 10'd394) && (pix_y < 10'd426)) begin
			posx = 10'd208;
			posy = 10'd394;
			escalamiento = 2'd2;
			codigo_caracter = 11'h6d0;
			color = sistemamilitar ? verde : (~ampm ? amarillo : azul);
		end	
		else begin
				end		
	//end
		
		
	
		
		/*
		//Comprobar si esta dentro del rango
		if (pix_x >= 10'd160 && pix_x < 10'd184 && pix_y >= 10'd80 && pix_y < 10'd128) begin
			
			if (data[bit_addr] == 1'b1)
				graph_rgb = 3'b111;
			else
				graph_rgb = 3'b000;
		
		end
		
		else
			graph_rgb = 3'b000;
		*/
	
	end

endmodule
