//subtractor_fulltb.sv
//Test bench for subtractor on all possible values

//Run for 8 ns

`timescale 1 ns/ 1 ps

module subtractor_fulltb ();

	logic a_i_s, b_i_s;
	logic c_i_s;
	logic borrow_o_s;
	logic diff_o_s;

	subtractor DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.c_i(c_i_s),
		.borrow_o(borrow_o_s),
		.diff_o(diff_o_s)	
	);

//Stimuli generation
initial begin
	a_i_s = 0;
	forever #1 a_i_s = ~a_i_s;
end
initial begin
	b_i_s = 0;
	forever #2 b_i_s = ~b_i_s;
end
initial begin
	c_i_s = 0;
	forever #4 b_i_s = ~b_i_s;
end

endmodule : subtractor_fulltb
