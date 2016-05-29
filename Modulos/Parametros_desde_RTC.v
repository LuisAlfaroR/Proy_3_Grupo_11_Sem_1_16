`timescale 1ns / 1ps

module Parametros_desde_RTC(
  input [5:0] addr,
  input clk,rst,
  input [7:0] st_l,mt_l,ht_l,s_l,m_l,h_l,d_l,me_l,a_l,
  output reg [7:0] st,mt,ht,s,m,h,d,me,a
  );

reg [7:0] tems,temm,temh,temd,temme,tema,temst,temmt,temht;
reg cero;

always@(posedge clk)begin
	if(rst)begin 
	tems=0;temm=0;temh=0;temd=0;temme=0;tema=0;temst=0;temmt=0;temht=0;cero=0;
	st=temst;mt=temmt;ht=temht;s=tems;m=temm;h=temh;d=temd;me=temme;a=tema;end
	else
  st=temst;mt=temmt;ht=temht;s=tems;m=temm;h=temh;d=temd;me=temme;a=tema;
  if((temst==8'h59)&&(temmt==8'h59)&&(temht==8'h23))begin
		cero=1;end
  if(addr==6'd10)begin
     s=s_l;
	  tems=s; end
  if(addr==6'd15)begin
     m=m_l;
	  temm=m; end
  if(addr==6'd20)begin
     h=h_l;
	  temh=h; end
  if(addr==6'd25)begin
     d=d_l;
	  temd=d; end
  if(addr==6'd30)begin
     me=me_l;
	  temme=me;end
  if(addr==6'd35)begin
     a=a_l;
	  tema=a; end
  if((addr==6'd40)&&(cero==0))begin
     st=st_l;
	  temst=st;end
  if((addr==6'd45)&&(cero==0))begin
     mt=mt_l;
	  temmt=mt;end
  if((addr==6'd50)&&(cero==0))begin
     ht=ht_l;
	  temht=ht; end
	  
  if((addr==6'd40)&&(cero==1))begin
     st=8'h59;
	  temst=st;end
  if((addr==6'd45)&&(cero==1))begin
     mt=8'h59;
	  temmt=mt;end
  if((addr==6'd50)&&(cero==1))begin
     ht=8'h23;
	  temht=ht; end
	  
  end
endmodule
