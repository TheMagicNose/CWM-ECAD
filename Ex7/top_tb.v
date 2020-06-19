//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
);

parameter CLK_PERIOD = 20;

reg clk;
reg err;
reg enable;
reg [2:0] a;
reg [2:0] b;
reg [5:0] result_prev;
wire [5:0] result;

initial begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk =! clk;
end

initial begin
err=0;
enable=1;
a=0;
b=0;
#CLK_PERIOD result_prev=result;

forever begin
#CLK_PERIOD

if((enable == 0) & (result != result_prev))
begin
$display("***TEST FAILED! Enable not working");
err = 1;
end

if((enable == 1) & (result != a * b))
begin
$display("***TEST FAILED! Times table not working");
err = 1;
end

end






