#
# Recursion warmups
#

# Write a recursive function that computs the sum of all numbers from 1 to n.

# Is not tail call optimized
def recurse_sum(n):
    if n <= 1:
        return 1
    return n + recurse_sum(n - 1)

# Is tail call optimizied
def tail_recurse_sum(n):
    if n <= 1:
        return 1
    acc = tail_recurse_sum(n - 1)
    return n + acc

# Write a recursive function that finds and returns the minimum element in
# a list

def find_min(seq):
    if len(seq) == 1:
        return seq[0]
    current_min = find_min(seq[1:])
    return seq[0] if seq[0] < current_min else current_min

# Write a recursive function that returns the sum of the elements in a list

def sum_of_eles(seq):
    if len(seq) == 1:
        return seq[0]
    running_sum = sum_of_eles(seq[1:])
    return seq[0] + running_sum

# Write a recursive function that determines whether an array is a palindrome.

def is_palindrome(seq):
    if len(seq) <= 1:
        return True
    inner_is_palindrome = is_palindrome(seq[1:-1])
    return inner_is_palindrome and seq[0] == seq[-1]

# Write a recursive function that searches for a target in a sorted array using binary search.

def binsearch(seq, item):
    if len(seq) == 0:
        return False
    if len(seq) == 1:
        return item == seq[0]
    center = int(len(seq)/2)
    if seq[center] == item:
        return True
    if item < seq[center]:
        return binsearch(seq[:center], item)
    if item > seq[center]:
        return binsearch(seq[center:], item)
