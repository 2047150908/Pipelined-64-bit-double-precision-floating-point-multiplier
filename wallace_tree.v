module wallace_tree (
    input clk,nrst,
	input [127:0] prod0,prod1,prod2,prod3,prod4,prod5,prod6,prod7,
	              prod8,prod9,prod10,prod11,prod12,prod13,prod14,prod15,
	              prod16,prod17,prod18,prod19,prod20,prod21,prod22,prod23,
	              prod24,prod25,prod26,prod27,prod28,prod29,prod30,prod31,
    output reg[127:0] P
);

wire [127:0] s_lev01;
wire [127:0] c_lev01;
wire [127:0] s_lev02;
wire [127:0] c_lev02;
wire [127:0] s_lev03;
wire [127:0] c_lev03;
wire [127:0] s_lev04;
wire [127:0] c_lev04;
wire [127:0] s_lev05;
wire [127:0] c_lev05;
wire [127:0] s_lev06;
wire [127:0] c_lev06;
wire [127:0] s_lev07;
wire [127:0] c_lev07;
wire [127:0] s_lev08;
wire [127:0] c_lev08;
reg [127:0] s_lev01_lay1;
reg [127:0] c_lev01_lay1;
reg [127:0] s_lev02_lay1;
reg [127:0] c_lev02_lay1;
reg [127:0] s_lev03_lay1;
reg [127:0] c_lev03_lay1;
reg [127:0] s_lev04_lay1;
reg [127:0] c_lev04_lay1;
reg [127:0] s_lev05_lay1;
reg [127:0] c_lev05_lay1;
reg [127:0] s_lev06_lay1;
reg [127:0] c_lev06_lay1;
reg [127:0] s_lev07_lay1;
reg [127:0] c_lev07_lay1;
reg [127:0] s_lev08_lay1;
reg [127:0] c_lev08_lay1;

wire [127:0] s_lev11;
wire [127:0] c_lev11;
wire [127:0] s_lev12;
wire [127:0] c_lev12;
wire [127:0] s_lev13;
wire [127:0] c_lev13;
wire [127:0] s_lev14;
wire [127:0] c_lev14;
reg [127:0] s_lev11_lay2;
reg [127:0] c_lev11_lay2;
reg [127:0] s_lev12_lay2;
reg [127:0] c_lev12_lay2;
reg [127:0] s_lev13_lay2;
reg [127:0] c_lev13_lay2;
reg [127:0] s_lev14_lay2;
reg [127:0] c_lev14_lay2;

wire [127:0] s_lev21;
wire [127:0] c_lev21;
wire [127:0] s_lev22;
wire [127:0] c_lev22;
reg [127:0] s_lev21_lay3;
reg [127:0] c_lev21_lay3;
reg [127:0] s_lev22_lay3;
reg [127:0] c_lev22_lay3;

wire [127:0] s_lev31;
wire [127:0] c_lev31;
reg [127:0] s_lev31_lay4;
reg [127:0] c_lev31_lay4;

wire [127:0] cout_lev01,cout_lev02,cout_lev03,cout_lev04,cout_lev05,cout_lev06,cout_lev07,cout_lev08,
            cout_lev11,cout_lev12,cout_lev13,cout_lev14,cout_lev21,cout_lev22,cout_lev31;
