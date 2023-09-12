`timescale 1ps/1ps
`include "FSM_1010_Moore.v"
module FSM_1010_Moore_tb();
reg clk,rst,in;
wire out;
FSM_1010 DUT(
    .clk(clk),
    .in(in),
    .out(out),
    .rst(rst)
);
initial begin
   rst=1'b1;
   clk=1'b0;
   #15 rst=1'b0;
end
initial forever begin
  #5 clk=~clk;
end
initial begin
  $dumpfile("FSM1010.vcd");
  $dumpvars;
  $monitor($time,"in=%b,ps=%b,out=%b",in,DUT.PS,out);
  #15 in=0;
  #10 in=1;#10 in=0;#10 in=1;#10 in=0;#10 in=1;#10 in=0;#10 in=1;
  #20 $finish;
end


endmodule