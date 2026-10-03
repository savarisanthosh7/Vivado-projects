`timescale 1ns / 1ps
module vending_machine(
    input clk,reset,coin5,coin10,cancel,item_available,
    output reg dispense,change5,refund5
);
    localparam [2:0] S0=3'b000,S5=3'b001,DISPENSE=3'b010,DISPENSE_CHG=3'b011,REFUND=3'b100;
    reg [2:0] state,next_state;
    always @(posedge clk or posedge reset) begin
        if(reset) state<=S0; else state<=next_state;
    end
    always @(*) begin
        next_state=state;
        case(state)
            S0: if(item_available) begin
                if(coin5) next_state=S5;
                else if(coin10) next_state=DISPENSE;
            end
            S5: begin
                if(cancel) next_state=REFUND;
                else if(coin5) next_state=DISPENSE;
                else if(coin10) next_state=DISPENSE_CHG;
            end
            DISPENSE,DISPENSE_CHG,REFUND: next_state=S0;
            default: next_state=S0;
        endcase
    end
    always @(*) begin
        dispense=0;change5=0;refund5=0;
        case(state)
            DISPENSE: dispense=1;
            DISPENSE_CHG: begin dispense=1;change5=1; end
            REFUND: refund5=1;
            default: ;
        endcase
    end
endmodule
