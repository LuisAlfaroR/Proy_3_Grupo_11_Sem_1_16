`timescale 1ns / 1ps

module Proyecto_final(
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
    .read_strobe(read_strobe), 
    .in_port(in_port), 
    .interrupt(interrupt), 
    .interrupt_ack(interrupt_ack), 
    .reset(reset), 
    .clk(clk)
    );
	 
prueba ROM (
    .address(address), 
    .instruction(instruction), 
    .clk(clk)
    );
	 

endmodule
