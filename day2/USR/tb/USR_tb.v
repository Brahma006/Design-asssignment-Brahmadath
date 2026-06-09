`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 21:06:57
// Design Name: 
// Module Name: URS_tb
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

module URS_tb;

    
    reg clk;
    reg rst;
    reg sin;
    reg [1:0] pin;
    reg shift;
    reg load;
    reg [1:0] mod;

    
    wire sout;
    wire [1:0] pout;

   
    URS dut (
        .clk(clk),
        .rst(rst),
        .sin(sin),
        .pin(pin),
        .shift(shift),
        .load(load),
        .mod(mod),
        .sout(sout),
        .pout(pout)
    );

    
    localparam SISO = 2'b00;
    localparam SIPO = 2'b01;
    localparam PISO = 2'b10;
    localparam PIPO = 2'b11;

    always begin
        #10 clk = ~clk;
    end

    
    initial 
    begin
     
        clk = 0;
        rst = 1;
        sin = 0;
        pin = 2'b00;
        shift = 0;
        load = 0;
        mod = 2'b00;
        
        
        #40;
        @(negedge clk);
        rst = 0;              
     
        mod = PIPO;
        pin = 2'b10;  
        load = 1;     
        @(negedge clk);
        load = 0;    
        #20;               
        
        rst = 1;
        @(negedge clk);
        rst = 0;      
        #10;

       
        mod = SIPO;
        shift = 1;        
       
        sin = 1;      
        @(negedge clk); 
        
        
        sin = 0;      
        @(negedge clk);
        
        shift = 0;    
        #20;         
    
        mod = PISO;
        pin = 2'b11;  
        load = 1;
        @(negedge clk);
        load = 0;     
        
        shift = 1;    
        @(negedge clk);
        @(negedge clk); 
        shift = 0;
        #20;

       
        mod = SISO;
        shift = 1;
        
        sin = 1; @(negedge clk); 
        sin = 1; @(negedge clk); 
        sin = 0; @(negedge clk);
        
        shift = 0;
        
        #40;
        $finish;      
    end

endmodule





  



