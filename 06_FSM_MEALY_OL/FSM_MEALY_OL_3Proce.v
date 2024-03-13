`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Author       : PABBULETI VENU
// ID           : N180116
// Branch       : ECE
// Project Name : IMPLEMENTATION OF FINITTE STATE MACHINES USING VERILOG
// Design Name  : SEQUENCE DETECTOR 1010 USING MEALY MACHINE(OVERLAPPING)
// Module Name  : mealy_1010_seq_det_over
// RGUKT NUZVID 
//////////////////////////////////////////////////////////////////////////////////


module mealy_1010_seq_det_over(Clk,Rst,In,OP,CS,NS);
input Clk,Rst,In; // Input signals
output OP;        // Output signal
output [1:0]CS,NS;

parameter s0   = 0,  // state registers
		  s1   = 1, 
		  s10  = 2,
		  s101 = 3;
		  
reg [1:0]C_State,N_State; // state declarations 

// State register 

always @(posedge Clk,negedge Rst) begin

	if(!Rst)
	begin
		C_State <= s0; 
	end
	
	else begin
		C_State <= N_State;
	end
end


// Next state logic

always @(C_State,In) begin

	case(C_State)
	
		s0  : N_State <= In ? s1:s0 ;

		s1  : N_State <= In ? s1:s10 ;

		s10 : N_State <= In ? s101:s0 ;

		s101: N_State <= In ? s1:s10 ;

		default : N_State <= s0;
		
	endcase
end


// Output logic

assign OP = ((C_State == s101) && (!In));


//states 
assign CS = C_State ;
assign NS = N_State ;

endmodule