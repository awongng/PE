//red_k_fulltb.sv
//Test bench for the Barrett reduction for Kyber on all values

//Run 11082241ns (0 <= product_i_s < 3329²)

`timescale 1ns/1ps

module red_k_fulltb ();
   logic [23:0] product_i_s;
   logic [11:0] result_o_s;
   logic        correct;
   
   red_k DUT(
	     .product_i(product_i_s),
	     .result_o(result_o_s)
	     );
   assign correct = (result_o_s === (product_i_s % 3329));

//Stimuli generation
   initial begin
      product_i_s = 24'h0;
      forever #1 product_i_s = product_i_s + 1;
   end
endmodule:red_k_fulltb
