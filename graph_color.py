# input : vertices and edges

# vertices of the graph
V=[0,1,2,3,4]

# construct 2d array to hold adjacency matrix
adj=[[1],[0,2,4],[1,3,4],[2,4],[1,2,3]]
"""
adj.append([1])         #   0
adj.append([0,2,4])     #   1
adj.append([1,3,4])     #   2
adj.append([2,4])       #   3
adj.append([1,2,3])     #   4
"""

#adj=[[1,4],[0,2],[1,3,4],[2,4],[0,1,2,3]]
#adj=[[1],[0,2,3],[1,3,5],[1,2,4],[3,5],[2,4]]# 5 vertices are used update V (line 4)


# used to check vertex color of adjacent vertices
used=[]

#set all used[i]=False
for i in range(len(V)):  
    used.append(False)

# color assigned to each vertex
# set all colors to -1
color=[]    
for i in range(len(V)):  
    color.append(-1)

# set color of 0 to 0
color[0]=0          

for i in range(1,len(V)):
    print('\n----iteration:%s------'%(i))    
    print('adjacent vertices at %s are %s'%(i,adj[i]))
    
    #  find colors of adj vertices as boolean(true)of each color_integer    
    for j in range(len(adj[i])):
        if(color[adj[i][j]]!=-1): 
            used[color[adj[i][j]]]=True        


    # as soon as an integer is flagged as false, it can color the vertex
    # if all integers are used, increment the integer count and color
    color_req=-1
    for j in range(len(V)):
        if(used[j]==False):
            color_req=j
            break
    color[i]=color_req
    
    print('used colors explored ',used)
    # make unused colors available
    for j in range(0,len(adj[i])):
        if(color[adj[i][j]]==-1):            
            used[color[j]]=False

    print("# color for vertex %s is:%s "%(i,color[i]))
    print('and adjacent color : ',used)

print("\nFINAL COLOR VECTOR is:%s "%(color))
print("\nFINAL USED VECTOR is:%s "%(used))



