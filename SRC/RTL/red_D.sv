//red_K.sv
//Reduction de Barrett pour Dilithium

`timescale 1ns/1ps

module red_D (
	input logic [45:0]  product_i,
	output logic [22:0] result_o
	);
	logic [68:0] step1_s;
	logic [22:0] step2_s;
	logic [45:0] step3_s;
	logic [23:0] step4_s, step5_s;
	logic borrow_s;

	assign step1_s = product_i * 8396807;
	assign step2_s = step1_s >> 46;
	assign step3_s = step2_s * 8380417;
	assign step4_s = product_i - step3_s;

//24-bit subtractor
	subtractor_n #(.nb_bit(24)) DUT (
			.a_i(step4_s),
			.b_i(8380417),
			.borrow_o(borrow_s),
			.diff_o(step5_s)	
		);
  
	assign result_o = (borrow_s) ? (step4_s[22:0]) : step5_s[22:0];

endmodule:red_D
