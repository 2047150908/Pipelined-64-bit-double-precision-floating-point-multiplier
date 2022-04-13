`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/08 11:43:54
// Design Name: 
// Module Name: round
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


module round#(parameter width=128)
(
    input [width-1:0]a,
    output [(width>>1)-1:0]b
    );
    assign b=((a[(width>>1)-1:0])<(1<<((width>>1)-1)))?a[width-1:(width>>1)]:
             ((a[(width>>1)-1:0])>(1<<((width>>1)-1)))?a[width-1:(width>>1)]+1:
             (a[(width>>1)])?(a[width-1:(width>>1)]+1):a[width-1:(width>>1)];

endmodule
