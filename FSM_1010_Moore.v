`timescale 1ps/1ps
module FSM_1010(
   input clk,
   input rst,
   input in,
   output reg out
);
parameter s0=0,s1=1,s2=2,s3=3,s4=4;
reg[2:0] PS,NS;
/// RST Logic
always @(posedge clk) begin
  if(rst) begin
    out<=0;
    PS<=s0;
  end
  else PS<=NS;
end
///OUT + STATE
always @(PS,in) begin
    case(PS)
    s0:begin
      out<=0;
      NS=in?s1:s0;
    end
    s1:begin
      out<=0;
      NS=in?s1:s2;
    end
    s2:begin
      out<=0;
      NS=in?s3:s0;
    end
    s3:begin
      out<=0;
      NS=in?s1:s4;
    end
    s4:begin
      out<=1;
      NS=in?s3:s0;
    end
    endcase
end

endmodule