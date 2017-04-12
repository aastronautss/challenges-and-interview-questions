import binary_tree_node

class MinHeap:
    def __init__(self, root=None):
        super(MinHeap, self).__init__()
        self.root = root

    def insert(self, val):
        node = BinaryTreeNode(val)
        parent = self._fill_tree(node)

    def _fill_tree(self, node, current=self.root):

