import time

def fib(n):
    #if (n in memo):return memo[n]
    if(n>2):
        f = fib(n-1)+fib(n-2)
        memo[n]=f
        return f
    else:
        return 1

memo={}
n=35
start_time=time.time()
print ("started computing ....\n\n")
print ("COMPUTED VALUE = %s" %(fib(n)))

elapsed_time=(time.time()-start_time)*1000
print("\n\n\ntime taken = %s %s" %(elapsed_time, "milliseconds"))

#output :
#index : 1 2 3 4 5 6  7  8  9  10  11  12
#value : 1 1 2 3 5 8 13 21 34  55  89 144

