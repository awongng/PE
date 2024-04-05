//red_K_tb.sv
//Test bench pour red_K

`timescale 1ns/1ps

module red_K_tb(
		);
   logic [23:0] product_i;
   logic [11:0] result_o;

   red_K DUT(
	     .product(product_i),
	     .result(result_o)
	     );
   initial begin
      product_i = 10896597;
   end
endmodule:red_K_tb
