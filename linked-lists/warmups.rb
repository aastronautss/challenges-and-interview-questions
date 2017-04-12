require_relative './linked_list'

# ====-----------------------------====
# Iterative Solutions
# ====-----------------------------====

# Remove nodes matching value n

def remove_node(head, val)
  current = head
  until current.next_node.nil?
    if head.val == val
      current.next_node = current.next_node.next_node
    end

    current = current.next_node
  end

  head
end

# Remove duplicates from a sorted list.

def remove_dup(head)
  current = head
  until current.next_node.nil?
    while head.val == head.next_node.val
      head.next_node = head.next_node.next_node
    end

    current = current.next_node
  end

  head
end

# Revese a given list

def reverse_list(head)
  new_list = ListNode.new head.val
  current = head

  until current.next_node.nil?
    current = current.next_node
    new_node = ListNode.new current.val, new_list
    new_list = new_node
  end

  new_list
end

# Reverse a portion of a list given that portion's starting and ending indices

def reverse_portion(head, start_idx, end_idx)
  current = head
  front = ListNode.new nil, current
  current_idx = 0

  while current_idx < start_idx
    front = current
    current = current.next_node
    current_idx += 1
  end

  new_list = nil

  while current_idx < end_idx
    new_node = ListNode.new current.val, new_list
    new_list = new_node

    current = current.next_node
    current_idx += 1
  end

  front.next_node = new_list
  new_list.append current

  head
end

# Reverse a given list without using an additional data structure (in place)

def reverse_list_in_place(head)
  prev = nil
  current = head
  next_node = head.next_node

  until next_node.nil?
    current.next_node = prev

    prev = current
    current = next_node
    next_node = next_node.next_node
  end

  current
end

# Merge two sorted linked lists

def merge_lists(head1, head2)
  current1, current2 = head1, head2
  new_list = ListNode.new

  until current1.nil? || current2.nil?
    if current1.val <= current2.val
      new_list.append current1.val
      current1 = current1.next_node
    else
      new_list.append current2.val
      current2 = current2.next_node
    end
  end

  new_list.append(current1.nil? ? current2 : current1)
  new_list.next_node
end

def merge_lists_in_place(head1, head2)
  dummy = ListNode.new
  temp = dummy

  until head1.nil? || head2.nil?
    if head1.val <= head2.val
      temp.next_node = head1
      temp = temp.next_node
      head1 head1.next_node
    else
      temp.next_node = head2
      temp = temp.next_node
      head2 = head2.next_node
    end
  end

  temp.next_node = head2 if head1.nil?
  temp.next_node = head1 if head2.nil?

  dummy.next_node
end

# ====-----------------------------====
# Recursive Solutions
# ====-----------------------------====

# Remove nodes matching value n

def remove_node_recur(head, val)
  return nil if head.nil?

  if head.val == val
    return remove_node_recur(head.next_node, val)
  end

  head.next_node = remove_node_recur(head.next_node, val)
  head
end

# Remove Duplicates from a sorted list.

def remove_dup_recur(head)
  return nil if head.nil?

  if head.val == head.next_node.val
    return remove_dup_recur(head.next_node)
  end

  head.next_node = remove_dup_recur(head.next_node)
  head
end

# Reverse a given list

def reverse_list_recur(head)
  return head if head.next_node.nil?

  new_head = reverse_list_recur(head.next_val)
  head.next_node = nil
  new_head.append head
  new_head
end

# ====-----------------------------====
# Other Types of Problems
# ====-----------------------------====

# Delete a node from a linked list, given access only to the node we wish
# to delete

def delete_this_node(node)
  node.val = node.next_node.val
  node.next_node = node.next_node.next_node
  return node
end
