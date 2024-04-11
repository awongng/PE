//mod_sub_fulltb.sv
//test bench plus complet de la soustraction modulaire

`timescale 1ns/1ps

module mod_sub_fulltb ();
   logic [23:0] a_i_s;
   logic [23:0] b_i_s;
   logic [22:0] q_i_s;
   logic [22:0] c_o_s;
   logic 	correct_s;
   
   mod_sub DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.q_i(q_i_s),
		.c_o(c_o_s)	
		);
   assign correct_s = (c_o_s === ((a_i_s < b_i_s) ? ((a_i_s - b_i_s + q_i_s) % 24'h800000) : ((a_i_s - b_i_s) % 24'h800000)));

   initial begin
      a_i_s = 24'h0;
      b_i_s = 24'h0;
      q_i_s = 24'h6D3410;
      forever #1 begin
	 a_i_s = $urandom();
	 b_i_s = $urandom();
      end
   end

endmodule:mod_sub_fulltb
