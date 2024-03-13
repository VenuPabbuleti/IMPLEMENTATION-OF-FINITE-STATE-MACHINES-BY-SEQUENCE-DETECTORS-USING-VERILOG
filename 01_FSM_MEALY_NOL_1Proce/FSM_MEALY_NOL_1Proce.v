`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Author       : PABBULETI VENU
// ID           : N180116
// Branch       : ECE
// Project Name : IMPLEMENTATION OF FINITTE STATE MACHINES USING VERILOG
// Design Name  : SEQUENCE DETECTOR 1010 USING MEALY MACHINE(NON OVERLAPPING) BY USING SINGLE PROCEDURAL BLOCK
// Module Name  : mealy_1010_seq_det_non_over
// RGUKT NUZVID 
//////////////////////////////////////////////////////////////////////////////////


module mealy_1010_seq_det_non_over(Clk,Rst,In,OP,state);
input Clk,Rst,In; // Input signals
output OP;        // Output signal
output [1:0]state;

reg op;    // register to store output
reg [1:0]State; // State register 

parameter s0   = 0;  // State registers
parameter s1   = 1;
parameter s10  = 2;
parameter s101 = 3;
		  
always @(posedge Clk,negedge Rst) begin
	if(!Rst)
	begin
		State <= s0;
		op <= 0; 
	end
	
	else begin
		case(State)
			s0  : begin
					State <= In ? s1:s0 ;
					op <= 0;
				 end
			
			s1  : begin
					State <= In ? s1:s10 ;
					op <= 0;
				end

			s10 : begin
					State <= In ? s101:s0 ;
					op <= 0;
				end

			s101: begin
					State <= In ? s1:s0 ;
					op <= In ? 0:1 ;
				end
				
			default : begin
					  State <= s0 ;
					  op <= 0;
					  end
		endcase
	end
	
end

assign OP = op;
assign state = State;

endmodule