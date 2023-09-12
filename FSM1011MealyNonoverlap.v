module FSM1011MealyNonoverlap(
    input clk,
    input in,
    input rst,
    output reg out
);
reg [2:0] state;
parameter s0=0,s1=1,s2=2,s3=3;
always @(posedge clk) begin
    if(rst)begin
      out<=0;
      state<=s0;
    end
    else begin
      case (state)
        s0:begin
          out<=0;
          state<=in?s1:s0;
        end 
        s1:begin
          out<=0;
          state<=in?s1:s2;
        end 
        s2:begin
          out<=0;
          state<=in?s3:s0;
        end 
        s3:begin
          out<=in?1:0;
          state<=in?s0:s2;
        end 
        default:begin
          out<=0;
          state<=s0;
        end 
      endcase
    end
    
end
endmodule