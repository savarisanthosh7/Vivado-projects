`timescale 1ns / 1ps
module three_bit_ripple_adder_tb;
    reg [2:0] A,B; reg Cin; wire [2:0] Sum; wire Cout;
    integer i,errors;
    three_bit_ripple_adder uut(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
    initial begin
        $dumpfile("three_bit_ripple_adder_tb.vcd"); $dumpvars(0,three_bit_ripple_adder_tb);
        errors=0;
        for(i=0;i<128;i=i+1) begin
            {A,B,Cin}=i[6:0]; #10;
            if({Cout,Sum} !== A+B+Cin) errors=errors+1;
        end
        if(errors==0) $display("PASS: three_bit_ripple_adder - all 128 vectors correct");
        else $display("FAIL: three_bit_ripple_adder - %0d errors",errors);
        $finish;
    end
endmodule
