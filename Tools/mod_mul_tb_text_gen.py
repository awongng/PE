from random import getrandbits
path = "./TestBenchFiles/mod_mul_test_val.txt"
number = 50 #generate 2 times as many lines

f = open(path, "w")
for i in range(number):
    a = getrandbits(23) 
    b = getrandbits(23)
    
    #Modular multiplication for Kyber
    mod = 3329
    f.write(str(a%mod) + " " + str(b%mod) + " " + str(1) + " " + str(a*b %mod) + "\n")
    
    #Modular multiplication for Dilithium
    mod = 8380417
    
    f.write(str(a%mod) + " " + str(b%mod) + " " + str(0) + " " + str(a*b %mod) + "\n")

f.close()
