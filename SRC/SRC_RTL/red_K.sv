//red_K.sv
//Reduction de Barrett pour Kyber

`timescale 1ns/1ps

module red_K (
	      input logic [23:0]  product,
	      output logic [11:0] result
	      );
   logic [35:0] 		  step1;
   logic [11:0] 		  step2, step5;
   logic [22:0] 		  step3;
   logic [12:0] 		  step4;
   logic 			  borrow;

   assign step1 = product * 5039;
   assign step2 = step1 >> 24;
   assign step3 = step2 * 3329;
   assign step4 = product-step3;

   //13-bit substractor
  
   assign result = (borrow) ? (step4[11:0]) : step5;

endmodule:red_K
