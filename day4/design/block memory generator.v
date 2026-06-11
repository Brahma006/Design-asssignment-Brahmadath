`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 13:44:17
// Design Name: 
// Module Name: blockmemogenmode
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


module blockmemogenmode(
    input  wire        clk,
    input  wire        arst_a,           
    input  wire        wenb,            
    input  wire [2:0]  write_address,
    input  wire [2:0]  read_address,
    input  wire [7:0]  data_in,
    output reg  [7:0]  data_out
); 
    
    reg [7:0] mem [0:7];
 
    integer i;
 
    always @(posedge clk or posedge arst_a) begin
        if (arst_a) begin
            
            for (i = 0; i < 8; i = i + 1)
                mem[i] <= 8'h00;
        end
        else begin
            if (wenb)                          
                mem[write_address] <= data_in;
        end
    end

    always @(posedge clk or posedge arst_a) begin
        if (arst_a) begin
            data_out <= 8'h00;
        end
        else begin
            if (!wenb)                         
                data_out <= mem[read_address];
        end
    end
 
endmodule



