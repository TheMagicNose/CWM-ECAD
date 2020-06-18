//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module Traffic_Lights(

input clk,
output reg red,
output reg amber,
output reg green

);

always@(posedge clk)
begin
if((red==1'b0 && amber==1'b0 && green==1'b0) || (red==1'b1 && amber==1'b0 && green==1'b1) || (red==1'b0 && amber==1'b1 && green==1'b1) || (red==1'b1 && amber==1'b1 && green==1'b1))
begin
red <= 1'b1;
amber <= 1'b0;
green <= 1'b0;
end

else 
if(red==1'b1 && amber==1'b0 && green==1'b0)
begin
red <= 1'b1;
amber <= 1'b1;
green <= 1'b0;
end

else 
if(red==1'b1 && amber==1'b1 && green==1'b0)
begin
red <= 1'b0;
amber <= 1'b0;
green <= 1'b1;
end

else 
if(red==1'b0 && amber==1'b0 && green==1'b1)
begin
red <= 1'b0;
amber <= 1'b1;
green <= 1'b0;
end

else 
begin
red <= 1'b1;
amber <= 1'b0;
green <= 1'b0;
end
end

endmodule




  
