`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/12 08:48:16
// Design Name: 
// Module Name: man_cre
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


module man_cre(
    input clk,nrst,
    input [51:0] a,b,
    output  [51:0] pro,
    output reg manover
    );
    reg [51:0] reg_a,reg_b;
    wire [127:0]p1;
    reg [105:0] p2;
    reg [103:0] p3;
    wire [51:0]rou;
    wire [52:0] rou1;
    always @ (posedge clk or negedge nrst)
    begin
        if (!nrst)
        begin
            reg_a<=0;reg_b<=0;
            p2<=0;p3<=0;
            manover<=0;
        end
        else
        begin
            reg_a<=a; reg_b<=b;
            p2<=p1[105]?{p1[104:0],1'b0}:{p1[103:0],2'b0};
            p3<={rou1,51'b0};
            manover<=p1[105]?1:0;
            
        end
    end
    booth_top boo1(
    .clk(clk),
    .nrst(nrst),
    .A({11'b0,1'b1,reg_a[51:0]}),
    .B({11'b0,1'b1,reg_b[51:0]}),
    .P(p1)
    );

    round #(.width(106))r1
    (
    .a(p2),
    .b(rou1)
    );
    
    round #(.width(104))r2
    (
    .a(p3),
    .b(rou)
    );
assign pro=rou;
endmodule
