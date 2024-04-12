//mod_mul_randtb.sv
//test bench de la multiplication modulaire

`timescale 1ns/1ps

module mod_mul_randtb();
   logic [22:0] a_i_s, b_i_s, c_o_s;
   logic 	select_i_s;
   
   logic correct_s;

   mod_mul DUT(
	       .a_i(a_i_s),
	       .b_i(b_i_s),
	       .select_i(select_i_s),
	       .c_o(c_o_s)
	       );
    assign correct_s = (c_o_s === (a_i_s * b_i_s) % (select_i_s ? 3329 : 8380417));

   initial begin
      a_i_s = 24'h0;
      b_i_s = 24'h0;
      select_i_s = 0;
      forever #1 begin
          select_i_s = ~select_i_s;
	      a_i_s = $urandom();
	      b_i_s = $urandom();
      end
   end
endmodule:mod_mul_randtb
