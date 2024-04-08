//red_K.sv
//Reduction de Barrett pour Kyber

`timescale 1ns/1ps

module red_K (
	      input logic [23:0]  product_i,
	      output logic [11:0] result_o
	      );
   logic [35:0] 		  step1_s;
   logic [11:0] 		  step2_s;
   logic [22:0] 		  step3_s;
   logic [12:0] 		  step4_s, step5_s;
   logic 			  borrow_s;

   assign step1_s = product_i * 5039;
   assign step2_s = step1_s >> 24;
   assign step3_s = step2_s * 3329;
   assign step4_s = product_i - step3_s;

   //13-bit subtractor
  
   assign result_o = (borrow_s) ? (step4_s[11:0]) : step5_s[11:0];

endmodule:red_K