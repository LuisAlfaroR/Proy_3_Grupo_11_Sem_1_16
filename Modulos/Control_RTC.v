`timescale 1ns / 1ps

module Control_RTC(
	 input clk,rst,modifica_timer,Quita_IRQ,
	 input Listo_ht,Listo_es,Listo_Limpia,cuenta_fin,
	 output reg rst_lee,down_es,down_lec,EN_es,EN_lec,//RTC,LD_par,EN_par,rst_par,rst_Listo,
	 output reg rst_esc,up_esc,LD_esc_1,LD_esc_2,Es_Le,Leer,up_lee,rst_cuent_IRQ,EN_IRQ,rst_recolecta
    );

reg [2:0] estado_act,estado_prox;

always @(posedge clk, posedge rst)
	begin 
	if (rst)begin
		estado_act <= 3'd6;
	end else begin 
		estado_act<=estado_prox;end 
	end

always@*begin
  estado_prox=estado_act;
  rst_lee=0;down_es=0;down_lec=0;EN_es=1;EN_lec=1;//RTC=1;LD_par=0;EN_par=1;rst_par=0;rst_Listo=0;
  rst_esc=0;up_esc=0;LD_esc_1=0;LD_esc_2=0;Es_Le=1;Leer=0;up_lee=0;rst_cuent_IRQ=0;EN_IRQ=0;
  rst_recolecta=1;
  case(estado_act)
  3'd0: begin
			if(Listo_ht==0)begin
				//RTC=0;EN_par=1;
				estado_prox=3'd0;end
				else begin 
					rst_esc=1;
					estado_prox=3'd1; end 
			end
  3'd1: begin
			if(Listo_es==0)begin
				/*RTC=0;*/Es_Le=0;up_esc=1;
				estado_prox=3'd1; end
				else begin
					rst_lee=1;
					estado_prox=3'd2; end
			end
	3'd2: begin
			if(rst==1)begin
					//rst_par=1;rst_Listo=1;
					estado_prox=3'd0;end
					else if(Quita_IRQ==1)begin
								LD_esc_2=1;
								estado_prox=3'd5; end
								else if(modifica_timer==1)begin
										rst_esc=1;
										estado_prox=3'd6; end
										else begin 
										Leer=1;up_lee=1; Es_Le=1;rst_esc=1;
										rst_cuent_IRQ=1; /*LD_par=1; EN_par=1; 
										rst_Listo=1;*/rst_recolecta=0;
										estado_prox=3'd2; end 
			end
	3'd3: begin
			if(Listo_ht==0)begin
				/*EN_par=1;RTC=0;*/LD_esc_1=1;
				estado_prox=3'd3; end
				else begin
					estado_prox=3'd4; end
			end
	3'd4: begin
			if(Listo_es==0)begin
				Es_Le=0;up_esc=1;rst_lee=1;//RTC=0;
				estado_prox=3'd4; end
				else if (modifica_timer==1)begin
						//RTC=0; 
						estado_prox=3'd4;end
				else begin
					estado_prox=3'd2; end
			end
	3'd5: begin
			if((Listo_Limpia==1)&&(cuenta_fin==1))begin
				estado_prox=3'd2;end
				else begin
					Es_Le=0;up_esc=1;rst_lee=1;EN_IRQ=1;
					estado_prox=3'd5;end
			end
	3'd6: begin
			rst_lee=1;//rst_par=1;rst_Listo=0;
		   rst_esc=1;rst_cuent_IRQ=1;
		   rst_recolecta=0;
			down_es=1;down_lec=1;EN_es=0;EN_lec=0;
			estado_prox=3'd0;
			end
	default: begin
				estado_prox= 3'dx;end
	endcase
	end	
endmodule
