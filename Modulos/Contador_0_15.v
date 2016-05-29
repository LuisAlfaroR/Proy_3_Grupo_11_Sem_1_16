
`timescale 1ns / 1ps
module Contador_0_15(
    input clk,
	 input EN,
    input up,
	 input Ld_1,
	 input Ld_2,
    input down,
    input rst,
    output reg [6:0] out
    );

always@(posedge clk) begin

	if(rst)begin
		out<=7'd0; end
	else if(EN) begin
	
	if(Ld_1==1&&Ld_2==0)begin
	   out<=7'd53;end
	else if(Ld_2==1&&Ld_1==0)begin
		out<=7'd88;end 
		
	else if(up & down==0 & out!=7'd93)begin
		out<=out+7'd1; end
	else if(down & up==0 & out!=7'd0)begin
		out<=out-7'd1; end
	else if(down & up==0 & out==7'd0)begin
		out<=7'd88; end
	else if(up & down==0 & out==7'd93)begin
		out<=0; end
	end
end
endmodule
