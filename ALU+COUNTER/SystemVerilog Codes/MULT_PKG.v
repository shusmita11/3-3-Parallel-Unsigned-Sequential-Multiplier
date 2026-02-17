timeunit 1ns;
timeprecision 1ns;

package MULT_PKG; 

parameter MULTIPLICAND_WIDTH = 3;	  
parameter MULTIPLIER_WIDTH = 3;
localparam PRODUCT_WIDTH = MULTIPLICAND_WIDTH + MULTIPLIER_WIDTH; 

parameter NO_OF_STATE = 4;
localparam STATE_REG_WIDTH = $clog2(NO_OF_STATE);
	
endpackage : MULT_PKG

