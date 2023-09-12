`timescale 1ps/1ps
`include "FSM1011Mooreoveralp.v"
module FSM1011Mooreoveralptb();
reg clk,in,rst;
wire out;
FSM1011Mooreoveralp DUT(
.clk(clk),
.rst(rst),
.in(in),
.out(out)
);
initial begin
    clk=1'b0;
    rst=1'b1;
    #15 rst=1'b0;
end
initial forever begin
    #5 clk=~clk;
end
initial begin
    $monitor("%t,rst=%b,PS=%b,in=%b,out=%b",$time,rst,DUT.PS,in,out);
    $dumpfile("FSM1011Mooreoveralp.vcd");
    $dumpvars;
end
initial begin
    #15 in=1'b0;
    #10 in=1'b1;
    #10 in=1'b0;
    #10 in=1'b1;
    #10 in=1'b1;
    #10 in=1'b0;
    #10 in=1'b1;
    #10 in=1'b1;
    #10 in=1'b1;
    #10 in=1'b0;
    #10 in=1'b1;
    #10 in=1'b1;
    #10 in=1'b0;
    #10 in=1'b0;
    #10 in=1'b0;
    #20 $finish;
end


endmodule