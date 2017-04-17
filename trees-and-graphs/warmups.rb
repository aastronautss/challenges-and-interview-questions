require_relative './binary_tree_node'

# Write a function to perform a breadth-first search on a binary tree.

def bfs(root, target)
  queue = []
  queue << root

  until queue.empty?
    current = queue.shift

    next if current.nil?
    return true if current.val == target

    queue << current.left
    queue << current.right
  end

  return false
end

# Write a function to perform a depth-first search on a binary tree.

def dfs(root, target)
  return false if root.nil?
  return true if root.val == target

  return dfs(root.left, target) || dfs(root.right, target)
end

# Write funcitons that computes the maximum and minimum depths of a binary tree

def max_depth(root)
  return 0 if root.nil?

  left, right = root.left, root.right

  1 + [max_depth(left), max_depth(right)].max
end

def min_depth(root)
  return 0 if root.nil?

  left, right = root.left, root.right

  1 + [min_depth(left), min_depth(right)].min
end

# Write a function that returns true if a binary tree is height-balanced

def height_balanced(root)
  return true if root.nil?

  left, right = root.left, root.right
  left_depth, right_depth = max_depth(left), max_depth(right)

  (left_depth - right_depth) <= 1 &&
    height_balanced(left) &&
    height_balanced(right)
end

# Write a function that returns the lowest common ancestor of two members in a
# binary tree

def lowest_common_ancestor(root, a, q)
  return nil unless has_descendents(root, a, q)

  lowest_common_ancestor(root.left, a, q) ||
    lowest_common_ancestor(root.right, a, q) ||
    root
end

def has_descendents(node, a, q)
  bfs(node, a) && bfs(node, q)
end

# Write a function that returns true if a binary tree is a binary search tree

def is_bst(root)
  return true if root.nil?

  left, right = root.left, root.right
  left_valid = left.nil? || left.val < root.val
  right_valid = right.nil? || root.val < right.val

  return false unless left_valid && right_valid

  is_bst(left) && is_bst(right)
end
