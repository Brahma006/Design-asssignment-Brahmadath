
module BCD_tb();

reg [3:0] A_tb, B_tb;
reg cin_tb;
wire [3:0] S_tb;
wire cout_tb;

BCD dut(A_tb, B_tb, cin_tb, S_tb, cout_tb);

initial
begin
    {A_tb, B_tb, cin_tb} = 0;
end

initial
begin
    A_tb = 4'b0000; B_tb = 4'b0000; cin_tb = 1'b0;
    #1;
    A_tb = 4'b0011; B_tb = 4'b0100; cin_tb = 1'b0;   // 3+4=7
    #1;
    A_tb = 4'b0101; B_tb = 4'b0110; cin_tb = 1'b0;   // 5+6=11
    #1;
    A_tb = 4'b1000; B_tb = 4'b0111; cin_tb = 1'b1;   // 8+7+1=16
    #1;
    A_tb = 4'b1001; B_tb = 4'b1001; cin_tb = 1'b0;   // 9+9=18
    #1;
    A_tb = 4'b1001; B_tb = 4'b1001; cin_tb = 1'b1;   // 9+9+1=19
    #1;
end

initial
begin
    $monitor("A_tb=%b B_tb=%b cin_tb=%b S_tb=%b cout_tb=%b",
              A_tb, B_tb, cin_tb, S_tb, cout_tb);
end

endmodule
