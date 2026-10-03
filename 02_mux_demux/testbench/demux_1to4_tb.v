`timescale 1ns / 1ps
module demux_1to4_tb;
    reg D,S1,S0; wire Y0,Y1,Y2,Y3; reg [3:0] expected; integer i,errors;
    demux_1to4 uut(.D(D),.S1(S1),.S0(S0),.Y0(Y0),.Y1(Y1),.Y2(Y2),.Y3(Y3));
    initial begin
        $dumpfile("demux_1to4_tb.vcd"); $dumpvars(0,demux_1to4_tb); errors=0;
        for(i=0;i<8;i=i+1) begin
            {D,S1,S0}=i[2:0]; #10;
            expected=D ? (4'b0001 << {S1,S0}) : 4'b0000;
            if({Y3,Y2,Y1,Y0}!==expected) errors=errors+1;
        end
        if(errors==0) $display("PASS: demux_1to4 - all 8 vectors correct");
        else $display("FAIL: demux_1to4 - %0d errors",errors);
        $finish;
    end
endmodule
