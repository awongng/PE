`timescale 1 ns/ 1 ps

//testbench soustraction modulaire
module mod_sub_simpletb ();

	logic [23:0] a_i_s;
	logic [23:0] b_i_s;
	logic [22:0] q_i_s;
	logic [22:0] c_o_s;

//DUT
	mod_sub DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.q_i(q_i_s),
		.c_o(c_o_s)	
	);

//stimuli generation
	initial 
		begin
			a_i_s = '0;
			b_i_s = '0;
			q_i_s = 40;
			#5 a_i_s = 20;
			b_i_s = 13;
			#5 a_i_s = 7;

		end

endmodule : mod_sub_simpletb
