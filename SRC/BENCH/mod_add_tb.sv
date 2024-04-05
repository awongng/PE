`timescale 1 ns/ 1 ps

//testbench addition modulaire
module mod_add_tb ();

	logic [23:0] a_i_s;
	logic [23:0] b_i_s;
	logic [22:0] q_i_s;
	logic [22:0] c_o_s;

//DUT
	mod_add DUT (
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
			b_i_s = 3;
			#5 b_i_s = 21;

		end

endmodule : mod_add_tb
