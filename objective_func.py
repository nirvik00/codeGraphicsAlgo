import random
import math

def fitness(num, target):
    f=target/(math.fabs(target-num) + target)
    print(str(num)+"/"+str(target)+" : "+str(f))

for i in range(0,510,10):
    fitness(i,100)
