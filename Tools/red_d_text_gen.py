from random import randint
path = "./TestBenchFiles/red_d_test_val.txt"
number = 50 #Number of lines to generate

f = open(path, "w")
for i in range(number):
    a = randint(0, 8380417*8380417)
    
    f.write(str(a) + " " + str(a%8380417) "\n")

f.close()
