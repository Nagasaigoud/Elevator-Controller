`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:13 08/14/2021
// Design Name:   Elevator
// Module Name:   E:/Placements/Project/Elevator/Elevator/tb_elevator.v
// Project Name:  Elevator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Elevator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_elevator;

	// Inputs
	reg clk;
	reg rst;
	reg inG;
	reg in1;
	reg in2;
	reg in3;
	reg in4;
	reg in5;
	reg in6;
	reg in7;
	reg inopen;
	reg inclose;

	// Outputs
	wire open;
	wire close;
	wire up;
	wire down;

	parameter period = 10;
	reg [7:0] ins;
	// Instantiate the Unit Under Test (UUT)
	Elevator DUT (
		.clk(clk), 
		.rst(rst), 
		.inG(inG), 
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.in4(in4), 
		.in5(in5), 
		.in6(in6), 
		.in7(in7), 
		.inopen(inopen), 
		.inclose(inclose), 
		.open(open), 
		.close(close), 
		.up(up), 
		.down(down)
	);

	initial begin
		// Initialize Inputs
		clk = 1'b1;
		inG = 0;
		in1 = 0;
		in2 = 0;
		in3 = 0;
		in4 = 0;
		in5 = 0;
		in6 = 0;
		in7 = 0;
		inopen = 0;
		inclose = 0;

	end
	always #(period/2) clk=~clk;
	initial begin
		rst = 1'b1;
		#period rst = ~rst;
		#period rst = ~rst;
	end
	
	initial begin
//reg temp;
		#30 ins=$random;
		//$display("inputs:%b , ins random: %b",{inG,in1,in2,in3,in4,in5,in6,in7},ins);
		{inG,in1,in2,in3,in4,in5,in6,in7}=ins;
		repeat(3)
		intest;
		wait(!{inG,in1,in2,in3,in4,in5,in6,in7})
		#100 $finish;
	end

//record
	initial begin
	$monitor("next_floor : %d , present_floor:%d , inputs(g,1,2,3,4,5,6,7) : %b",DUT.nfloor,DUT.pfloor,{inG,in1,in2,in3,in4,in5,in6,in7});
	end

	task intest; begin
		ins=$random;
		ins=(ins|{inG,in1,in2,in3,in4,in5,in6,in7});
		{inG,in1,in2,in3,in4,in5,in6,in7}=ins;
	end endtask

endmodule
	

