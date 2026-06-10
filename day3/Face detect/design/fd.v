`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 16:39:57
// Design Name: 
// Module Name: facedetect
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


module facedetect(input clk,input [7:0]s_in ,output reg [7:0]s_out);
always @(posedge clk)
s_out<=s_in;
endmodule



