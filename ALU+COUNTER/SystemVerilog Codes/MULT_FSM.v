timeunit 1ns;
timeprecision 1ns;

import MULT_PKG::*; 

module MULT_FSM (
    input logic SYS_CLOCK,         
    input logic FSM_ARESET,        
    input logic GO,               
    input logic B_GT_1,	 
	input logic COUNT_GT_2,
    output logic ALU_CONT,        
    output logic LOAD_A_REG,       
    output logic LOAD_B_REG,      
    output logic LOAD_R1_REG,           
    output logic LOAD_F_REG,        
	output logic LOAD_COUNT,
	output logic DEC_COUNT,
	output logic READY,
	output logic INIT,
	output logic COMPUTE,
	output logic RES
);

    // State variables
    logic [2:0] P_STATE, N_STATE;  

	
	//NSL
    always_comb begin : NEXT_STATE_LOGIC
        N_STATE = P_STATE; 
        
        case (P_STATE)
            3'b000: begin
                if (!GO)
                    N_STATE = 3'b000;
                else
                    N_STATE = 3'b001;
            end
            3'b001: begin
					if (!B_GT_1)      N_STATE = 3'b011;
						else          N_STATE = 3'b010;
					end
            3'b010: begin
						if (COUNT_GT_2) N_STATE = 3'b010;	
						else          N_STATE = 3'b011;
					end
            3'b011: N_STATE = 3'b000;
            default: N_STATE = 3'b000;  
        endcase
    end : NEXT_STATE_LOGIC

    //OL
    always_comb begin : OUTPUT_LOGIC
        // Default values for outputs
        ALU_CONT = 2'b00;
        LOAD_A_REG = 0;
        LOAD_B_REG = 0;
        LOAD_R1_REG = 0;
        LOAD_F_REG = 0;	
		LOAD_COUNT = 0;
		DEC_COUNT  = 0;
		
		{READY, INIT, COMPUTE, RES} = '0;

        case (P_STATE)
            3'b000: begin
				READY = 1;
                if (GO) begin
                    LOAD_A_REG = 1;
                    LOAD_B_REG = 1;	  
                end
				
            end
            3'b001: begin
				INIT = 1;
                ALU_CONT = 1'b0;
                LOAD_R1_REG = 1;
				LOAD_COUNT  = 1;
				
            end
            3'b010: begin	
				COMPUTE = 1; 
                ALU_CONT = 1'b1;
                LOAD_R1_REG = 1; 
				DEC_COUNT = 1;
            end

            3'b011: begin 
				RES = 1;
                LOAD_F_REG = 1;
            end
            default: ;
        endcase
    end : OUTPUT_LOGIC

    //PSR
    always_ff @ (posedge SYS_CLOCK or posedge FSM_ARESET) begin : PRESENT_STATE_REGISTER
        if (FSM_ARESET)
            P_STATE <= 3'b000;  
        else
            P_STATE <= N_STATE;  
    end : PRESENT_STATE_REGISTER

endmodule : MULT_FSM
