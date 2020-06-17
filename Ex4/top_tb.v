//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
timescale 1ns / 100ps

module top_tb(
);

parameter CLK_PERIOD = 10;

reg clk;
reg button;
reg rst;
reg err;
wire [2:0] throw;
reg [2:0] throw_prev;

initial
begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk!=clk;
end

initial 
begin
rst = 0;
button = 1;
err = 1;
#CLK_PERIOD rst = 0;
clk=0;

forever begin

#CLK_PERIOD if (rst&(throw!=0))
begin
$display("***TEST FAILED! Reset not working");
err = 1;
end 



