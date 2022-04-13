module booth_top(
    input clk,nrst,
	input [63:0] A,
	input [63:0] B,
	output [127:0] P
);
wire [31:0] neg;
wire [31:0] zero;
wire [31:0] one;
wire [31:0] two;
reg [63:0] a,b;
wire [127:0] prod [31:0];
reg [127:0] prod_lay1 [31:0];
integer i;
always @ (posedge clk or negedge nrst)
begin
    if (!nrst)
    begin
        a<=0; b<=0;
        for(i=0;i<32;i=i+1) 
        begin
            prod_lay1[i]<=0;
        end
    end
    else
    begin
        a<=A;
        b<=B;
        for(i=0;i<32;i=i+1) 
        begin
            prod_lay1[i]<=prod[i];
        end
    end
end

genvar i1;
generate 
	for(i1=0; i1<32; i1=i1+1)begin
		if(i1==0)
			booth_enc u_booth_enc(
				.code ({b[1:0],1'b0}),
				.neg  (neg[i1]    ),
				.zero (zero[i1]   ),
				.one  (one[i1]	 ),
				.two  (two[i1]	 )
			);
		else
			booth_enc u_booth_enc(
				.code (b[i1*2+1:i1*2-1]),
				.neg  (neg[i1]    ),
				.zero (zero[i1]   ),
				.one  (one[i1]	 ),
				.two  (two[i1]	 )
			);
	end
endgenerate

generate
	for(i1=0; i1<32; i1=i1+1)begin
		gen_prod u_gen_prod (
			.A    ( a       ),
			.neg  ( neg[i1]  ),
			.zero ( zero[i1] ),
			.one  ( one[i1]  ),
			.two  ( two[i1]  ),
			.prod ( prod[i1] )
		);
	end
endgenerate

wallace_tree u_watree(
    .clk(clk),.nrst(nrst),
    .prod0(prod_lay1[0]),.prod1(prod_lay1[1]),.prod2(prod_lay1[2]),
    .prod3(prod_lay1[3]),.prod4(prod_lay1[4]),.prod5(prod_lay1[5]),
    .prod6(prod_lay1[6]),.prod7(prod_lay1[7]),.prod8(prod_lay1[8]),
    .prod9(prod_lay1[9]),.prod10(prod_lay1[10]),.prod11(prod_lay1[11]),
    .prod12(prod_lay1[12]),.prod13(prod_lay1[13]),.prod14(prod_lay1[14]),.prod15(prod_lay1[15]),
    .prod16(prod_lay1[16]),.prod17(prod_lay1[17]),.prod18(prod_lay1[18]),
    .prod19(prod_lay1[19]),.prod20(prod_lay1[20]),.prod21(prod_lay1[21]),
    .prod22(prod_lay1[22]),.prod23(prod_lay1[23]),.prod24(prod_lay1[24]),
    .prod25(prod_lay1[25]),.prod26(prod_lay1[26]),.prod27(prod_lay1[27]),
    .prod28(prod_lay1[28]),.prod29(prod_lay1[29]),.prod30(prod_lay1[30]),.prod31(prod_lay1[31]),
    .P(P)
);
endmodule
