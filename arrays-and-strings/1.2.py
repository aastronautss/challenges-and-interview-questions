# Count hash solution

def are_permutations(str1, str2):
    if len(str1) != len(str2):
        return False

    char_counts1 = {}
    char_counts2 = {}

    for i in range(len(str1)):
        char1 = str1[i]
        char2 = str2[i]
        char_counts1[char1] = 1 if not char_counts1.get(char1) else char_counts1[char1] + 1
        char_counts2[char2] = 1 if not char_counts2.get(char2) else char_counts2[char2] + 1

    for char in char_counts1:
        if char_counts1.get(char) != char_counts2.get(char):
            return False

    return True
