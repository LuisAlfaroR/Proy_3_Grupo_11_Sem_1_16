`timescale 1ns / 1ps

module Registro_Teclado(
	 //input clk,
    input reset,
    input aumenta,disminuye,siguiente,anterior,formato,cambia,quita,
	 input [7:0] Port_ID,
	 output reg [7:0] In_Port
	 //output reg interrupcion
    );

always@*begin
	if(reset)begin In_Port=0; end
	//else if(cambia)begin interrupcion=1; end
	else begin
	In_Port=8'hff;
	case(Port_ID)
		8'h03 : begin
					 if(aumenta)begin In_Port=8'h4;end
					 else begin In_Port=8'd0; end
				  end
		8'h04 : begin
					 if(disminuye)begin In_Port=8'h5;end
					 else begin In_Port=8'd0; end
				  end
		8'h05 : begin
					 if(siguiente)begin In_Port=8'h6;end
					 else begin In_Port=8'd0; end
				  end
		8'h06 : begin
					 if(anterior)begin In_Port=8'h7;end
					 else begin In_Port=8'd0; end
				  end
		8'h17 : begin
					 if(cambia)begin In_Port=8'h9;end
					 else begin In_Port=8'd0; end
				  end
	endcase
	end
end
endmodule
