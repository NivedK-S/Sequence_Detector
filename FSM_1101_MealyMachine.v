`timescale 1ps/1ps
module FSM1101(
    input clk,
    input rst,
    input in,
    output reg out
);
parameter S0 =0,
          S1=1,
          S2=2,
          S3=3 ;
reg [1:0] state;
always @(posedge clk) begin
    if(rst)
        begin
            out<=0;
            state<=0;
        end
    else
        begin
            case(state)
            S0:begin
                state<=in?S1:S0;
                out<=0;
               end
            S1:begin
                state<=in?S2:S0;
                out<=0;
                end
            S2:begin
                state<=in?S2:S3;
                out<=0;
               end
            S3:begin
                state<=S0;
                out<=in?1:0;
               end
            default:begin
                    state<=S0;
                    out<=0;
                   end
            endcase
        end
end




endmodule