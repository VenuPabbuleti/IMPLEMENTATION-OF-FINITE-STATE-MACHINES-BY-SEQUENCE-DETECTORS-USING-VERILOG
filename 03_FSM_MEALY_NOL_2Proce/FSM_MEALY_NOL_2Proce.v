`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Author       : PABBULETI VENU
// ID           : N180116
// Branch       : ECE
// Project Name : IMPLEMENTATION OF FINITTE STATE MACHINES USING VERILOG
// Design Name  : SEQUENCE DETECTOR 1010 USING MEALY MACHINE(NON OVERLAPPING) BY USING TWO PROCEDURAL BLOCK
// Module Name  : mealy_1010_seq_det_non_over
// RGUKT NUZVID 
//////////////////////////////////////////////////////////////////////////////////


module mealy_1010_seq_det_non_over(Clk,Rst,In,OP,sta);
input Clk,Rst,In; // Input signals
output OP;        // Output signal
output [1:0]sta;

reg op;    // register to store output
reg [1:0]state; // state register 

parameter s0   = 0,  // state registers
		  s1   = 1, 
		  s10  = 2,
		  s101 = 3;
		  
reg [1:0]State;

always @(posedge Clk,negedge Rst) begin
	if(!Rst)
	begin
		State <= s0;
		op <= 0; 
	end
	
	else begin
	
		case(State)
		
			s0  :	State <= In ? s1:s0 ;
			
			s1  :	State <= In ? s1:s10 ;

			s10 : 	State <= In ? s101:s0 ;

		    s101:  	State <= In ? s1:s0 ;
				 
		    default : 	State <= s0;
			
		endcase

	end
end

always @(State,In) begin

	case(State)
		s0  :	op <= 0;
			
		s1  :	op <= 0;

		s10 :   op <= 0;
			  
		s101:	op <= In ? 0:1 ;
		
		default :	op <= 0;
				
	endcase
	
end

assign OP = op;
assign sta = State;

endmodule