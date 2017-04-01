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

# Write a recursive function that searches for a target in a sorted array using
#  binary search.

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

# Write a function that takes in a base and an exponent and recursively
# computes the exponent of the base (without using **, of course)

def exponent(base, exp):
    if exp == 0:
        return 1
    if exp == 1:
        return base
    mem = exponent(base, exp - 1)
    return base * mem

# Write a function using recursion to print then umbers from n to 0

def countdown(n):
    if n < 0:
        return
    print(n)
    countdown(n - 1)

# Write a function using recursion to print numbers from 0 to n

def countup(n):
    if n < 0:
        return
    countup(n - 1)
    print(n)

# Write a function using recursion that takes a string and returns a reversed
# copy of the string. The only string operation used should be string
# concatenation

def reverse(string):
    if len(string) == 1:
        return string
    mem = reverse(string[1:])
    return mem + string[0]

# Recursively produce a sequence of numbers from 3 to 9 with exclusive bounds.

def exclusive_range(min, max):
    if x + 1 >= y - 1:
        return [x]
    mem = range(x + 1, y)
    return [x + 1].concat(mem)
