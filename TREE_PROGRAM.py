import networkx as nx
import matplotlib.pyplot as plt
G=nx.Graph()
G.add_nodes_from([0,1,2,3,4,5,6,7,8,9,10,11])
edge_list=[(0,1),(1,3),(1,3),(1,5),(1,4),(2,4),(2,1),(2,0),(2,5),(2,6),(3,2),(3,5),(3,6)]
G=nx.Graph(edge_list)
nx.draw(G)
plt.show()
