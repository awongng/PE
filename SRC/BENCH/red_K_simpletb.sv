//red_K_tb.sv
//test bench de la réduction de Barrett pour Kyber

`timescale 1ns/1ps

module red_K_simpletb ();
   logic [23:0] product_i_s;
   logic [11:0] result_o_s;

   red_K DUT(
	     .product_i(product_i_s),
	     .result_o(result_o_s)
	     );

   initial begin
      product_i_s = 24'h631686;
//expected result : d2280,h8E8,b1000 11101000
      #10 product_i_s = 24'h7AC64;
//expected result : d205,hCD,b11001101
      #10 product_i_s = 24'h60EDCC;
//expected result : d600,h258,b10 01011000
   end
endmodule:red_K_simpletb
