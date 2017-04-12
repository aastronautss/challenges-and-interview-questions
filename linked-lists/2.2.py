# Return the kth to last node

import linked_list

def kth_to_last(head, k):
    lead = tail = head
    while lead != None and k >= 0:
        lead = lead.next_node
    while lead != None:
        lead = lead.next_node
        tail = tail.next_node
    return tail.val
