`timescale 1ns / 1ps

module Contador_lectura(
    input clk,
	 input EN,
    input up,
	 /*input Ld_1,
	 input Ld_2,*/
    input down,
    input rst,
    output reg [5:0] out
    );

always@(posedge clk) begin

	if(rst)begin
		out<=0; end
	else if(EN) begin
	
	/*if(Ld_1==1&&Ld_2==0)begin
	   out<=7'd48;end
	else begin if(Ld_2==1&&Ld_1==0)begin
		out<=7'd83;end end*/
		
	if(up & down==0 & out!=6'd50)begin
		out<=out+6'd1; end
	else if(down & up==0 & out!=6'd0)begin
		out<=out-6'd1; end
	else if(down & up==0 & out==6'd0)begin
		out<=6'd50; end
	else if(up & down==0 & out==6'd50)begin
		out<=0; end
	end
end
endmodule
