//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
);

parameter CLK_PERIOD = 20;

reg clk;
wire red;
wire amber;
wire green;
reg err;
reg [2:0] prev;

initial begin
clk = 1'b0;
forever
#(CLK_PERIOD/2) clk =! clk;
end

initial begin
err = 0;
clk = 0;
prev = {red,amber,green};
#CLK_PERIOD;

forever begin
prev = {red,amber,green};
#CLK_PERIOD;

if((red==1'b0 && amber==1'b0 && green==1'b0) || (red==1'b1 && amber==1'b0 && green==1'b1) || (red==1'b0 && amber==1'b1 && green==1'b1) || (red==1'b1 && amber==1'b1 && green==1'b1))
begin
$display("***TEST FAILED! Fobidden State");
err = 1;
end

if(prev == {red,amber,green})
begin
$display("***TEST FAILED! State musn't equal next state");
err = 1;
end

end 
end

initial begin
        #50
        if (err == 0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

Traffic_Lights top(
.clk (clk),
.red (red),
.amber (amber),
.green (green)
);

endmodule







