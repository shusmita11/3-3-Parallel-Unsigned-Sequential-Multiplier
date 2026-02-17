timeunit 1ns;
timeprecision 1ns;

import MULT_PKG::*;

extern module UNS_3X3_MULT (  	
	input logic SYS_CLOCK, 
	input logic FSM_ARESET,
	input logic GO,
	input logic [MULTIPLICAND_WIDTH-1 : 0] A,
	input logic [MULTIPLIER_WIDTH-1 : 0] B,	   
	output logic READY, INIT, COMPUTE, RES,
	output var logic [PRODUCT_WIDTH-1 : 0] F_REG
);

module UNS_3X3_MULT (.*);

//INTERNAL SIGNALS & CONTROL SIGNALS 

	logic ALU_CONT;
	logic LOAD_A_REG;
	logic LOAD_B_REG;
	logic LOAD_R1_REG;
	logic LOAD_F_REG; 
	logic LOAD_COUNT;
	logic DEC_COUNT;
	logic B_GT_1;
	logic COUNT_GT_2;
	
	MULT_FSM FSM (.*); 
	MULT_DATAPATH DP (.*);
	
endmodule : UNS_3X3_MULT
