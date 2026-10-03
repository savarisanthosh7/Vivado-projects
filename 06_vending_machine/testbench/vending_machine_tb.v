`timescale 1ns / 1ps
module vending_machine_tb;
    reg clk,reset,coin5,coin10,cancel,item_available;
    wire dispense,change5,refund5; integer errors;
    vending_machine uut(.clk(clk),.reset(reset),.coin5(coin5),.coin10(coin10),.cancel(cancel),.item_available(item_available),.dispense(dispense),.change5(change5),.refund5(refund5));
    always #5 clk=~clk;
    task insert5; begin @(negedge clk) coin5=1; @(negedge clk) coin5=0; end endtask
    task insert10; begin @(negedge clk) coin10=1; @(negedge clk) coin10=0; end endtask
    task do_cancel; begin @(negedge clk) cancel=1; @(negedge clk) cancel=0; end endtask
    task expect_out(input d,input c,input r,input [159:0] label);
        begin if(dispense!==d || change5!==c || refund5!==r) begin
            $display("FAIL [%0s]: dispense=%b change5=%b refund5=%b",label,dispense,change5,refund5); errors=errors+1;
        end end
    endtask
    initial begin
        $dumpfile("vending_machine_tb.vcd"); $dumpvars(0,vending_machine_tb);
        clk=0;reset=1;coin5=0;coin10=0;cancel=0;item_available=1;errors=0;#12 reset=0;
        insert10;expect_out(1,0,0,"Rs10 -> dispense");@(negedge clk);
        insert5;expect_out(0,0,0,"Rs5 waits");insert5;expect_out(1,0,0,"Rs5+Rs5 -> dispense");@(negedge clk);
        insert5;insert10;expect_out(1,1,0,"Rs5+Rs10 -> dispense+change");@(negedge clk);
        insert5;do_cancel;expect_out(0,0,1,"cancel -> refund");@(negedge clk);
        item_available=0;insert10;expect_out(0,0,0,"unavailable -> no dispense");
        if(errors==0) $display("PASS: vending_machine - all scenarios passed"); else $display("FAIL: vending_machine - %0d errors",errors);
        $finish;
    end
endmodule
