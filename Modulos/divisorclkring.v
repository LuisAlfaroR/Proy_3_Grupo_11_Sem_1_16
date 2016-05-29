`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:11:51 04/16/2016 
// Design Name: 
// Module Name:    divisorclkring 
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
module divisorclkring(
    input clk,
    input rtcin,
    output ring
    );
 
reg [24:0] cuenta = 25'd0;
reg clk_out = 1'b0;

assign ring = rtcin & clk_out;

always @(posedge clk )begin
	if(cuenta==25'd25000000)begin
       cuenta=25'd0;
       clk_out=~clk_out;end
   else begin
       cuenta=cuenta+25'd1;end
end		

endmodule
