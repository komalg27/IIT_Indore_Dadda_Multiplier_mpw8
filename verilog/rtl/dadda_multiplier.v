`timescale 1ns / 1ps

module dadda_multiplier(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

input [7:0] a,b,
input enable,
output [15:0]out
);
wire [7:0] p0,p1,p2,p3,p4,p5,p6,p7;
wire [3:0]s1, c1;
wire [1:0]s2,c2;
wire [7:0]s3, c3;
wire [5:0]s4, c4;
wire [9:0]s5, c5;
wire [11:0]s6, c6;
wire [13:0]s7,c7;

partial_product pp1(a[0],b,p0[0],p0[1],p0[2],p0[3],p0[4],p0[5],p0[6],p0[7]);
partial_product pp2(a[1],b,p1[0],p1[1],p1[2],p1[3],p1[4],p1[5],p1[6],p1[7]);
partial_product pp3(a[2],b,p2[0],p2[1],p2[2],p2[3],p2[4],p2[5],p2[6],p2[7]);
partial_product pp4(a[3],b,p3[0],p3[1],p3[2],p3[3],p3[4],p3[5],p3[6],p3[7]);
partial_product pp5(a[4],b,p4[0],p4[1],p4[2],p4[3],p4[4],p4[5],p4[6],p4[7]);
partial_product pp6(a[5],b,p5[0],p5[1],p5[2],p5[3],p5[4],p5[5],p5[6],p5[7]);
partial_product pp7(a[6],b,p6[0],p6[1],p6[2],p6[3],p6[4],p6[5],p6[6],p6[7]);
partial_product pp8(a[7],b,p7[0],p7[1],p7[2],p7[3],p7[4],p7[5],p7[6],p7[7]);
////Level 1............
//stage 1...
HA h1(p0[6],p1[5],s1[0],c1[0]);
FA f1(p0[7],p1[6],p2[5],s1[1],c1[1]);
FA f2(p1[7],p2[6],p3[5],s1[2],c1[2]);
FA f3(p2[7],p3[6],p4[5],s1[3],c1[3]);
//stage 2...
HA h2(p3[4],p4[3],s2[0],c2[0]);
HA h3(p4[4],p5[3],s2[1],c2[1]);
////Level 2............
//stage 1...
HA h4(p0[4],p1[3],s3[0],c3[0]);
FA f4(p0[5],p1[4],p2[3],s3[1],c3[1]);
FA f5(s1[0],p2[4],p3[3],s3[2],c3[2]);
FA f6(s1[1],c1[0],s2[0],s3[3],c3[3]);
FA f7(s1[2],c1[1],s2[1],s3[4],c3[4]);
FA f8(s1[3],c1[2],c2[1],s3[5],c3[5]);
FA f9(c1[3],p3[7],p4[6],s3[6],c3[6]);
FA f10(p4[7],p5[6],p6[5],s3[7],c3[7]);
//stage 2...
HA h5(p3[2],p4[1],s4[0],c4[0]);
FA f11(p4[2],p5[1],p6[0],s4[1],c4[1]);
FA f12(p5[2],p6[1],p7[0],s4[2],c4[2]);
FA f13(c2[0],p6[2],p7[1],s4[3],c4[3]);
FA f14(p5[4],p6[3],p7[2],s4[4],c4[4]);
FA f15(p5[5],p6[4],p7[3],s4[5],c4[5]);
////Level 3............
HA h6(p0[3],p1[2],s5[0],c5[0]);
FA f16(s3[0],p2[2],p3[1],s5[1],c5[1]);
FA f17(s3[1],c3[0],s4[0],s5[2],c5[2]);
FA f18(s3[2],c3[1],c4[0],s5[3],c5[3]);
FA f19(s3[3],c3[2],c4[1],s5[4],c5[4]);
FA f20(s3[4],c3[3],c4[2],s5[5],c5[5]);
FA f21(s3[5],c3[4],c4[3],s5[6],c5[6]);
FA f22(s3[6],c3[5],c4[4],s5[7],c5[7]);
FA f23(s3[7],c3[6],p7[4],s5[8],c5[8]);
FA f24(c3[7],p5[7],p6[6],s5[9],c5[9]);
////Level 4............
HA h7(p0[2],p1[1],s6[0],c6[0]);
FA f25(s5[0],p2[1],p3[0],s6[1],c6[1]);
FA f26(s5[1],c5[0],p4[0],s6[2],c6[2]);
FA f27(s5[2],c5[1],p5[0],s6[3],c6[3]);
FA f28(s5[3],c5[2],s4[1],s6[4],c6[4]);
FA f29(s5[4],c5[3],s4[2],s6[5],c6[5]);
FA f30(s5[5],c5[4],s4[3],s6[6],c6[6]);
FA f31(s5[6],c5[5],s4[4],s6[7],c6[7]);
FA f32(s5[7],c5[6],s4[5],s6[8],c6[8]);
FA f33(s5[8],c5[7],c4[5],s6[9],c6[9]);
FA f34(s5[9],c5[8],p7[5],s6[10],c6[10]);
FA f35(c5[9],p7[6],p6[7],s6[11],c6[11]);
////Level 5............
HA h8(p0[1],p1[0],s7[0],c7[0]);
FA f36(s6[0],p2[0],c7[0],s7[1],c7[1]);
FA f37(s6[1],c6[0],c7[1],s7[2],c7[2]);
FA f38(s6[2],c6[1],c7[2],s7[3],c7[3]);
FA f39(s6[3],c6[2],c7[3],s7[4],c7[4]);
FA f40(s6[4],c6[3],c7[4],s7[5],c7[5]);
FA f41(s6[5],c6[4],c7[5],s7[6],c7[6]);
FA f42(s6[6],c6[5],c7[6],s7[7],c7[7]);
FA f43(s6[7],c6[6],c7[7],s7[8],c7[8]);
FA f44(s6[8],c6[7],c7[8],s7[9],c7[9]);
FA f45(s6[9],c6[8],c7[9],s7[10],c7[10]);
FA f46(s6[10],c6[9],c7[10],s7[11],c7[11]);
FA f47(s6[11],c6[10],c7[11],s7[12],c7[12]);
FA f48(p7[7],c6[11],c7[12],s7[13],c7[13]);
always@(*)
begin
if(!enable)
out=16'd0;
else
out={c7[13],s7[13],s7[12],s7[11],s7[10],s7[9],s7[8],s7[7],s7[6],s7[5],s7[4],s7[3],s7[2],s7[1],s7[0],p0[0]};
end
endmodule

module FA(input a,b,c,
          output s,co
    );
assign s = a^b^c;
assign co = (a&b) | (b&c) | (c&a);

endmodule


module HA(
  input a,b,
  output sum,co
    );
assign sum = a^b;
assign co = a&b;
endmodule

module partial_product(a,b,p0,p1,p2,p3,p4,p5,p6,p7);

input [7:0] b;
input a;
output p0,p1,p2,p3,p4,p5,p6,p7;
assign p0 = b[0] & a;
assign p1 = b[1] & a;
assign p2 = b[2] & a;
assign p3 = b[3] & a;
assign p4 = b[4] & a;
assign p5 = b[5] & a;
assign p6 = b[6] & a;
assign p7 = b[7] & a;
endmodule

`default_nettype wire