reg cout;
always @ (posedge clk or negedge nrst)
begin
    if (!nrst)
    begin
       //s_lev01<=0;c_lev01<=0;s_lev02<=0;c_lev02<=0;s_lev03<=0;c_lev03<=0;s_lev04<=0;c_lev04<=0;
       //s_lev05<=0;c_lev05<=0;s_lev06<=0;c_lev06<=0;s_lev07<=0;c_lev07<=0;s_lev08<=0;c_lev08<=0;
       s_lev01_lay1<=0;c_lev01_lay1<=0;s_lev02_lay1<=0;c_lev02_lay1<=0;s_lev03_lay1<=0;c_lev03_lay1<=0;s_lev04_lay1<=0;c_lev04_lay1<=0;
       s_lev05_lay1<=0;c_lev05_lay1<=0;s_lev06_lay1<=0;c_lev06_lay1<=0;s_lev07_lay1<=0;c_lev07_lay1<=0;s_lev08_lay1<=0;c_lev08_lay1<=0;
       
       //s_lev11<=0;c_lev11<=0;s_lev12<=0;c_lev12<=0;s_lev13<=0;c_lev13<=0;s_lev14<=0;c_lev14<=0;
       s_lev11_lay2<=0;c_lev11_lay2<=0;s_lev12_lay2<=0;c_lev12_lay2<=0;s_lev13_lay2<=0;c_lev13_lay2<=0;s_lev14_lay2<=0;c_lev14_lay2<=0;
       
       //s_lev21<=0;c_lev21<=0;s_lev22<=0;c_lev22<=0;
       s_lev21_lay3<=0;c_lev21_lay3<=0;s_lev22_lay3<=0;c_lev22_lay3<=0;
       
       //s_lev31<=0;c_lev31<=0;
       s_lev31_lay4<=0;c_lev31_lay4<=0;
       
       P<=0;cout<=0;
    end                                                                 
    else                                                                
    begin                                                               
        s_lev01_lay1<=s_lev01;c_lev01_lay1<=c_lev01;s_lev02_lay1<=s_lev02;c_lev02_lay1<=c_lev02;s_lev03_lay1<=s_lev03;c_lev03_lay1<=c_lev03;s_lev04_lay1<=s_lev04;c_lev04_lay1<=c_lev04;
        s_lev05_lay1<=s_lev05;c_lev05_lay1<=c_lev05;s_lev06_lay1<=s_lev06;c_lev06_lay1<=c_lev06;s_lev07_lay1<=s_lev07;c_lev07_lay1<=c_lev07;s_lev08_lay1<=s_lev08;c_lev08_lay1<=c_lev08;        
        s_lev11_lay2<=s_lev11;c_lev11_lay2<=c_lev11;s_lev12_lay2<=s_lev12;c_lev12_lay2<=c_lev12;s_lev13_lay2<=s_lev13;c_lev13_lay2<=c_lev13;s_lev14_lay2<=s_lev14;c_lev14_lay2<=c_lev14;   
        s_lev21_lay3<=s_lev21;c_lev21_lay3<=c_lev21;s_lev22_lay3<=s_lev22;c_lev22_lay3<=c_lev22;          
        s_lev31_lay4<=s_lev31;c_lev31_lay4<=c_lev31;       
        //adder
        {cout,P}<=s_lev31_lay4+((c_lev31_lay4)<<1);                                        
    end                                                                 
