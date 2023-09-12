`timescale 1ps/1ps
`include "FSM1011MealyNonoverlap.v"
module FSM1011MealyNonoverlaptb();
reg clk,in,rst;
wire out;
FSM1011MealyNonoverlap DUT(
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
    $monitor("%t,rst=%b,in=%b,state=%b,out=%b",$time,rst,in,DUT.state,out);
    $dumpfile("FSM1011MealyNonoverlap.vcd");
    $dumpvars;
end
initial begin
    #15 in=1'b0;
    #10 in=1'b0;
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