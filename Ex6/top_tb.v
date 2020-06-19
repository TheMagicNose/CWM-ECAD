//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
);

parameter CLK_PERIOD = 20;

reg clk;
reg sel;
reg rst;
wire [2:0] result;

reg err;
reg button;
reg [2:0] roll_prev;
wire [2:0] roll;

reg [2:0] lights_prev;
wire [2:0] lights;

initial begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk =! clk;
end

initial begin
rst=1;
sel=0;
button=1;
err=0;

forever begin 
#CLK_PERIOD;
 
if((sel == 0) & (result != roll_prev))
begin
$display("***TEST FAILED! Should be dice result");
err = 1;
end



 
if((sel == 1) & (result != lights_prev))
begin
$display("***TEST FAILED! Should be traffic lights result");
err = 1;
end

roll_prev=roll;
lights_prev=lights;

end
end

initial begin
        #50
        if (err == 0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

endmodule




