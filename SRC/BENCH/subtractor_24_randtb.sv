//subtractor_24__randtb.sv
//Test bench for a 24 bit subractor on random values

//1 value is simulated every ns

`timescale 1 ns/ 1 ps

module subtractor_24_randtb ();
	logic [23:0] a_i_s, b_i_s;
	logic borrow_o_s;
	logic [23:0] diff_o_s;

	logic correct_s;

	subtractor_n #(.nb_bit(24)) DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.borrow_o(borrow_o_s),
		.diff_o(diff_o_s)	
	);

    assign correct_s = (borrow_o_s === (a_i_s < b_i_s)) && ((a_i_s <= b_i_s) || (diff_o_s === (a_i_s - b_i_s)));

//Stimuli generation
initial begin
	a_i_s = '0;
	b_i_s = '0;
    forever #1 begin
        a_i_s = $urandom();
        b_i_s = $urandom();
    end
end

endmodule : subtractor_24_randtb
