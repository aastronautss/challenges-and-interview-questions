import re

def is_palindrome_permutation(string):
    char_counts = {}
    string = string.lower()
    for char in string:
        if re.match(r'[a-z]', char):
            char_counts[char] = 1 if not char_counts.get(char) else char_counts[char] + 1
    return not has_more_than_one_odd(char_counts)

def has_more_than_one_odd(counts):
    found_odd = False
    for key in counts:
        count = counts[key]
        if count % 2 != 0:
            if found_odd:
                return True
            found_odd = True
    return False
