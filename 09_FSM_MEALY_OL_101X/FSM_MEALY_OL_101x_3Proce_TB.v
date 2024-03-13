`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Author       : PABBULETI VENU
// ID           : N180116
// Branch       : ECE
// Project Name : IMPLEMENTATION OF FINITTE STATE MACHINES USING VERILOG
// Design Name  : SEQUENCE DETECTOR 101X USING MEALY MACHINE(OVERLAPPING) 
// Module Name  : mealy_101X_seq_det_over_tb
// RGUKT NUZVID 
//////////////////////////////////////////////////////////////////////////////////


module mealy_101X_seq_det_over_tb ();
// Signal Declarations
reg Clk,Rst,In; 
wire OP;
wire CS,NS;

//instantiating design to test 
mealy_101X_seq_det_over UUT(Clk,Rst,In,OP,CS,NS);

// Monitoring the simulation results
initial begin
	$monitor("Current State = %b || Input = %b || Next State = %b || Output = %b",CS,In,NS,OP);
end

// clock signal generation
initial begin
	Clk = 1'b0;
	forever #5 Clk = ~Clk;
end

// input signals
initial begin
		Rst = 1'b0;
	#15 Rst = 1'b1; end
	
initial begin
	    In  = 1'b0;
	#10 In	= 1'b0;
	#10 In  = 1'b1;
	#10 In	= 1'b0;
	#10 In  = 1'b0;
	#10 In	= 1'b1;
	#10 In  = 1'b0;
	#10 In	= 1'b1;
	#7  In  = 1'b0;
	#13 In	= 1'b1;
	# 8 In  = 1'b1;
	#10 In  = 1'b0;
	#10 In	= 1'b1;
	#10 In  = 1'b0;
	#10 In	= 1'b1;
	#10 In  = 1'b0;
	#10 In	= 1'b0;
	#10 $finish();
end

endmodule