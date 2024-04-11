//red_D_fulltb.sv
//test bench plus complet de la réduction de Barrett pour Dilithium

//Simuler autant de ns que de valeurs que vous souhaitez

`timescale 1ns/1ps

module red_D_fulltb();
   logic [45:0] product_i_s;
   logic [22:0] result_o_s;
   logic 	correct_s;
   
   red_D DUT(
	     .product_i(product_i_s),
	     .result_o(result_o_s)
	     );

   assign correct_s = (result_o_s === (product_i_s % 8380417));
      
   initial begin
      product_i_s = 46'h2D71F035BA3;
      forever #1 product_i_s = ((product_i_s * 649731) % 46'd70231389093889);
   end
   
endmodule:red_D_fulltb