end                                                                     
//level 0
compress4_2 #(128) compress4_2_lev01(                                   
	.a( prod0      ),                                                   
	.b( prod1 << 2 ),                                                   
	.c( prod2 << 4 ),                                                   
	.d(	prod3 << 6 ),                                                   
	.cin({cout_lev01[126:0],1'b0}),                                     
	.sum  ( s_lev01      ),                                             
	.cout (cout_lev01	 ),
	.carry( c_lev01      )                                              
);                                                                      
                                                                      
compress4_2 #(128) compress4_2_lev02(                                   
	.a( prod4 << 8  ),                                                  
	.b( prod5 << 10 ),                                                  
	.c( prod6 << 12 ),                                                  
	.d(	prod7 << 14 ),                                                  
	.cin({cout_lev02[126:0],1'b0}),
	.sum	( s_lev02      ),                                           
	.cout (cout_lev02	 ),                                             
	.carry	( c_lev02      )                                            
);                                                                      

compress4_2 #(128) compress4_2_lev03(                                   
	.a( prod8 <<  16  ),                                                
	.b( prod9 <<  18  ),
	.c( prod10 << 20  ),
	.d(	prod11 << 22  ),
	.cin({cout_lev03[126:0],1'b0}),
	.sum  ( s_lev03      ),
	.cout (cout_lev03	 ),
	.carry( c_lev03      )
);

compress4_2 #(128) compress4_2_lev04(
	.a( prod12 << 24   ),
	.b( prod13 << 26   ),
	.c( prod14 << 28   ),
	.d(	prod15 << 30   ),
	.cin({cout_lev04[126:0],1'b0}),
	.sum  ( s_lev04      ),
	.cout (cout_lev04	 ),
	.carry( c_lev04      )
);

compress4_2 #(128) compress4_2_lev05(
	.a( prod16<<32      ),
	.b( prod17 << 34 ),
	.c( prod18 << 36 ),
	.d(	prod19 << 38 ),
	.cin({cout_lev05[126:0],1'b0}),
	.sum  ( s_lev05      ),
	.cout (cout_lev05	 ),
	.carry( c_lev05      )
);

compress4_2 #(128) compress4_2_lev06(
	.a( prod20<<40      ),
	.b( prod21 << 42 ),
	.c( prod22 << 44 ),
	.d(	prod23 << 46 ),
	.cin({cout_lev06[126:0],1'b0}),
	.sum  ( s_lev06      ),
	.cout (cout_lev06	 ),
	.carry( c_lev06      )
);

compress4_2 #(128) compress4_2_lev07(
	.a( prod24<<48      ),
	.b( prod25 << 50 ),
	.c( prod26 << 52 ),
	.d(	prod27 << 54 ),
	.cin({cout_lev07[126:0],1'b0}),
	.sum  ( s_lev07      ),
	.cout (cout_lev07	 ),
	.carry( c_lev07      )
);

compress4_2 #(128) compress4_2_lev08(
	.a( prod28<<56      ),
	.b( prod29 << 58 ),
	.c( prod30 << 60 ),
	.d(	prod31 << 62 ),
	.cin({cout_lev08[126:0],1'b0}),
	.sum  ( s_lev08      ),
	.cout (cout_lev08	 ),
	.carry( c_lev08      )
);
//level 1
compress4_2 #(128) compress4_2_lev11(
	.a( s_lev01_lay1       ),
	.b( c_lev01_lay1 <<1	  ),
	.c( s_lev02_lay1 	  ),
	.d(	c_lev02_lay1 <<1	  ),
	.cin({cout_lev11[126:0],1'b0}),
	.sum  ( s_lev11      ),
	.cout (cout_lev11	 ),
	.carry( c_lev11      )
);

compress4_2 #(128) compress4_2_lev12(
	.a( s_lev03_lay1       ),
	.b( c_lev03_lay1 <<1	  ),
	.c( s_lev04_lay1 	  ),
	.d(	c_lev04_lay1 <<1	  ),
	.cin({cout_lev12[126:0],1'b0}),
	.sum  ( s_lev12      ),
	.cout (cout_lev12	 ),
	.carry( c_lev12      )
);

compress4_2 #(128) compress4_2_lev13(
	.a( s_lev05_lay1       ),
	.b( c_lev05_lay1 <<1	  ),
	.c( s_lev06_lay1 	  ),
	.d(	c_lev06_lay1 <<1	  ),
	.cin({cout_lev13[126:0],1'b0}),
	.sum  ( s_lev13      ),
	.cout (cout_lev13	 ),
	.carry( c_lev13      )
);

compress4_2 #(128) compress4_2_lev14(
	.a( s_lev07_lay1       ),
	.b( c_lev07_lay1 <<1	  ),
	.c( s_lev08_lay1 	  ),
	.d(	c_lev08_lay1 <<1	  ),
	.cin({cout_lev14[126:0],1'b0}),
	.sum  ( s_lev14      ),
	.cout (cout_lev14	 ),
	.carry( c_lev14      )
);
//level 2
compress4_2 #(128) compress4_2_lev21(
	.a( s_lev11_lay2       ),
	.b( c_lev11_lay2 <<1	  ),
	.c( s_lev12_lay2 	  ),
	.d(	c_lev12_lay2 <<1	  ),
	.cin({cout_lev21[126:0],1'b0}),
	.sum  ( s_lev21      ),
	.cout (cout_lev21	 ),
	.carry( c_lev21      )
);

compress4_2 #(128) compress4_2_lev22(
	.a( s_lev13_lay2       ),
	.b( c_lev13_lay2 <<1	  ),
	.c( s_lev14_lay2 	  ),
	.d(	c_lev14_lay2 <<1	  ),
	.cin({cout_lev22[126:0],1'b0}),
	.sum  ( s_lev22      ),
	.cout (cout_lev22	 ),
	.carry( c_lev22      )
);

//level 3
compress4_2 #(128) compress4_2_lev31(
	.a( s_lev21_lay3       ),
	.b( c_lev21_lay3 <<1	  ),
	.c( s_lev22_lay3 	  ),
	.d(	c_lev22_lay3 <<1	  ),
	.cin({cout_lev31[126:0],1'b0}),
	.sum  ( s_lev31      ),
	.cout (cout_lev31	 ),
	.carry( c_lev31      )
);


endmodule
