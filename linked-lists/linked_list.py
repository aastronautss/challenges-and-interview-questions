class ListNode:
    def __init__(self, val=None, next_node=None):
        self.val = val
        self.next_node = next_node

    def append(self, val):
        current = self
        while current.next_node != None:
            current = current.next_node

        current.next_node = ListNode(val)
