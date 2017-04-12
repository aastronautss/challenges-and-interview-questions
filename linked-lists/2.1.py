# Remove duplicates from a sorted list.

from linked_list import ListNode

def remove_dup(head):
    seen = set()
    current = head
    prev = None
    while current != None:
        if current.val in seen:
            prev.next_node = current.next_node
        else:
            seen.add(current.val)
            prev = current
        current = current.next_node
    return head
