# A child can hop up the stairs in intervals of 1, 2, or 3 stairs. Write a
# function that computes the number of possible ways in which the child can
# hop up n stairs.

def stair_hops(num_stairs):
    if num_stairs == 0:
        return 0
    return stair_hops_memo(num_stairs, 0)

def stair_hops_memo(stairs_left, count):
    if stairs_left == 0:
        return count + 1
    if stairs_left < 0:
        return count

    return count + stair_hops_memo(stairs_left-1, 0) + stair_hops_memo(stairs_left-2, 0) + stair_hops_memo(stairs_left-3, 0)
