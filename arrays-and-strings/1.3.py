import re

def urlify(string, length):
    string = string.strip()
    return re.sub(' ', '%20', string)
