corr_index_li=[]
n=100

for i in range(n):
    if((i-1)%3==0):
        corr_index_li.append([i,i+1])
        print([i,i+1])
