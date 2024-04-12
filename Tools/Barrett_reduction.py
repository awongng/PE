#05/04/2024
import sys

def dec_to_hex(x):
    t = hex(x)
    l = len(t)
    if(l>2):
        for i in range(l-2):
            print(t[i+2],end="")
            if(i%4==(l+1)%4):
                print(" ",end="")
    else:
        print("0",end="")
    print("")

def dec_to_bin(x):
    t = bin(x)
    l = len(t)
    if(l>2):
        for i in range(l-2):
            print(t[i+2],end="")
            if(i%8==(l+5)%8):
                print(" ",end="")
    else:
        print("0",end="")
    print("\n")

def barrett_K(x):
    print("x: ",x)
    dec_to_hex(x)
    dec_to_bin(x)
    tmp=5039*x
    print("1: ",tmp)
    dec_to_hex(tmp)
    dec_to_bin(tmp)
    tmp=tmp>>24
    print("2: ",tmp)
    dec_to_hex(tmp)
    dec_to_bin(tmp)
    tmp=3329*tmp
    print("3: ",tmp)
    dec_to_hex(tmp)
    dec_to_bin(tmp)
    z=x-tmp
    print("4: ",z)
    dec_to_hex(z)
    dec_to_bin(z)
    print("5: ",z-3329," (ignore if negative)")
    dec_to_hex(z-3329)
    dec_to_bin(z-3329)
    if(z>=3329):
        z=z-3329
    print("result: ",z)
    dec_to_hex(z)
    dec_to_bin(z)
    print("Expected result : ",x%3329)
    dec_to_hex(x%3329)
    dec_to_bin(x%3329)

def barrett_D(x):
    print("x: ",x)
    dec_to_hex(x)
    dec_to_bin(x)
    tmp=8396807*x
    print("1: ",tmp)
    dec_to_hex(tmp)
    dec_to_bin(tmp)
    tmp=tmp>>46
    print("2: ",tmp)
    dec_to_hex(tmp)
    dec_to_bin(tmp)
    tmp=8380417*tmp
    print("3: ",tmp)
    dec_to_hex(tmp)
    dec_to_bin(tmp)
    z=x-tmp
    print("4: ",z)
    dec_to_hex(z)
    dec_to_bin(z)
    print("5: ",z-8380417," (ignore if negative)")
    dec_to_hex(z-8380417)
    dec_to_bin(z-8380417)
    if(z>=8380417):
        z=z-8380417
    print("result: ",z)
    dec_to_hex(z)
    dec_to_bin(z)
    print("Expected result : ",x%8380417)
    dec_to_hex(x%8380417)
    dec_to_bin(x%8380417)


def mod_mul(a,b,select):
    """
    select : "Kyber" ; "Dilithium"
    """
    print("\n\na: ",a)
    dec_to_hex(a)
    dec_to_bin(a)
    print("b: ",b)
    dec_to_hex(b)
    dec_to_bin(b)
    tmp=a*b
    print("a*b: ",tmp)
    dec_to_hex(tmp)
    dec_to_bin(tmp)
    print("")
    if(select=="Kyber"):
        if(0<=tmp<11082241):
            barrett_K(tmp)
        else:
            print("Out of bounds")
    elif(select=="Dilithium"):
        if(0<=tmp<70231389093889):
            barrett_D(tmp)
        else:
            print("Out of bounds")
    else:
        print("Selection error")



mod_mul(sys.argv[1],sys.argv[2],sys.argv[3])
#mod_mul(3745,1734,"Kyber")
#mod_mul(183,2748,"Kyber")
#mod_mul(1974,3218,"Kyber")
#mod_mul(5736491,8327146,"Dilithium")
#mod_mul(4597194,8356396,"Dilithium")
#mod_mul(3147455,7744730,"Dilithium")