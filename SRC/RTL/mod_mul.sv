//mod_mul.sv
//c = a * b mod q
// q n'est pas un signal car il dépend uniquement de l'algorithme
//select : 1 si Kyber, 0 si Dilithium

`timescale 1ns/1ps

module mod_mul(
	       input logic [22:0]  a_i, b_i,
	       input logic 	   select_i, 
	       output logic [22:0] c_o
	       );
   logic [45:0] 		   product_s;
   logic [11:0] 		   reduced_K;
   logic [22:0] 		   reduced_D;

   assign product_s = a_i * b_i;

   red_k reduction_K(
		     .product_i(product_s[23:0]),
		     .result_o(reduced_K)
		     );
   red_d reduction_D(
		     .product_i(product_s),
		     .result_o(reduced_D)
		     );
   
   assign c_o = select_i ? {11'b0,reduced_K} : reduced_D;

endmodule:mod_mul
