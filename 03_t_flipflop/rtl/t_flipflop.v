`timescale 1ns / 1ps
module t_flipflop(input T,input CLK,output reg Q,output Qbar);
    initial Q=1'b0;
    always @(posedge CLK) begin
        if(T) Q<=~Q;
        else Q<=Q;
    end
    assign Qbar=~Q;
endmodule
