`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:40 08/18/2015 
// Design Name: 
// Module Name:    Teclado 
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

		module Teclado
		(
		input wire clk, reset,
		input wire ps2d, ps2c,rx_en,
		output reg rx_done_tick = 1'b0,
		output wire [7:0] dout
		);
		
	
		localparam [1:0]
			idle = 2'b00,
			dps = 2'b01,
			load = 2'b10;
			
			
		reg [1:0] state_reg = 2'b00, state_next = 2'b00;
		reg [7:0] filter_reg = 8'd0;
		wire [7:0] filter_next;
		reg f_ps2c_reg = 1'b0;
		wire f_ps2c_next;
		reg [3:0] n_reg = 4'b0000, n_next = 4'b0000;
		reg [10:0] b_reg = 11'd0, b_next = 11'd0;
		wire fall_edge;
		
	always @(posedge clk, posedge reset)
	if (reset)
		
		begin
		filter_reg <= 0;
		f_ps2c_reg <= 0;
		
		end

	else 
	
	begin
	filter_reg <= filter_next;
	f_ps2c_reg <= f_ps2c_next;
	end
	
	assign filter_next = {ps2c, filter_reg[7:1]};
	assign f_ps2c_next = (filter_reg == 8'b11111111) ? 1'b1 :
								(filter_reg == 8'b00000000) ? 1'b0 :
								 f_ps2c_reg;
								 
	assign fall_edge = f_ps2c_reg & ~f_ps2c_next; 
	
	
	always @(posedge clk, posedge reset)
	if (reset)
	begin
	state_reg <= idle;
	n_reg <= 0;
	b_reg <= 0;
	end
	else 
	begin
	state_reg <= state_next;
	n_reg <= n_next;
	b_reg <= b_next;
	end
	
	always @* 
	begin 
		state_next = state_reg;
		rx_done_tick = 1'b0;
		n_next = n_reg; 
		b_next = b_reg;
		
	case (state_reg)
	idle: 
		if (fall_edge & rx_en)
		begin
		b_next = {ps2d, b_reg[10:1]};
		n_next = 4'b1001;
		state_next = dps;
		end
		
		
	dps: 
	
	if (fall_edge)
	
	begin
		b_next = {ps2d, b_reg[10:1]};
		if (n_reg == 0)
			state_next = load;
		else
			n_next = n_reg - 1'b1;
		end
		
	load: 
	begin
	state_next = idle;
	rx_done_tick = 1'b1;
	end
	endcase
	
	end
	
	assign dout = b_reg[8:1];
	
	
	endmodule 
	
	
	