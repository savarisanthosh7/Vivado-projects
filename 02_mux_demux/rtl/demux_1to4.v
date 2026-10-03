`timescale 1ns / 1ps
module demux_1to4(input D,input S1,S0,output Y0,Y1,Y2,Y3);
    assign Y0=D&~S1&~S0;
    assign Y1=D&~S1&S0;
    assign Y2=D&S1&~S0;
    assign Y3=D&S1&S0;
endmodule
