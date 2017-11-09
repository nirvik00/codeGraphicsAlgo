nFib={}
# n = n-1 in websites
n=100000
for i in range(n):
    if(i<=2):
        f=1
    else:
        f=nFib[i-1]+nFib[i-2]
    nFib[i]=f
print('fibonacci of %s th value' %(n))
print(nFib[n-1])
