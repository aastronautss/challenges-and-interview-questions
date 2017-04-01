# A magic index of a list L is an index such that L[i] == i. Given a sorted
# list of distinct integers, write a method to find a magic index, if one
# exists, in list L.

def magic_index(lst):
    return magic_index_mem(lst, 0, len(lst) - 1)

def magic_index_mem(lst, start, end):
    if len(lst) == 0:
        return None
    center_idx = int(end - start / 2)
    center_val = lst[center_idx]
    if center_idx == center_val:
        return start + center_idx
    if center_idx < center_val:
        return magic_index_mem(lst, start, center_idx - 1)
    return magic_index_mem(lst, start + center_idx, end)
