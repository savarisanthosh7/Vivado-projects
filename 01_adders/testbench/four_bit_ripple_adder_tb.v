`timescale 1ns / 1ps
module four_bit_ripple_adder_tb;
    reg [3:0] A,B; reg Cin; wire [3:0] Sum; wire Cout;
    integer i,errors;
    four_bit_ripple_adder uut(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
    initial begin
        $dumpfile("four_bit_ripple_adder_tb.vcd"); $dumpvars(0,four_bit_ripple_adder_tb);
        errors=0;
        for(i=0;i<512;i=i+1) begin
            {A,B,Cin}=i[8:0]; #10;
            if({Cout,Sum} !== A+B+Cin) errors=errors+1;
        end
        if(errors==0) $display("PASS: four_bit_ripple_adder - all 512 vectors correct");
        else $display("FAIL: four_bit_ripple_adder - %0d errors",errors);
        $finish;
    end
endmodule
