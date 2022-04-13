module compress4_2 #(width=128) (
  input  [width - 1 : 0]  a,
  input  [width - 1 : 0]  b,
  input  [width - 1 : 0]  c,
  input  [width - 1 : 0]  d,
  input  [width - 1 : 0]  cin,
  output [width - 1 : 0]  sum,
  output [width - 1 : 0]  carry,
  output [width - 1 : 0]  cout
);
    assign sum=a^b^c^d^cin;
    assign carry=((a^b^c^d)&cin) | (~(a^b^c^d)&d);
    assign cout=((a^b)&c) | (~(a^b)&a);
    
endmodule
