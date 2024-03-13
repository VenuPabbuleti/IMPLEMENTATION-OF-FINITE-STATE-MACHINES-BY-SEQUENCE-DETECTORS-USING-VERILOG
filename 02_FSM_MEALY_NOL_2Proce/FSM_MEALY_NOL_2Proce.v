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


module mealy_1010_seq_det_non_over(Clk,Rst,In,OP);
input Clk,Rst,In; // Input signals
output OP;        // Output signal

reg op;    // register to store output
reg [1:0]C_State,N_State; // state register 

parameter s0   = 0,  // state registers
		  s1   = 1, 
		  s10  = 2,
		  s101 = 3;
		  


always @(posedge Clk,negedge Rst) begin
	if(!Rst)
	begin
		C_State <= s0;
		op <= 0; 
	end
	
	else begin
	   C_State <= N_State;
	end
end

always @(C_State,In) begin

		case(C_State)
		
			s0  :	begin N_State <= In ? s1:s0 ; op <= 0 ; end
			
			s1  :	begin N_State <= In ? s1:s10 ; op <= 0 ; end

			s10 : 	begin N_State <= In ? s101:s0 ; op <= 0 ; end

		    s101:  	begin  N_State <= In ? s1:s0 ; op <= In ? 0:1 ; end
				 
		    default : begin	N_State <= s0; op <= 0; end
			
		endcase

	end



assign OP = op;

endmodule