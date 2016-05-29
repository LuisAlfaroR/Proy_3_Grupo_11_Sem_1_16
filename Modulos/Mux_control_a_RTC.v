`timescale 1ns / 1ps

module Mux_control_a_RTC(
	input Es_Le,
	input AD_e,CS_e,RD_e,RW_e, //Controles de escritura
	input AD_l,CS_l,RD_l,RW_l, //Controles de lectura
	output reg AD,CS,RD,RW		//Control enviado al RTC
    );

always@* begin
	if(Es_Le==1)begin
	 AD=AD_l;
	 CS=CS_l;
	 RD=RD_l;
	 RW=RW_l;
	 end
	else begin
	 AD=AD_e;
	 CS=CS_e;
	 RD=RD_e;
	 RW=RW_e;
	 end
end

endmodule
