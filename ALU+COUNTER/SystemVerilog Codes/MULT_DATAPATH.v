timeunit 1ns;
timeprecision 1ns;

import MULT_PKG::*;

extern module MULT_DATAPATH (
    input  logic SYS_CLOCK,
 
    input  logic [MULTIPLICAND_WIDTH-1:0] A,
    input  logic [MULTIPLIER_WIDTH-1:0]   B,
 
    input  logic ALU_CONT,
 
    input  logic LOAD_A_REG,
    input  logic LOAD_B_REG,
    input  logic LOAD_R1_REG,
    input  logic LOAD_F_REG,
	input  logic LOAD_COUNT,  
	input  logic DEC_COUNT, 
 
    output logic [PRODUCT_WIDTH-1:0] F_REG,
    output logic B_GT_1,
    output logic COUNT_GT_2,
);

module MULT_DATAPATH (.*);


    // Internal registers
    logic [PRODUCT_WIDTH-1:0] A_REG, B_REG;
    logic [PRODUCT_WIDTH-1:0] R1_REG;
	logic [PRODUCT_WIDTH-1:0] COUNT_OUT; 
    // ALU signals
    logic [PRODUCT_WIDTH-1:0] ALU_INP1;
    logic [PRODUCT_WIDTH-1:0] ALU_INP2;
    logic [PRODUCT_WIDTH-1:0] ALU_OUT;
 
 
	//INPUT REGISTERS
	always_ff @ (posedge SYS_CLOCK)
	begin : INP_REGS
		if (LOAD_A_REG)
			A_REG <= { {MULTIPLICAND_WIDTH{'0} }, A};	
		if (LOAD_B_REG)
		begin 				
			B_REG <= { {MULTIPLICAND_WIDTH{'0} }, B};
		end	
	end : INP_REGS
	//ACCUMULATOR/DATA REGISTERS
	always_ff @ (posedge SYS_CLOCK)
	begin : ACCUM_REGS
		if (LOAD_R1_REG)
			R1_REG <= ALU_OUT;

	end : ACCUM_REGS
	//OUTPUT REGISTER
	always_ff @ (posedge SYS_CLOCK)
	begin : OUT_REGS
		if (LOAD_F_REG)
			if (B_REG > 0)
				F_REG <= R1_REG;
			else
				F_REG <= 0 ;
	end : OUT_REGS	

	//ALU
	always_comb
	begin : ALU
	ALU_INP1 = R1_REG;
	ALU_INP2 = A_REG;
	case (ALU_CONT)
	2'b00:  ALU_OUT = ALU_INP2;	
	2'b01:  ALU_OUT = ALU_INP1 + ALU_INP2; 
	2'b10: ALU_OUT = '0; 
	default: ALU_OUT = '0;	
	endcase	
	end : ALU
	//COUNTER
	always_ff @ (posedge  SYS_CLOCK)
		begin: COUNTER
			if (LOAD_COUNT)
				COUNT_OUT <= B_REG;
			else if (DEC_COUNT)
				COUNT_OUT <= COUNT_OUT-1;
			else;
		 end: COUNTER
			
	//COMPARATOR		
	always_comb
		begin : COMPARATOR
		    COUNT_GT_2 = 1'b0;
		    B_GT_1  = 1'b0;	 
	
		    if (COUNT_OUT > 2) 
		    begin
		        COUNT_GT_2 = 1'b1;
		        B_GT_1  = 1'b1; 
		    end 
		    else if (B_REG > 1) 
		        B_GT_1 = 1'b1; 	

		end : COMPARATOR  
		
		
			
	endmodule : MULT_DATAPATH