`timescale 1ps/1ps
`include "FSM101Moore.v"
module FSM101Mooretb();
reg in,rst,clk;
wire out;
FSM101Moore DUT(
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
    #5 clk=!clk;
end
initial begin
    $monitor("%t,in=%b,PS=%b,out=%b",$time,in,DUT.PS,out);
    $dumpfile("FSM101Moore.vcd");
    $dumpvars;
end
initial begin
    #15 in=1'b0;
    #10 in=1'b0;
    #10 in=1'b1;
    #10 in=1'b0;
    #10 in=1'b1;
    #10 in=1'b0;
    #10 in=1'b1;
    #10 in=1'b0;
    #20 $finish;
end
endmodule