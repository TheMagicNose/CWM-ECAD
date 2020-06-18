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

initial begin

clk = 1'b0;
forever
#(CLK_PERIOD/2) clk =! clk;
end

initial begin

rst = 1;
button = 1;
err = 0;
#CLK_PERIOD rst = 0;
clk=0;

forever begin

#CLK_PERIOD if (rst&(throw != 0))
begin
$display("***TEST FAILED! Reset not working");
err = 1;
end

if((throw == 0) | (throw == 3'b111) & (rst!=0))
begin
$display("***TEST FAILED! Impossible without reset");
err = 1;
end

else

begin
if(throw_prev != 3'b110)

begin
if((button&(throw != throw_prev+1)) | (!button&(throw != throw_prev)))
begin
$display("***TEST FAILED! Button not working");
err = 1;
end
end

else

begin
if((button&(throw != 3'b001)) | (!button&(throw != throw_prev)))
begin
$display("***TEST FAILED! Button not working");
err = 1;
end
end
end

throw_prev = throw;
button= !button;

end 
end

initial begin
        #CLK PERIOD 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

dice top(
.clk (clk)
.rst (rst)
.button (button)
.throw (throw)
);

end module


 



