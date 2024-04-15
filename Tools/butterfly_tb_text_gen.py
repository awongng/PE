from random import getrandbits
path = "./TestBenchFiles/butterfly_test_val.txt"

f = open(path, "w")
for i in range(50):
    a = getrandbits(24) 
    b = getrandbits(24)
    w = getrandbits(23)
    
    mod = 3329
    
    #Cooley-Turkey for Kyber
    a_prime = a + b*w
    b_prime = a - b*w

    f.write(str(a%mod) + " " + str(b%mod) + " " + str(w%mod) + " " + str(1) + " " + str(0) + " " + str(a_prime%mod) + " " + str(b_prime%mod)+ "\n")
    
    #Gentleman-Sande for Kyber
    a_prime = a + b
    b_prime = (a - b)*w
    
    f.write(str(a%mod) + " " + str(b%mod) + " " + str(w%mod) + " " + str(1) + " " + str(1) + " " + str(a_prime%mod) + " " + str(b_prime%mod)+ "\n")
    
    #print("a =", hex(a % mod), "\n")
    #print("b*w =", hex(b*w % mod), "\n")
    
    mod = 8380417
    
    #Gentleman-Sande for Dilithium
    f.write(str(a%mod) + " " + str(b%mod) + " " + str(w%mod) + " " + str(0) + " " + str(1) + " " + str(a_prime%mod) + " " + str(b_prime%mod)+ "\n")
    
    #Cooley-Turkey for Dilithium
    a_prime = a + b*w
    b_prime = a - b*w
    
    f.write(str(a%mod) + " " + str(b%mod) + " " + str(w%mod) + " " + str(0) + " " + str(0) + " " + str(a_prime%mod) + " " + str(b_prime%mod)+ "\n")
    
    #print(hex("a - b =", (a-b) % mod), "\n")
    
f.close()



