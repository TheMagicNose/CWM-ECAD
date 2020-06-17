//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
reg err;
reg clk;
reg direction;
reg enable;
reg rst;
wire [7:0] counter_out;
reg [7:0] counter_out_prev;


//Todo: Clock generation
 initial begin
    
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic

initial begin
err = 0;
enable = 0;
rst = 1;
clk = 0;
direction = 1;

#((CLK_PERIOD/2)+1)

forever begin 

#(CLK_PERIOD-((CLK_PERIOD/2)+1))

if (counter_out != counter_out_prev)
begin 
$display("***TEST FAILED! did not maintain 5 ticks gap!");
err = 1;
end

#((CLK_PERIOD/2)+1)
if ((enable&&(counter_out==counter_out_prev))|(!enable&&(counter_out!=counter_out_prev)))
begin
$display("***TEST FAILED! Enable is the wrong value");
err = 1;
end 


if ((direction&&(counter_out!=counter_out_prev+1))|(!direction&&(counter_out!=counter_out_prev-1)))
begin
$display("***TEST FAILED! Direction is wrong");
err = 1;
end 


if (rst&&(counter_out!=0))
begin
$display("***TEST FAILED! Reset isn't working");
err = 1;
end 

counter_out_prev = counter_out;

if (counter_out==8'b00000011)
direction = 0;

if ((direction==0) & (counter_out==8'b00000001))
rst = 1;

if (rst==1)
direction = 1;

if (counter_out==8'b00000000)
rst = 0;

if (enable==0)
enable = 1;

end

end





    
//Todo: Finish test, check for success
 initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

//Todo: Instantiate counter module

counter top(
.rst (rst),
.clk (clk),
.direction (direction),
.enable (enable),
.counter_out (counter_out));
 
endmodule 
