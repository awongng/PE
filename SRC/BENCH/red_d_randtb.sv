//red_d_fulltb.sv
//Test bench for the Barrett reduction for Dilithium on random values

//1 value is simulated every ns

`timescale 1ns/1ps

module red_d_randtb();
   logic [45:0] product_i_s;
   logic [22:0] result_o_s;
   logic        correct_s;
   
   red_d DUT(
	     .product_i(product_i_s),
	     .result_o(result_o_s)
	     );

   assign correct_s = (result_o_s === (product_i_s % 8380417));

//Stimuli generation
   initial begin
      product_i_s = 46'h0;
      forever #1 product_i_s = $urandom();
   end

endmodule:red_d_randtb
