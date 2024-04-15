//mod_mul_filetb.sv
//Test bench for modular multiplication using test values from a file

//format for each line in the file :
//a_i b_i red_i c_o

//Run for 100 ns (number of lines in the test file)

`timescale 1 ns/ 1 ps

module mod_mul_filetb ();
	logic [22:0] a_i_s, b_i_s;
	logic [22:0] c_o_s;
   	logic select_i_s;

	logic [22:0] c_o_ref_s;
	logic correct_s;

	mod_mul DUT(
		.a_i(a_i_s),
		.b_i(b_i_s),
		.select_i(select_i_s),
		.c_o(c_o_s)
	);

	assign correct_s = (c_o_s === c_o_ref_s);

//Stimuli generation
initial begin
	int fd;
	fd = $fopen("./TestBenchFiles/mod_mul_test_val.txt", "r");
	while ($fscanf(fd, "%d %d %d %d", a_i_s, b_i_s, select_i_s, c_o_ref_s) == 4)
	begin
		#1;		
	end
	$fclose(fd);	
end

endmodule : mod_mul_filetb
