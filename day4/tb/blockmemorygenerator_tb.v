module blockmemgen_tb();
    reg clk;
    reg arst_a;
    reg wenb;
    reg [2:0] write_address;
    reg [2:0] read_address;
    reg [7:0] data_in;
    wire [7:0] data_out;

    blockmemogenmode dut (
        .clk(clk),
        .arst_a(arst_a),
        .wenb(wenb),
        .write_address(write_address),
        .read_address(read_address),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
       
        arst_a = 0;
        wenb = 0;
        write_address = 3'b000;
        read_address  = 3'b000;
        data_in = 8'h00;
       
        #10;
        arst_a = 1;
        #15;
        arst_a = 0;
       
        @(posedge clk);
        wenb = 1;
        write_address = 3'b010;
        data_in = 8'hA5;
       
        @(posedge clk);
        write_address = 3'b110;
        data_in = 8'h5C;
      
        @(posedge clk);
        wenb = 0;
      
        read_address = 3'b010;
        @(posedge clk);
       
        read_address = 3'b110;
        @(posedge clk);
        
        #20;
        $finish;
    end
endmodule
