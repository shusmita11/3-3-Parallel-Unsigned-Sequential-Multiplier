timeunit 1ns;
timeprecision 1ps;

import MULT_PKG::*;


module UNS_3X3_MULT_tb;


logic SYS_CLOCK;
logic GO;
logic FSM_ARESET;

// HIERARCHICAL REFERENCE TO VIEW INTERNAL SIGNALS IN SIMULATION DIRECTLY 
logic [STATE_REG_WIDTH-1 : 0] P_STATE, N_STATE;

logic LOAD_A_REG;
logic [MULTIPLICAND_WIDTH-1:0] A;
logic [PRODUCT_WIDTH-1 : 0] A_REG;

logic LOAD_B_REG;
logic [MULTIPLIER_WIDTH-1:0] B;
logic [PRODUCT_WIDTH-1 : 0] B_REG;

logic ALU_CONT;
logic [PRODUCT_WIDTH-1 : 0] ALU_OUT;

logic LOAD_R1_REG;
logic [PRODUCT_WIDTH-1 : 0] R1_REG;

logic LOAD_F_REG;
logic [PRODUCT_WIDTH-1:0] F_REG;

logic LOAD_COUNT;  
logic DEC_COUNT;  
logic [PRODUCT_WIDTH-1 : 0] COUNT_OUT;
logic B_GT_1;

logic R2_GT_2;


//FSM Output Signals
logic READY;
logic INIT;
logic COMPUTE;
logic RES;

// HIERARCHICAL REFERENCE TO VIEW INTERNAL SIGNALS IN SIMULATION DIRECTLY  
assign P_STATE = UNS_3X3_MULT_tb.UUT.FSM.P_STATE;
assign N_STATE = UNS_3X3_MULT_tb.UUT.FSM.N_STATE;
assign A_REG = UNS_3X3_MULT_tb.UUT.DP.A_REG;
assign B_REG = UNS_3X3_MULT_tb.UUT.DP.B_REG;   
assign LOAD_F_REG = UNS_3X3_MULT_tb.UUT.LOAD_F_REG;
assign R1_REG = UNS_3X3_MULT_tb.UUT.DP.R1_REG;
assign ALU_CONT = UNS_3X3_MULT_tb.UUT.DP.ALU_CONT;
assign ALU_OUT = UNS_3X3_MULT_tb.UUT.DP.ALU_OUT;
assign COUNT_OUT = UNS_3X3_MULT_tb.UUT.DP.COUNT_OUT;
assign LOAD_A_REG = UNS_3X3_MULT_tb.UUT.LOAD_A_REG;
assign LOAD_B_REG = UNS_3X3_MULT_tb.UUT.LOAD_B_REG;
assign LOAD_COUNT = UNS_3X3_MULT_tb.UUT.LOAD_COUNT;
assign LOAD_R1_REG = UNS_3X3_MULT_tb.UUT.LOAD_R1_REG;	  
assign B_GT_1 = UNS_3X3_MULT_tb.UUT.DP.B_GT_1;
assign COUNT_GT_2 = UNS_3X3_MULT_tb.UUT.DP.COUNT_GT_2;	
assign DEC_COUNT = UNS_3X3_MULT_tb.UUT.DEC_COUNT;


UNS_3X3_MULT UUT (
    .SYS_CLOCK(SYS_CLOCK),
    .FSM_ARESET(FSM_ARESET),
    .GO(GO),
    .A(A),
    .B(B),
	.READY(READY),
	.INIT(INIT),
	.COMPUTE(COMPUTE),
	.RES(RES),
    .F_REG(F_REG)
);

time CLOCK_PERIOD = 100ns; 

//clock
initial begin : CLOCK_GENERATOR
    SYS_CLOCK = 0;
    forever begin
        #(CLOCK_PERIOD/2);
        SYS_CLOCK = ~SYS_CLOCK;			
    end			
end : CLOCK_GENERATOR

//FSM AReset
initial begin : ARESET_GENERATOR
    FSM_ARESET = 0;
        #20ns FSM_ARESET = 1;	
        #60ns FSM_ARESET = 0;	
end : ARESET_GENERATOR

// Data Generation: Pseudorandom Number Generator for A and B
initial begin : DATA_GENERATOR
    A = 3'd2; B = 3'd5;
    forever begin	
        @(posedge SYS_CLOCK);
        if (GO) begin
            // Pseudorandom number generator for A and B
			A <= $urandom_range(0, 7);
			B <= $urandom_range(0, 7);
        end
    end			
end : DATA_GENERATOR

// GO Signal Generator
initial begin : GO_GENERATOR   
	#0ns GO = 0;
    #200ns GO = 1;	
end : GO_GENERATOR

time RUN_TIME = 20000ns; 

initial begin : SIMULATION_CONTROL
    #RUN_TIME;
    $finish;	
end : SIMULATION_CONTROL 


endmodule : UNS_3X3_MULT_tb
