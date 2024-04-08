//mod_mul.sv
//c = a * b mod q
// q is not an input of this module, as it depends solely on the Algorithm used

`timescale 1ns/1ps

module mod_mul(
	       input logic [22:0]  a_i, b_i,
	       input logic 	   select_i, 
	       output logic [22:0] c_i
	       );
   logic [45:0] 		   product_s;
   logic [11:0] 		   reduced_K;
   logic [22:0] 		   reduced_D;

   assign product_s = a_i * b_i;

   red_K reduction_K(
		     .product_i(product_s[23:0]),
		     .result_o(reduced_K)
		     );
   red_D reduction_D(
		     .product_i(product_s),
		     .result_o(reduced_D)
		     );
   
   assign c_o = select_i ? reduced_D : {11'b0,reduced_K};

endmodule:mod_mul