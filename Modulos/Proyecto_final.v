`timescale 1ns / 1ps

module Proyecto_final(
    );

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
