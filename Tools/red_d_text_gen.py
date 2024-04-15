from random import randint
path = "./TestBenchFiles/red_d_test_val.txt"

f = open(path, "w")
for i in range(50):
    a = randint(0, 8380417*8380417)
    
    f.write(str(a) + " " + str(a%8380417) "\n")

f.close()
