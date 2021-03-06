`timescale 1ns / 1ps

module Divisor_de_Frecuencia(

input clk,rst,
output clk_out1);
 
reg [2:0] cuenta; //2:0 y 4:0 para prueba
reg clk_out;

always @(posedge clk )begin
	if(rst)begin
		clk_out=0;
		cuenta=0;end
	if(cuenta==3'd5)begin //3'd5 Divide frecuencia a 10MHz T=100ns y 5'd25 para prueba
       cuenta=3'd0;
       clk_out=~clk_out;end
   else begin
       cuenta=cuenta+3'd1;end
end

BUFG Seguidor (
    .O(clk_out1), 
    .I(clk_out)
    );
	 
endmodule

