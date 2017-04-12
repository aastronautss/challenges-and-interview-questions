from graph import GraphNode

def route_exists(node1, node2):
    if node1 == node2:
        return True
    if node1 == None:
        return False



    queue = []
    node1.marked = True
    queue.append(node1)

    while len(queue) != 0:
        r = queue.pop(0)
        for n in r.children:
            found_path = found_path or route_exists(n, node2)
            if n.marked:
                n.marked = True
                queue.append(n)

    return found_path

start = GraphNode(1)
end = GraphNode(2)

print(route_exists(start, start))

start.children.append(end)

print(route_exists(start, end))
