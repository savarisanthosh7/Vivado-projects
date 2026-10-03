`timescale 1ns / 1ps
module tb_moore_1011;
    reg clk,reset,x; wire y; reg [3:0] hist; reg y_ref;
    integer errors,detections,k;
    moore_1011 uut(.clk(clk),.reset(reset),.x(x),.y(y));
    always #5 clk=~clk;
    always @(posedge clk or posedge reset) begin
        if(reset) begin hist<=4'b0000; y_ref<=1'b0; end
        else begin hist<={hist[2:0],x}; y_ref<=({hist[2:0],x}==4'b1011); end
    end
    always @(negedge clk) if(!reset) begin
        if(y!==y_ref) begin $display("FAIL @%0t: history=%b y=%b expected=%b",$time,hist,y,y_ref); errors=errors+1; end
        if(y) detections=detections+1;
    end
    task send(input b); begin @(posedge clk); #1 x=b; end endtask
    initial begin
        $dumpfile("tb_moore_1011.vcd"); $dumpvars(0,tb_moore_1011);
        clk=0;reset=1;x=0;errors=0;detections=0; #12 reset=0;
        send(1);send(0);send(1);send(1);send(0);send(1);send(1);
        send(0);send(0);send(1);send(0);
        for(k=0;k<200;k=k+1) send($random);
        send(0);send(0);#20;
        if(errors==0) $display("PASS: moore_1011 - %0d detections, no mismatches",detections);
        else $display("FAIL: moore_1011 - %0d errors",errors);
        $finish;
    end
endmodule
