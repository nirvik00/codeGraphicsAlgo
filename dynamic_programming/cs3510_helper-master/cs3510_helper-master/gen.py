import sys

class Vertex:
    def __init__(self, coordinate):
        self.coordinate = coordinate  # (1,1), (3,2) and such
        self.neighbors = {}  # neighbor vertex -> weight
        self.dist = float("inf")

    def add_neighbor(self, neighbor, weight=1):
        self.neighbors[neighbor] = weight

    def get_weight(self, neighbor):
        return self.neighbors[neighbor]

    def __str__(self):
        return str(self.coordinate)

class Graph:
    def __init__(self):
        self.vertices = []
        self.edgelist = []

    def add_vertex(self, v):
        self.vertices.append(v)

    def get_vertex(self, coordinate):
        for v in self.vertices:
            if v.coordinate == coordinate:
                return v

    def bellman_ford(self, source):
        print('Starting Bellman-ford algorithm from source ' + str(source))

        for v in self.vertices:
            v.dist = float("inf")
        source.dist = 0
        print('Initial condition:')
        self.print_dist()

        iteration = 1
        while True:
            print('Begin iteration ' + str(iteration) + ':')
            debug = input('press e to walk through edge ordering and dist updates. To jump to next iteration, press n: ')
            isupdated = False
            for e in self.edgelist:
                u = e[0]
                v = e[1]
                print('\nAt edge {} -> {}'.format(u, v))
                vdist_old = v.dist
                print('dist {}: {}, edge weight: {}, dist {}: {}'.format(
                    u, u.dist,
                    u.get_weight(v),
                    v, v.dist
                ))
                v.dist = min(v.dist, u.dist + u.get_weight(v))
                if vdist_old != v.dist:
                    print('{} + {} < {}'.format(u.dist, u.get_weight(v), vdist_old))
                    print('dist to {} updated from {} to {}'.format(v, vdist_old, v.dist))
                    isupdated = True
                else:
                    print('{} + {} >= {}'.format(u.dist, u.get_weight(v), v.dist))
                    print('no update')
                if debug == 'e':
                    input('press Enter')
            print('\nEnd iteration ' + str(iteration) + ':')
            self.print_dist()
            if not isupdated:
                print('No update done...breaking out of the loop')
                break
            iteration += 1
        print('***** STATS *****')
        print('Bellman-ford completed in ' + str(iteration) + ' iterations')
        print('Final shortest distances from source {}:'.format(source))
        self.print_dist()

    def print_dist(self):
        s = ''
        for v in self.vertices:
            s +=  v.__str__() + ': ' + str(v.dist)+ '\n'
        print(s)


def main():
    k = 2

    graph = Graph()

    for i in range(1, k + 1):
        for j in range(1, k + 1):
            coordinate = (i, j)
            v = Vertex(coordinate)
            graph.add_vertex(v)

    print('The following edges are in lexicographically sorted order.')
    for u in graph.vertices:
        row = u.coordinate[0]
        col = u.coordinate[1]
        if row > 1:
            up_coordinate = (row - 1, col)
            vertex_up = graph.get_vertex(up_coordinate)
            #w = input('Set edge weight for {} -> {}: '.format(str(u.coordinate), str(vertex_up.coordinate)))
            w=1
            u.add_neighbor(vertex_up, int(w))
            graph.edgelist.append((u, vertex_up))
        if col > 1:
            left_coordinate = (row, col - 1)
            vertex_left = graph.get_vertex(left_coordinate)
            #w = input('Set edge weight for {} -> {}: '.format(str(u.coordinate), str(vertex_left.coordinate)))
            w=1
            u.add_neighbor(vertex_left, int(w))
            graph.edgelist.append((u, vertex_left))
        if col < k:
            right_coordinate = (row, col + 1)
            vertex_right = graph.get_vertex(right_coordinate)
            #w = input('Set edge weight for {} -> {}: '.format(str(u.coordinate), str(vertex_right.coordinate)))
            w=1
            u.add_neighbor(vertex_right, int(w))
            graph.edgelist.append((u, vertex_right))
        if row < k:
            down_coordinate = (row + 1, col)
            vertex_down = graph.get_vertex(down_coordinate)
            #w = input('Set edge weight for {} -> {}: '.format(str(u.coordinate), str(vertex_down.coordinate)))
            w=1
            u.add_neighbor(vertex_down, int(w))
            graph.edgelist.append((u,vertex_down))

    print('')
    source = graph.get_vertex((1,1))
    graph.bellman_ford(source)


if __name__ == '__main__':
    main()
