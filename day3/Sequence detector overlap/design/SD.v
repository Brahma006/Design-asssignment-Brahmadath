`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:16:27
// Design Name: 
// Module Name: seqdetwoverlap
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



module seqdetwoverlap(input clk,rst,din ,output reg detected);
parameter idle=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
reg [1:0] ps,ns;

always @(posedge clk)
begin
if(rst)
ps<=idle;
else
ps<=ns;
end

always @(*)
begin
case(ps)
idle: 
 begin
detected=0;
 if(din==0)
 ns=idle;
 else
 ns=s1;
 end
 
 s1: begin
 if(din==0)
 ns=idle;
 else
 ns=s2;
 end
 s2: begin
if(din==0)
ns=idle;
else
ns=s3; 
 end
 s3: begin
 if(din==0) begin
 ns=idle;
 detected=1;
 end
 else
 ns=s1;
 end
 endcase
end
endmodule
 
