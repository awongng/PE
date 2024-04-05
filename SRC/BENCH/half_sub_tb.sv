`timescale 1 ns/ 1 ps

//testbench half_sub
module half_sub_tb ();

	logic a_i_s;
	logic b_i_s;
	logic borrow_o_s;
	logic diff_o_s;

//DUT
	half_sub DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.borrow_o(borrow_o_s),
		.diff_o(diff_o_s)	
	);

//stimuli generation
	initial 
		begin
			a_i_s = 0;
			b_i_s = 0;
			#5 a_i_s = 1;
			#5 b_i_s = 1;
			#5 a_i_s = 0;
		end

endmodule : half_sub_tb
