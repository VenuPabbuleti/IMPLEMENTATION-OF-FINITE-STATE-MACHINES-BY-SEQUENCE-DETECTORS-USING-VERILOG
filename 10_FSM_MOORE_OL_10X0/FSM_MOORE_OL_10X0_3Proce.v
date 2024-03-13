`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Author       : PABBULETI VENU
// ID           : N180116
// Branch       : ECE
// Project Name : IMPLEMENTATION OF FINITTE STATE MACHINES USING VERILOG
// Design Name  : SEQUENCE DETECTOR 10X0 USING MOORE MACHINE(OVERLAPPING) 
// Module Name  : moore_10X0_seq_det_over
// RGUKT NUZVID 

//////////////////////////////////////////////////////////////////////////////////

module moore_10X0_seq_det_over(Clk,Rst,In,OP,CS,NS);
input Clk,Rst,In; // Input signals
output OP;        // Output signal
output [2:0]CS,NS; // states

parameter s0    = 0 ,  // state registers
		  s1    = 1 , 
		  s10   = 2 ,
		  s100  = 3 ,
		  s101  = 4 ,
		  s10X0 = 5 ;
		  
reg x; // to know the 10X0--> X direction(1010/1000)
		  
reg [2:0]C_State,N_State; // state declarations 

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
	
		s0    : N_State <= In ? s1 : s0 ;

		s1    : N_State <= In ? s1 : s10 ;

		s10   : N_State <= In ? s101 : s100 ;
		
		s100  : begin N_State <= In ? s1 : s10X0 ;  x <= 0 ;end

		s101  : begin N_State <= In ? s1 : s10X0 ;  x <= 1 ; end
		
		s10X0 : N_State <= x ? (In ? s101 : s100 ) :(In ? s1 : s0 ) ;

		default : N_State <= s0;
		
	endcase
end

// Output logic

assign OP = (C_State == s10X0);


//
assign CS = C_State ; 
assign NS = N_State ;

endmodule