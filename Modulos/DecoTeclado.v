`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:40 05/31/2016 
// Design Name: 
// Module Name:    DecoTeclado 
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
module DecoTeclado(
    input clk,
    input TecladoReady,
	 input TeclaLiberada,
    input [7:0] Letra,
    output reg Aumenta=1'b0,
    output reg Disminuye=1'b0,
    output reg Siguiente=1'b0,
    output reg Anterior=1'b0,
    output reg Reset=1'b0,
    output reg Formato=1'b0,
    output reg QuitarAlarma=1'b0,
    output reg CambiarHora=1'b0
    );
	 
	 reg AumentaNext=1'b0;
	 reg DisminuyeNext=1'b0;
	 reg SiguienteNext=1'b0;
	 reg AnteriorNext=1'b0;
	 reg ResetNext=1'b0;
	 reg FormatoNext=1'b0;
	 reg QuitarAlarmaNext=1'b0;
	 reg CambiarHoraNext=1'b0;
	 
	 always @(posedge clk) begin
			Aumenta<=AumentaNext;
		   Disminuye<=DisminuyeNext;
			Siguiente<=SiguienteNext;
			Anterior<=AnteriorNext;
			Reset<=ResetNext;
			Formato<=FormatoNext;
			QuitarAlarma<=QuitarAlarmaNext;
			CambiarHora<=CambiarHoraNext;
	 end
	 
	 always @* begin
			
		  AumentaNext=Aumenta;
		  DisminuyeNext=Disminuye;
		  SiguienteNext=Siguiente;
		  AnteriorNext=Anterior;
		  ResetNext=Reset;
		  FormatoNext=Formato;
		  QuitarAlarmaNext=QuitarAlarma;
		  CambiarHoraNext=CambiarHora;
		  
		  if (TecladoReady == 1'b1 &&(TeclaLiberada == 1'b0)) begin
				case (Letra)
					8'h1d: AumentaNext = 1'b1;
					8'h1b: DisminuyeNext = 1'b1;
					8'h1c: SiguienteNext = 1'b1;
					8'h23: AnteriorNext = 1'b1;
					8'h2d: ResetNext = 1'b1;
					8'h2b: FormatoNext = 1'b1;
					8'h15: QuitarAlarmaNext = 1'b1;
					8'h21: CambiarHoraNext = 1'b1;
					
				endcase
		  end
		  
		  else if (TeclaLiberada == 1'b1) begin
		  
				   AumentaNext = 1'b0;
					DisminuyeNext = 1'b0;
					SiguienteNext = 1'b0;
					AnteriorNext = 1'b0;
				   ResetNext = 1'b0;
					FormatoNext = 1'b0;
					QuitarAlarmaNext = 1'b0;
					CambiarHoraNext = 1'b0;
		  end
		  
		  
	 end


endmodule
