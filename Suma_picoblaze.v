`timescale 1ns / 1ps

module Suma_picoblaze(
    input clk,
    input reset,
    input [7:0] oper_1,
    input [7:0] oper_2,
    output reg [7:0] resul
    );

wire [9:0] address;
wire [17:0] instruction;
wire [7:0] port_id , in_port , out_port ;
wire write_strobe ;
reg [7:0] in;

kcpsm3 PicoBlaze (
    .address(address), 
    .instruction(instruction), 
    .port_id(port_id), 
    .write_strobe(write_strobe), 
    .out_port(out_port), 
    .read_strobe(), 
    .in_port(in_port), 
    .interrupt(1'b0), 
    .interrupt_ack(), 
    .reset(reset), 
    .clk(clk)
    );
	 
suma ROM (
    .address(address), 
    .instruction(instruction), 
    .clk(clk)
    );

	 
always@(posedge clk)begin
	if(write_strobe)begin
		resul<=out_port;end
end

always@(posedge clk)begin
	if(write_strobe==0&&port_id==8'h0)begin
		in<=oper_1;end
	else if(write_strobe==0&&port_id==8'h01)begin
		in<=oper_2;end
end

assign in_port=in;

endmodule
