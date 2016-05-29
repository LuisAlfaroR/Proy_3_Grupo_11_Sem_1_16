`timescale 1ns / 1ps

module MUX_Seleccion_dato(
	input [3:0] seleccion_dato,
	input [7:0] a_vga,me_vga,d_vga,h_vga,m_vga,s_vga,ht_vga,mt_vga,st_vga,
	output reg [7:0] dato,
	output reg am
    );

always@*
	begin
	dato=0;
	am=1;
	case(seleccion_dato)
	4'd0: begin dato=d_vga; if(h_vga[7]==1)begin am=0;end else am=1; end
	4'd1: begin dato=me_vga; if(h_vga[7]==1)begin am=0;end else am=1; end
	4'd2: begin dato=a_vga; if(h_vga[7]==1)begin am=0;end else am=1; end
	4'd3: begin if(h_vga[7]==1)begin
						dato=(h_vga&(8'b01111111));
						am=0;end
					else if(h_vga[7]==0)begin
						dato=h_vga; end
		   end
	4'd4: begin dato=m_vga; if(h_vga[7]==1)begin am=0;end else am=1; end
	4'd5: begin dato=s_vga; if(h_vga[7]==1)begin am=0;end else am=1; end
	4'd6: begin dato=8'h23-ht_vga; if(h_vga[7]==1)begin am=0;end else am=1; end
	4'd7: begin dato=8'h59-mt_vga; if(h_vga[7]==1)begin am=0;end else am=1; end
	4'd8: begin dato=8'h59-st_vga; if(h_vga[7]==1)begin am=0;end else am=1; end
	endcase
	end

endmodule
