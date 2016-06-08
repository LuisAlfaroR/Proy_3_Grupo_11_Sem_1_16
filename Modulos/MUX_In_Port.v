`timescale 1ns / 1ps

module MUX_In_Port(
	input [7:0] Port_ID,In_Port_tec,In_Port_RTC,
	output reg [7:0] In_Port_sal
    );

always@* begin
	In_Port_sal=0;
	if((Port_ID<8'hb)||(Port_ID==8'h17))begin In_Port_sal=In_Port_tec; end
	else begin In_Port_sal=In_Port_RTC; end
	end

endmodule
