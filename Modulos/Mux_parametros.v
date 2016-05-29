`timescale 1ns / 1ps

module Mux_parametros(
	input rtc,
	input [7:0] a,me,d,h,m,s,ht,mt,st, 													//Parametros dados por usuario
	input [7:0] a_l,me_l,d_l,h_l,m_l,s_l,ht_l,mt_l,st_l, 							//Parametros Leidos del RTC
	output reg[7:0] a_vga,me_vga,d_vga,h_vga,m_vga,s_vga,ht_vga,mt_vga,st_vga//Parametros hacia VGA
    );

always@* begin
	 a_vga=0;
	 me_vga=0;
	 d_vga=0;
	 h_vga=0;
	 m_vga=0;
	 s_vga=0;
	 ht_vga=0;
	 mt_vga=0;
	 st_vga=0;
	case(rtc)
	1'b1:begin
	 a_vga=a_l;
	 me_vga=me_l;
	 d_vga=d_l;
	 h_vga=h_l;
	 m_vga=m_l;
	 s_vga=s_l;
	 ht_vga=ht_l;
	 mt_vga=mt_l;
	 st_vga=st_l;
	 end
	1'b0: begin
	 a_vga=a;
	 me_vga=me;
	 d_vga=d;
	 h_vga=h;
	 m_vga=m;
	 s_vga=s;
	 ht_vga=ht;
	 mt_vga=mt;
	 st_vga=st;
	 end
	 endcase
end

endmodule
