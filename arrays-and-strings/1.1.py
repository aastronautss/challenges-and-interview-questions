# Solutions with additional data structures

def all_unique(string):
    chars_seen = set()
    for char in string:
        if char in chars_seen:
            return False
        else:
            chars_seen.add(char)

    return True

# Solutions without additional data structures

def all_unique_small(string):
    for i in range(len(string)):
        for j in range(i + 1, len(string)):
            if string[i] == string[j]:
                return False

    return True

def all_unique_small_sorting(string):
    sorted_string = sorted(string)
    for i in range(len(string) - 1):
        if sorted_string[i] == sorted_string[i + 1]:
            return False

    return True
