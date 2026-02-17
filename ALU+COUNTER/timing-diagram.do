onerror { resume }
transcript off
add wave -noreg -logic {/UNS_3X3_MULT_tb/SYS_CLOCK}
add wave -noreg -logic {/UNS_3X3_MULT_tb/GO}
add wave -noreg -logic {/UNS_3X3_MULT_tb/FSM_ARESET}
add wave -noreg -decimal -literal -bold {/UNS_3X3_MULT_tb/P_STATE}
add wave -noreg -logic {/UNS_3X3_MULT_tb/LOAD_A_REG}
add wave -noreg -color 0,0,0 -decimal -literal -bold {/UNS_3X3_MULT_tb/A}
add wave -noreg -decimal -literal {/UNS_3X3_MULT_tb/A_REG}
add wave -noreg -logic {/UNS_3X3_MULT_tb/LOAD_B_REG}
add wave -noreg -color 0,0,0 -decimal -literal -bold {/UNS_3X3_MULT_tb/B}
add wave -noreg -decimal -literal {/UNS_3X3_MULT_tb/B_REG}
add wave -noreg -logic {/UNS_3X3_MULT_tb/LOAD_R1_REG}
add wave -noreg -color 132,134,0 -decimal -literal -bold {/UNS_3X3_MULT_tb/R1_REG}
add wave -noreg -logic {/UNS_3X3_MULT_tb/LOAD_COUNT}
add wave -noreg -logic {/UNS_3X3_MULT_tb/DEC_COUNT}
add wave -noreg -color 132,134,0 -decimal -literal -bold {/UNS_3X3_MULT_tb/COUNT_OUT}
add wave -noreg -logic {/UNS_3X3_MULT_tb/ALU_CONT}
add wave -noreg -decimal -literal {/UNS_3X3_MULT_tb/ALU_OUT}
add wave -noreg -logic {/UNS_3X3_MULT_tb/LOAD_F_REG}
add wave -noreg -color 132,4,0 -decimal -literal -bold {/UNS_3X3_MULT_tb/F_REG}
add wave -noreg -logic {/UNS_3X3_MULT_tb/COUNT_GT_2}
add wave -noreg -logic {/UNS_3X3_MULT_tb/B_GT_1}
cursor "Cursor 1" 14987097ps  
cursor "Cursor 2" 14717.21ns  
transcript on
