//testbench butterfly
//reading the test values from a .txt file
//format for each line in the file :
// a b twiddle sel_red sel_butterfly a_prime_ref b_prime_ref

`timescale 1 ns/ 1 ps
module butterfly_tb ();
	logic [23:0] a_s;
	logic [23:0] b_s;
	logic [22:0] twiddle_s;
	logic sel_red_s;
	logic sel_butterfly_s;
	logic [22:0] a_prime_s;
	logic [22:0] b_prime_s;
//DUT
	butterfly DUT (
		.a_i(a_s),
		.b_i(b_s),
		.twiddle_i(twiddle_s),
		.sel_red_i(sel_red_s),	
		.sel_butterfly_i(sel_butterfly_s),
		.a_prime_o(a_prime_s),
		.b_prime_o(b_prime_s)	
	);
	logic [22:0] a_prime_ref_s;
	logic [22:0] b_prime_ref_s;
	logic correct;
	assign correct = (a_prime_s === a_prime_ref_s) && (b_prime_s === b_prime_ref_s);
//stimuli generation
	
	initial 
		begin
			int fd, a, b, w, r, but;
			fd = $fopen("./butterfly_test_val.txt", "r");
			while ($fscanf(fd, "%d %d %d %d %d %d %d", a_s, b_s, twiddle_s, sel_red_s, sel_butterfly_s, a_prime_ref_s, b_prime_ref_s) == 7)
			begin
				
				#5;	
		

			end
			$fclose(fd);	
		end

endmodule : butterfly_tb
