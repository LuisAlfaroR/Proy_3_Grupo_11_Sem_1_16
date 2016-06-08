`timescale 1ns / 1ps

module Deco_salida_Pico(
	input [7:0] Out_Port,In_Port,
	output reg[7:0] Out_Port_sal=8'b0,In_Port_sal=8'b0
    );

always@* begin
	case(In_Port)
		8'h00: begin In_Port_sal=8'h00; end
		8'h01: begin In_Port_sal=8'h01; end
		8'h02: begin In_Port_sal=8'h02; end
		8'h03: begin In_Port_sal=8'h03; end
		8'h04: begin In_Port_sal=8'h04; end
		8'h05: begin In_Port_sal=8'h05; end
		8'h06: begin In_Port_sal=8'h06; end
		8'h07: begin In_Port_sal=8'h07; end
		8'h08: begin In_Port_sal=8'h08; end
		8'h09: begin In_Port_sal=8'h09; end
		8'h10: begin In_Port_sal=8'h0a; end
		8'h11: begin In_Port_sal=8'h0b; end
		8'h12: begin In_Port_sal=8'h0c; end
		8'h13: begin In_Port_sal=8'h0d; end
		8'h14: begin In_Port_sal=8'h0e; end
		8'h15: begin In_Port_sal=8'h0f; end
		8'h16: begin In_Port_sal=8'h10; end
		8'h17: begin In_Port_sal=8'h11; end
		8'h18: begin In_Port_sal=8'h12; end
		8'h19: begin In_Port_sal=8'h13; end
		8'h20: begin In_Port_sal=8'h14; end
		8'h21: begin In_Port_sal=8'h15; end
		8'h22: begin In_Port_sal=8'h16; end
		8'h23: begin In_Port_sal=8'h17; end
		8'h24: begin In_Port_sal=8'h18; end
		8'h25: begin In_Port_sal=8'h19; end
		8'h26: begin In_Port_sal=8'h1a; end
		8'h27: begin In_Port_sal=8'h1b; end
		8'h28: begin In_Port_sal=8'h1c; end
		8'h29: begin In_Port_sal=8'h1d; end
		8'h30: begin In_Port_sal=8'h1e; end
		8'h31: begin In_Port_sal=8'h1f; end
		8'h32: begin In_Port_sal=8'h20; end
		8'h33: begin In_Port_sal=8'h21; end
		8'h34: begin In_Port_sal=8'h22; end
		8'h35: begin In_Port_sal=8'h23; end
		8'h36: begin In_Port_sal=8'h24; end
		8'h37: begin In_Port_sal=8'h25; end
		8'h38: begin In_Port_sal=8'h26; end
		8'h39: begin In_Port_sal=8'h27; end
		8'h40: begin In_Port_sal=8'h28; end
		8'h41: begin In_Port_sal=8'h29; end
		8'h42: begin In_Port_sal=8'h2a; end
		8'h43: begin In_Port_sal=8'h2b; end
		8'h44: begin In_Port_sal=8'h2c; end
		8'h45: begin In_Port_sal=8'h2d; end
		8'h46: begin In_Port_sal=8'h2e; end
		8'h47: begin In_Port_sal=8'h2f; end
		8'h48: begin In_Port_sal=8'h30; end
		8'h49: begin In_Port_sal=8'h31; end
		8'h50: begin In_Port_sal=8'h32; end
		8'h51: begin In_Port_sal=8'h33; end
		8'h52: begin In_Port_sal=8'h34; end
		8'h53: begin In_Port_sal=8'h35; end
		8'h54: begin In_Port_sal=8'h36; end
		8'h55: begin In_Port_sal=8'h37; end
		8'h56: begin In_Port_sal=8'h38; end
		8'h57: begin In_Port_sal=8'h39; end
		8'h58: begin In_Port_sal=8'h3a; end
		8'h59: begin In_Port_sal=8'h3b; end
		default:begin In_Port_sal=0; end
	endcase
		case(Out_Port)
		8'h00: begin Out_Port_sal=8'h00; end
		8'h01: begin Out_Port_sal=8'h01; end
		8'h02: begin Out_Port_sal=8'h02; end
		8'h03: begin Out_Port_sal=8'h03; end
		8'h04: begin Out_Port_sal=8'h04; end
		8'h05: begin Out_Port_sal=8'h05; end
		8'h06: begin Out_Port_sal=8'h06; end
		8'h07: begin Out_Port_sal=8'h07; end
		8'h08: begin Out_Port_sal=8'h08; end
		8'h09: begin Out_Port_sal=8'h09; end
		8'h0a: begin Out_Port_sal=8'h10; end
		8'h0b: begin Out_Port_sal=8'h11; end
		8'h0c: begin Out_Port_sal=8'h12; end
		8'h0d: begin Out_Port_sal=8'h13; end
		8'h0e: begin Out_Port_sal=8'h14; end
		8'h0f: begin Out_Port_sal=8'h15; end
		8'h10: begin Out_Port_sal=8'h16; end
		8'h11: begin Out_Port_sal=8'h17; end
		8'h12: begin Out_Port_sal=8'h18; end
		8'h13: begin Out_Port_sal=8'h19; end
		8'h14: begin Out_Port_sal=8'h20; end
		8'h15: begin Out_Port_sal=8'h21; end
		8'h16: begin Out_Port_sal=8'h22; end
		8'h17: begin Out_Port_sal=8'h23; end
		8'h18: begin Out_Port_sal=8'h24; end
		8'h19: begin Out_Port_sal=8'h25; end
		8'h1a: begin Out_Port_sal=8'h26; end
		8'h1b: begin Out_Port_sal=8'h27; end
		8'h1c: begin Out_Port_sal=8'h28; end
		8'h1d: begin Out_Port_sal=8'h29; end
		8'h1e: begin Out_Port_sal=8'h30; end
		8'h1f: begin Out_Port_sal=8'h31; end
		8'h20: begin Out_Port_sal=8'h32; end
		8'h21: begin Out_Port_sal=8'h33; end
		8'h22: begin Out_Port_sal=8'h34; end
		8'h23: begin Out_Port_sal=8'h35; end
		8'h24: begin Out_Port_sal=8'h36; end
		8'h25: begin Out_Port_sal=8'h37; end
		8'h26: begin Out_Port_sal=8'h38; end
		8'h27: begin Out_Port_sal=8'h39; end
		8'h28: begin Out_Port_sal=8'h40; end
		8'h29: begin Out_Port_sal=8'h41; end
		8'h2a: begin Out_Port_sal=8'h42; end
		8'h2b: begin Out_Port_sal=8'h43; end
		8'h2c: begin Out_Port_sal=8'h44; end
		8'h2d: begin Out_Port_sal=8'h45; end
		8'h2e: begin Out_Port_sal=8'h46; end
		8'h2f: begin Out_Port_sal=8'h47; end
		8'h30: begin Out_Port_sal=8'h48; end
		8'h31: begin Out_Port_sal=8'h49; end
		8'h32: begin Out_Port_sal=8'h50; end
		8'h33: begin Out_Port_sal=8'h51; end
		8'h34: begin Out_Port_sal=8'h52; end
		8'h35: begin Out_Port_sal=8'h53; end
		8'h36: begin Out_Port_sal=8'h54; end
		8'h37: begin Out_Port_sal=8'h55; end
		8'h38: begin Out_Port_sal=8'h56; end
		8'h39: begin Out_Port_sal=8'h57; end
		8'h3a: begin Out_Port_sal=8'h58; end
		8'h3b: begin Out_Port_sal=8'h59; end
		default:begin Out_Port_sal=0; end
	endcase
end
endmodule
