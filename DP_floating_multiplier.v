`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/05 16:04:24
// Design Name: 
// Module Name: DP_floating_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DP_floating_multiplier(
    input clk,nrst,
    input [63:0] a,b,
    output reg[63:0] pro
    );
    reg [63:0] reg_a,reg_b;
    wire symbol;
    reg [10:0] order;
    reg [1:0] flag; //flag为1正常，为0下溢，为2上溢
    wire [51:0] man;
    wire manover;
    always @ (posedge clk or negedge nrst)
    begin
        if (!nrst)
        begin
            reg_a<=0; reg_b<=0;
            pro<=0; order<=0; 
        end
        else
        begin
            reg_a<=a; reg_b<=b;
            
            if(reg_a==0||reg_b==0) pro<=0;
            else if (flag==2) pro<=64'h7FF0000000000000;

            else pro<={symbol,order,man};
        end
    end
    assign symbol=reg_a[63]^reg_b[63];

    man_cre u_man_cre(.clk(clk),.nrst(nrst),.a(reg_a[51:0]),.b(reg_b[51:0]),.pro(man),.manover(manover));
    always @*
    begin
        flag<=(reg_a[62:52]+reg_b[62:52]-11'd1023>=11'd2047)?2:(reg_a[62:52]+reg_b[62:52]+1<11'd1023)?0:
              ((reg_a[62:52]+reg_b[62:52]+2>11'd1023)&&(reg_a[62:52]+reg_b[62:52]<11'd1023)&&manover)?1:1;
        case (flag)
             0: order<=0;
             1: order<=reg_a[62:52]+reg_b[62:52]-11'd1023+manover;
             2: order<=11'd2047;
        endcase
    end
     
endmodule

