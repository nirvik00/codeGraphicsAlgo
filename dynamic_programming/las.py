li=[1,2,1,3,2]
#li=[1,10,3,4,25,6,6,7,11,12,13,14,16]

f_li=[]
i=0
while i<len(li):
    j=i
    inc=True
    dec=False
    x=li[i]
    temp=[]
    temp.append(x)
    c1=0
    while j<len(li):
        #print(" li[j]:%s v.s. %s (inc:%s dec:%s)" %(li[j],x, inc, dec))
        if inc==True and li[j]>x:
            c1+=1
            inc=False
            dec=True
            x=li[j]
            temp.append(x)
        if dec==True and li[j]<x:
            c1+=1
            inc=True
            dec=False
            x=li[j]
            temp.append(x)                   
        j+=1
    #print(c1)
    #print(temp)
    f_li.append(temp)
    i+=1
    
i=0
while i<len(f_li):
    print(f_li[i])
    i+=1
