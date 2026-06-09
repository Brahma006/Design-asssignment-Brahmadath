`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 20:57:03
// Design Name: 
// Module Name: URS
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


module URS(

    input  wire        clk,      
    input  wire        rst,      
    input  wire        sin,      
    input  wire [1:0]  pin,      
    input  wire        shift,    
    input  wire        load,     
    input  wire [1:0]  mod,     
    output wire        sout,     
    output wire [1:0]  pout     
);

  
    reg [1:0] reg_data;


    localparam SISO = 2'b00;
    localparam SIPO = 2'b01;
    localparam PISO = 2'b10;
    localparam PIPO = 2'b11;

  
    always @(posedge clk) begin
        if (rst) begin
            reg_data <= 2'b00;
        end
        else begin
            case (mod)

              
                SISO: begin
                    if (shift)
                        reg_data <= {reg_data[0], sin};
                end

              
                SIPO: begin
                    if (shift)
                        reg_data <= {reg_data[0], sin};
                end

                
                
                PISO: begin
                    if (load)
                        reg_data <= pin;
                    else if (shift)
                        reg_data <= {reg_data[0], 1'b0};
                end

                
                PIPO: begin
                    if (load)
                        reg_data <= pin;
                end

                default: reg_data <= reg_data;

            endcase
        end
    end

 
    assign sout = reg_data[1];   
    assign pout = reg_data;     

endmodule



