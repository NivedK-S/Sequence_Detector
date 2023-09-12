`timescale 1ps/1ps
`include "FSM_1101_MealyMachine.v"
module FSM_1101_tb();
reg clk,rst,in;
wire out;
FSM1101 DUT(
    .clk(clk),
    .in(in),
    .rst(rst),
    .out(out)
);
initial  begin
  clk=1'b0;
  rst=1'b1;
  #15 rst=1'b0;


end

initial forever begin
    #5 clk=~clk;
end
initial begin
  $monitor("%t||rst=%b||in=%b||out=%b||state=%d",$time,rst,in,out,DUT.state);
  $dumpfile("FSM_1101.vcd");
  $dumpvars;
end
initial begin
  #15 in=0;
  #10 in=1;#10 in=1;#10 in=0;#10 in=1;#10 in=1; #10 in=1;
  #20 $finish;
end
endmodule