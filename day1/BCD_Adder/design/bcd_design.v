module BCD(input [3:0]A,[3:0]B,cin,output [3:0]S,cout);
wire [3:0]w;
wire w5,w6,w7,w8;
ripplecarry R1(A,B,cin,w,w5);
and(w6,w[3],w[2]);
and(w7,w[3],w[1]);
or(w8,w5,w6,w7);

ripplecarry R2(w,{1'b0,w8,w8,1'b0},1'b0,S,cout);


endmodule
