`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/06 09:49:45
// Design Name: 
// Module Name: DP_floating_multiplier_tb
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


module DP_floating_multiplier_tb(

    );
    reg clk,nrst;
    reg [63:0] a,b;
    wire [63:0] pro;
    wire [63:0] y;

    integer i;
    floating_point_0 GTmul( 
        .aclk(clk),             
        .s_axis_a_tdata(a),     
        .s_axis_b_tdata(b),       
        .s_axis_a_tvalid(1),          
        .s_axis_b_tvalid(1),                
        .m_axis_result_tdata(y)  
    );

    
    DP_floating_multiplier u_DP_floating_multiplier(
    .clk(clk),
    .nrst(nrst),
    .a(a),
    .b(b),
    .pro(pro)
    );
    initial
	   begin
	       clk=0;
	       nrst=0;
	       #5 nrst=1;
	   end
	always #5 clk=~clk;
	initial
	begin
	    #5;
	    a=64'h4029000000000000;
	    b=64'h4029000000000000;
	    #120;
        a = 64'h4000000010000100;//2.0000001192094032
        b = 64'h4000000010000100;//2.0000001192094032
       #120; 
       a = 64'h0000_0000_0000_0000;//0
       b = 64'h4018_0000_0000_0000;//6
       #120;
       a  = 64'h4018_0000_0000_0000;//6
       b  = 64'h4018_0000_0000_0000;//6
       #120 
       a  = 64'h400f_ffff_ffff_ffff;//3.9999999999999996
       b  = 64'h400f_ffff_ffff_ffff;//3.9999999999999996
       #120;
       a  = 64'h4001_0000_0000_0000;//2.125
       b  = 64'h4018_0000_0000_0000;//6
       #120;
       a  = 64'h4000_0000_0000_0001;//2.0000000000000004
       b  = 64'h4018_0000_0000_0000;//6
       #120;
       a  = 64'h7fe0_0000_0000_0000;//8.98846567431158e+307
       b  = 64'h4000_0000_0000_0000;//2
       #120;
       a  = 64'h0000_0000_0000_0001;//5e-324
       b  = 64'h0000_0000_0000_0001;//5e-324
       #120;
       for(i=0; i>-1; i=i+1) begin
            a = {$random, $random};
            b = {$random, $random};
            #120;
       end   
	end
endmodule
