//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module muxb(

input rst,
input clk,
input button,
input sel,
output wire [2:0] result
);

wire [2:0] roll;
wire [2:0] lights;

Dice Dice_out(rst,clk,button,roll);

Traffic_lights Traffic_Lights_out(clk,lights[2],lights[1],lights[0]);

Multiplexer Mulitiplexer_outcome(clk,sel,result,roll,lights);

endmodule











