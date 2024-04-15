//butterfly_filetb.sv
//Test bench for the Cooley-Tukey and Gentleman-Sande butterflies using test values from a file

//format for each line in the file :
//a_i b_i twiddle_i sel_red_i sel_butterfly_i a_o b_o

//Run for 200 ns (number of lines in the test file)

`timescale 1 ns/ 1 ps

module butterfly_filetb ();
	logic [23:0] a_i_s, b_i_s;
	logic [22:0] twiddle_i_s;
	logic sel_red_i_s, sel_butterfly_i_s;
	logic [22:0] a_o_s, b_o_s;

	logic [22:0] a_o_ref_s, b_o_ref_s;
	logic correct_s;

	butterfly DUT (
		.a_i(a_i_s),
		.b_i(b_i_s),
		.twiddle_i(twiddle_i_s),
		.sel_red_i(sel_red_i_s),	
		.sel_butterfly_i(sel_butterfly_i_s),
		.a_o(a_o_s),
		.b_o(b_o_s)	
	);

	assign correct_s = (a_o_s === a_o_ref_s) && (b_o_s === b_o_ref_s);

//stimuli generation	
initial begin
	int fd;
	fd = $fopen("./TestBenchFiles/butterfly_test_val.txt", "r");
	while ($fscanf(fd, "%d %d %d %d %d %d %d", a_i_s, b_i_s, twiddle_i_s, sel_red_i_s, sel_butterfly_i_s, a_o_ref_s, b_o_ref_s) == 7)
	begin
		#1;
	end
	$fclose(fd);	
end

endmodule : butterfly_filetb
