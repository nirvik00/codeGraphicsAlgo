li=[1,10,3,4,5,6,6,7,11,12,13,14,16]
m=[]
n=1
c0=1
f_li=[]
for i in range(len(li)):    
    t_li=[]
    t_li.append(li[i])
    curr_val=li[i]
    c1=1
    for j in range(i,len(li)):
        if(li[j]>curr_val):
            curr_val=li[j]
            t_li.append(curr_val)
            n+=1
            c1+=1
    if(c0<c1):
        c0=c1
    f_li.append(t_li)
print("length of LIS: %s"%(c0))
max=0
idx=-1
k=0
for i in f_li:
    print("iteration %s : %s" %(k,i))
    n=len(i)
    if(n>max):
        max=n
        idx=k
    k+=1

print("LIS : length=%s and sequence=%s" %(max,f_li[idx]))



