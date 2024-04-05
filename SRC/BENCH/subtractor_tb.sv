`timescale 1 ns/ 1 ps

//testbench subtractor
module subtractor_tb ();

	logic a_i_s;
	logic b_i_s;
	logic c_i_s;
	logic borrow_o_s;
	logic diff_o_s;

//DUT
	subtractor DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.c_i(c_i_s),
		.borrow_o(borrow_o_s),
		.diff_o(diff_o_s)	
	);

//stimuli generation
	initial 
		begin
			a_i_s = 0;
			b_i_s = 0;
			c_i_s = 0;
			#5 a_i_s = 1;
			#5 b_i_s = 1;
			#5 a_i_s = 0;
			#5 c_i_s = 1;
			#5 a_i_s = 1;
			#5 b_i_s = 0;
			#5 a_i_s = 0;
		end

endmodule : subtractor_tb
