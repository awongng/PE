`timescale 1 ns/ 1 ps

//module half subtractor
module half_sub (
	input logic a_i,
	input logic b_i,
	output logic borrow_o,
	output logic diff_o
	);

	assign diff_o = a_i ^ b_i;
	assign borrow_o = (~a_i) & b_i;

endmodule : half_sub
