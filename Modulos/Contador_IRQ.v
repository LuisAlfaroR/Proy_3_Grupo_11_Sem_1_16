`timescale 1ns / 1ps

module Contador_IRQ(
    input clk, //Clk de 100ns T=10Mhz
	 input EN,
    input rst,
	 output reg cuenta_fin
    );

reg [9:0] out;

always@(posedge clk) begin

	if(rst)begin
		out<=0;
		cuenta_fin=0; end
	else if(EN) begin
		
	if(out!=10'd600)begin
		out<=out+10'd1;
		cuenta_fin=0; end
	else begin
		out<=0;
		cuenta_fin=1;end
	end
	end
endmodule
