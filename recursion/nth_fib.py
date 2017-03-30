# Write a function that returns the nth fibonacci number

# O(n^2) time
def fib(n):
    if n == 0:
        return 0
    if n == 1:
        return 1
    return fib(n - 1) + fib(n - 2)

# O(n) time
def better_fib(n):
    return fib_memo(n, {})

def fib_memo(i, memo):
    if i == 0 or i == 1:
        return i
    if not memo.get(i):
        memo[i] = fib_memo(i - 1) + fib_memo(i - 2)
    return memo[i]
